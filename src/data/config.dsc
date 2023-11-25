chat_config:
  type: data
  channels:
    global:
      targets: <server.online_players>
      color: <white>
      description: all players
    near:
      targets: <player.location.find_players_within[50]>
      color: <light_purple>
      description: players in a 50-block radius

chat_prefix:
  type: procedure
  debug: false
  script:
  - if not <player.has_flag[rank]>:
    - determine <player.name><&co>
  # Built-in integration with rank
  - define rank <player.flag[rank].proc[rank_get]>
  - define color <[rank].get[color].parsed>
  # Display rank info when hovering over the player's name - color is distinguishable by itself
  - define name <[color]><player.name.on_hover[<[color]><[rank].get[name]>]>
  - determine "<[name]><gray>:"

chat_join:
  type: procedure
  debug: false
  script:
  - determine "<gray><player.name> joined the game"

chat_leave:
  type: procedure
  debug: false
  script:
  - determine "<gray><player.name> left the game"
