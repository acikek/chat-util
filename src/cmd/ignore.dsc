chat_ignore:
  type: command
  name: ignore
  description: Ignores a player's messages
  usage: /ignore <&lt>player<&gt>
  required: 1
  permission: chat.ignore
  tab completions:
    1: <server.players_flagged[chat.ignore].exclude[<player>].filter_tag[<[filter_value].flag[chat.ignore].contains[<player>].not>].parse[name]>
  script:
  - inject cmd_args
  - define user <context.args.first>
  - inject cmd_player
  - if <[user]> == <player>:
    - define reason "You can't ignore yourself!"
  - else if <[user].has_flag[chat.ignore]> and <player> not in <[user].flag[chat.ignore]>:
    - define reason "You're already ignoring this player!"
  - inject cmd_err
  - flag <[user]> chat.ignore:->:<player>
  - narrate "<green>Now ignoring <&[emphasis]><[user].name><green>."

chat_unignore:
  type: command
  name: unignore
  description: Stops ignoring a player's messages
  usage: /unignore <&lt>player<&gt>
  required: 1
  permission: chat.ignore
  tab completions:
    1: <server.players_flagged[chat.ignore].exclude[<player>].filter_tag[<[filter_value].flag[chat.ignore].contains[<player>]>].parse[name]>
  script:
  - inject cmd_args
  - define user <context.args.first>
  - inject cmd_player
  - if !<[user].has_flag[chat.ignore]> or <player> not in <[user].flag[chat.ignore]>:
    - define reason "You aren't ignoring this player!"
    - inject cmd_err
  - flag <[user]> chat.ignore:<-:<player>
  - narrate "<green>Un-ignored <&[emphasis]><[user].name><green>."
