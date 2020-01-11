# Overview
This is an example project showing how to handle interactivity from slack.  It uses [Slack Bot Kit](https://api.slack.com/block-kit) to add a button to a message and [Slack app interactivity](https://api.slack.com/interactivity) to receive a webhook and post a message back to the user.

# Setup

## Local machine
You'll need to install ruby 2.6.5 and bundler on your machine.  I use [rbenv](https://github.com/rbenv/rbenv) which isn't entirely terrible.

```
$ rbenv install 2.6.5
$ gem install bundler
```

Then, install the gems in Gemfile
```
$ bundle install
```

Finally, you're ready to start the test server
```
$ bundle exec ./server.rb
```

## Change slack url

Modify [server.rb](./server.rb) and change the `SLACK_URL` to your applcation's webhook url.

## Get a development URL
In this example I use [localhost.run](https://localhost.run) to expose my local development instance to the internet to that Slack can invoke my app under development.  You may have to do some fancy footwork to install ssh if you're running on a windows box:

```
$ ssh -R 80:localhost:4567 ssh.localhost.run
Connect to http://xxxxx.localhost.run or https://xxxxx.localhost.run
```

Make note of your localhost.run https url, it'll change every time you start a new tunnel.

## Setup slack webooks

Set the `Request URL` for your app (as described [here](https://api.slack.com/interactivity/handling#setup)) to the localhost.run https URL above with `/slack-webhook` appended.  For example, if your localhost.run https URL is `https://awesome-123.localhost.run` you'll set `RequestURL to `https://awesome-123.localhost.run/slack-webhook`.

# Running the example

Finally, test it out:

```
$ curl -X POST -d '{"name": "Gregg"}' -H 'Content-Type: application/json' http://localhost:4567/hello
```
