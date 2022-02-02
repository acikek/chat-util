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
  - determine <player.name><&co>

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