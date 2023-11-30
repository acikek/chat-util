chat_ignore:
  type: command
  name: ignore
  description: Ignores a player's messages
  usage: /ignore <&lt>player<&gt>
  required: 1
  permission: chat.ignore
  tab completions:
    1: <server.online_players.exclude[<player>|<player.flag[chat.ignoring].if_null[<list>]>].parse[name]>
  script:
  - inject cmd_args
  - define user <context.args.first>
  - inject cmd_player
  - if <[user]> == <player>:
    - define reason "You can't ignore yourself!"
  - else if <[user]> in <player.flag[chat.ignoring].if_null[<list>]>:
    - define reason "You're already ignoring this player!"
  - inject cmd_err
  - flag <[user]> chat.ignored_by:->:<player>
  - flag <player> chat.ignoring:->:<[user]>
  - narrate "<green>Now ignoring <&[emphasis]><[user].name><green>."

chat_unignore:
  type: command
  name: unignore
  description: Stops ignoring a player's messages
  usage: /unignore <&lt>player<&gt>
  required: 1
  permission: chat.ignore
  tab completions:
    1: <player.flag[chat.ignoring].parse[name].if_null[<list>]>
  script:
  - inject cmd_args
  - define user <context.args.first>
  - inject cmd_player
  - if <[user]> not in <player.flag[chat.ignoring].if_null[<list>]>:
    - define reason "You aren't ignoring this player!"
    - inject cmd_err
  - flag <[user]> chat.ignored_by:<-:<player>
  - flag <player> chat.ignoring:<-:<[user]>
  - narrate "<green>Un-ignored <&[emphasis]><[user].name><green>."
