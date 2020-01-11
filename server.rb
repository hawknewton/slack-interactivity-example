#!/usr/bin/env ruby

Bundler.require(:default)

SLACK_URL = 'https://hooks.slack.com/services/XXXXXX/XXXXXX/XXXXXXXXXXXXXXXXXXXXX'

post '/hello' do
  json = JSON.parse(request.body.read, symbolize_names: true)

  text = "Hi #{json[:name]}"

  body = {
    text: text,
    blocks: [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: text
        }
      },
      {
        type: 'actions',
        elements: [
          {
            type: 'button',
            text: {
              type: 'plain_text',
              emoji: true,
              text: 'Hi Hawk'
            },
            value: 'click_me_123'
          }
        ]
      }
    ]
  }

  RestClient.post(SLACK_URL,  JSON.dump(body), 'Content-Type': 'application/json')
end

post '/slack-webhook' do
  payload = JSON.parse(params[:payload], symbolize_names: true)

  puts payload

  body = {
    text: "#{payload[:user][:username]} says hi!"
  }

  RestClient.post(SLACK_URL,  JSON.dump(body), 'Content-Type': 'application/json')
end
