require "facebook/messenger"
include Facebook::Messenger
# include Facebook::Messenger::Thread

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
# Facebook::Messenger::Profile.set({
#   greeting: [
#     {
#       locale: 'default',
#       text: 'Welcome to your new bot overlord!'
#     }
#   ]
# }, access_token: ENV['ACCESS_TOKEN'])

Facebook::Messenger::Profile.set({
  get_started: {
    payload: 'GET_STARTED_PAYLOAD'
  },
  persistent_menu: [
    {
      locale: 'default',
      composer_input_disabled: false,
      call_to_actions: [
        {
          title: 'My Account',
          type: 'nested',
          call_to_actions: [
            {
              title: 'What\'s a chatbot?',
              type: 'postback',
              payload: 'EXTERMINATE'
            },
            {
              title: 'History',
              type: 'postback',
              payload: 'HISTORY_PAYLOAD'
            },
            {
              title: 'Contact Info',
              type: 'postback',
              payload: 'CONTACT_INFO_PAYLOAD'
            }
          ]
        },
        {
          type: 'web_url',
          title: 'Get some help',
          url: 'https://github.com/hyperoslo/facebook-messenger',
          webview_height_ratio: 'full'
        }
      ]
    }
  ]
}, access_token: ENV['ACCESS_TOKEN'])

Bot.on :message do |message|
  p message

  Bot.deliver({
    recipient: message.sender,
    message: {
      text: message.text
    }
  }, access_token: ENV["ACCESS_TOKEN"])
end