
function ready() {
  console.log("ready function start-------");

	setup(logSubscription);
	if (navigator.serviceWorker) {
	  navigator.serviceWorker.register('/serviceworker.js', { scope: './' })
	    .then(function(reg) {
	    	console.log(reg.scope, 'register');
	      console.log('[Companion]', 'Service worker registered!');
	    });
	} else {
	    alertSWSupport();
	}
}


function setup(onSubscribed) {
  console.log('Setting up push subscription');

  if (!window.PushManager) {
    console.warn('Push messaging is not supported in your browser');
  }

  if (!ServiceWorkerRegistration.prototype.showNotification) {
    console.warn('Notifications are not supported in your browser');
    return;
  }

  if (Notification.permission !== 'granted') {
    Notification.requestPermission(function (permission) {
      // If the user accepts, let's create a notification
      if (permission === "granted") {
        console.log('Permission to receive notifications granted!');
        subscribe(onSubscribed);
      }
    });
    return;
  } else {
    console.log('Permission to receive notifications granted!');
    subscribe(onSubscribed);
  }
}

function subscribe(onSubscribed) {
	console.log('subscribe....');
  navigator.serviceWorker.ready.then(function (serviceWorkerRegistration) {
    var pushManager = serviceWorkerRegistration.pushManager;
    console.log("pushManager", pushManager);
    pushManager.getSubscription().then(function (subscription) {
      console.log("after pushManager.getSubscription(), subscription =", subscription)
      if (subscription) {
        refreshSubscription(pushManager, subscription, onSubscribed);
      } else {
        pushManagerSubscribe(pushManager, onSubscribed);
      }
    });
  });
}

function refreshSubscription(pushManager, subscription, onSubscribed) {
  console.log('Refreshing subscription');
  return subscription.unsubscribe().then(function (bool) {
    console.log('Refreshing subscription: pushManagerSubscribe');
    pushManagerSubscribe(pushManager, onSubscribed);
  });
}

function pushManagerSubscribe(pushManager, onSubscribed) {
  console.log('pushManagerSubscribe started...');
  var config = {
    applicationServerKey: window.publicKey,
    userVisibleOnly: true
  }
  pushManager.subscribe(config).then(onSubscribed).then(function () {
    console.log('Subcribing finished: success!');
  })['catch'](function (e) {
    if (Notification.permission === 'denied') {
      console.warn('Permission to send notifications denied');
    } else {
      console.error('Unable to subscribe to push', e);
    }
  });
}

function serverSubscribe(subscription) {
  console.log("serverSubscribe",subscription);
  window.usersubscription = JSON.stringify(subscription);
  var body = JSON.stringify({ subscription: subscription });
  return fetch("/subscribe", {
    headers: formHeaders(),
    method: 'POST',
    credentials: 'include',
    body: body
  })['catch'](function (e) {
    logger.error("Could not save subscription", e);
  });
}

function serverUnsubscribe() {
  window.usersubscription = null;

  return fetch("/unsubscribe", {
    headers: formHeaders(),
    method: 'DELETE',
    credentials: 'include'
  })['catch'](function (e) {
    logger.error("Could not save subscription", e);
  });
}

function logSubscription(subscription) {
  var s = subscription;
  var data = {
    endpoint: s.endpoint,
    p256dh: btoa(String.fromCharCode.apply(null, new Uint8Array(s.getKey('p256dh')))).replace(/\+/g, '-').replace(/\//g, '_'),
    auth: btoa(String.fromCharCode.apply(null, new Uint8Array(s.getKey('auth')))).replace(/\+/g, '-').replace(/\//g, '_')
  }
  console.log(data);
  serverSubscribe(subscription);
  console.log("Current subscription", subscription.toJSON());
}

function getSubscription() {
  return navigator.serviceWorker.ready.then(function (serviceWorkerRegistration) {
    return serviceWorkerRegistration.pushManager.getSubscription()['catch'](function (error) {
      console.warn('Error during getSubscription()', error);
    });
  });
}

function sendNotification() {
  getSubscription().then(function (subscription) {
    console.log("subscription", subscription.toJSON());
    return fetch("/push", {
      headers: formHeaders(),
      method: 'POST',
      credentials: 'include',
      body: JSON.stringify({ subscription: subscription.toJSON() })
    }).then(function (response) {
      console.log("Push response", response);
      if (response.status >= 500) {
        console.error(response.statusText);
        alert("Sorry, there was a problem sending the notification. Try resubscribing to push messages and resending.");
      }
    })['catch'](function (e) {
      console.error("Error sending notification", e);
    });
  });
}

function formHeaders() {
  return new Headers({
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-Token': authenticityToken()
  });
}

function authenticityToken() {
  return document.querySelector('meta[name=csrf-token]').content;
}

$(document).ready(function() {
	ready();
});
