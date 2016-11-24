#!/usr/bin/env ruby
require 'dotenv'
require 'telegram/bot'
Dotenv.load
token = ENV['TOKEN']

puts "It's alive!"
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
     bot.api.send_message(chat_id: message.chat.id, text: "Hi, I'm the cookingbot, how can I help you?")
   when '/recipes'
      bot.api.send_message(chat_id: message.chat.id, text: "What are your ingredients?")
    end
  end
end
