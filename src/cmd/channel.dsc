chat_channel:
  type: command
  name: channel
  description: Switches your current channel
  usage: /channel <&lt>name<&gt>
  aliases:
  - c
  - chat
  permission: chat.channel
  tab completions:
    1: <script[chat_config].data_key[channels].keys>
  script:
  - if <context.args.is_empty>:
    - foreach <script[chat_config].data_key[channels]> key:name as:data:
      - narrate "<&[emphasis]>/channel <[name]> <&[base]>to target <[data].get[description]>."
    - stop
  - if <context.args.first> not in <script[chat_config].data_key[channels].keys>:
    - define reason "That channel doesn't exist!"
    - inject cmd_err
  - flag <player> chat.channel:<context.args.first.to_lowercase>
  - narrate "<green>Now chatting in <&[emphasis]><context.args.first.to_lowercase><green>."
