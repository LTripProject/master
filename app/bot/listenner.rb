require "facebook/messenger"
include Facebook::Messenger
# include Facebook::Messenger::Thread

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
Facebook::Messenger::Profile.set({
  get_started: {
    payload: 'GET_STARTED_PAYLOAD'
  },
  greeting: [
    {
      locale: 'default',
      text: 'Please choose the option below to get more infomation!'
    }
  ],
  persistent_menu: [
    {
      locale: 'default',
      composer_input_disabled: false,
      call_to_actions: [
        {
          type: 'postback',
          title: '👌 get top trips(get top)',
          payload: 'get top'
        },
        {
          type: 'postback',
          title: '☝ Trợ giúp nhanh (get help)',
          payload: 'get help'
        },
        {
          type: 'web_url',
          title: '📬  Góp ý, báo lỗi, xoạc',
          url: 'https://m.me/dthtien'
        }
      ]
    }
  ]
}, access_token: ENV['ACCESS_TOKEN'])

Bot.on :message do |message|
  MessengerCommand.new(message.sender, message.text).execute
end

Bot.on :postback do |postback|
  MessengerCommand.new(postback.sender, postback.payload).execute
end