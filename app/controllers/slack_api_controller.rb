class SlackApiController < ActionController::API
  def hello
    client = Slack::Web::Client.new
    client.auth_test
    client.chat_postMessage(channel: '#general', text: 'Hello World', as_user: true)
    client.chat_postMessage(
      channel: '#slackアプリ作成',
      text: 'こんにちは'
    )
  end
end
