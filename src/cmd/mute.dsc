chat_mute:
  type: command
  name: mute
  description: Mutes a player for a specified duration
  usage: /mute <&lt>player<&gt> (<&lt>duration<&gt>)
  permission: chat.mute
  required: 1
  tab completions:
    1: <server.online_players.exclude[<server.online_players_flagged[chat.muted]>].exclude[<player>].parse[name]>
  script:
  - inject cmd_args
  - define user <context.args.first>
  - inject cmd_player
  - if <[user]> == <player>:
    - define reason "You can't mute yourself!"
    - inject cmd_err
  - if <context.args.size> < 2:
    - define duration 30m
  - else:
    - if not <context.args.get[2].as[duration].exists>:
      - define reason "Invalid duration!"
      - inject cmd_err
    - define duration <context.args.get[2]>
  - flag <[user]> chat.muted expire:<[duration]>
  - narrate "<green>Muted <&[emphasis]><[user].name> <green>for <gold><[duration].formatted_words><green>."
  - narrate "<red>You've been muted for <gold><[duration].formatted_words><red>!" targets:<[user]>

chat_unmute:
  type: command
  name: unmute
  description: Unmutes a player
  usage: /unmute <&lt>player<&gt>
  permission: chat.mute
  required: 1
  tab completions:
    1: <server.online_players_flagged[chat.muted].parse[name]>
  script:
  - inject cmd_args
  - define user <context.args.first>
  - inject cmd_player
  - if not <[user].has_flag[chat.muted]>:
    - define reason "That player isn't muted!"
    - inject cmd_err
  - flag <[user]> chat.muted:!
  - narrate "<green>Unmuted <&[emphasis]><[user].name><green>."
  - narrate "<green>You've been unmuted!" targets:<[user]>
