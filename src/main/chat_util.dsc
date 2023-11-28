chat_handler:
  type: world
  debug: false
  events:
    on player chats:
    - determine passively cancelled
    - if <player.has_flag[chat.muted]>:
      - narrate "<red>You are muted!"
      - stop
    - define channel <script[chat_config].data_key[channels].get[<player.flag[chat.channel]>]>
    - define targets <[channel].get[targets].parsed.exclude[<player.flag[chat.ignore].if_null[<list>]>]>
    - narrate "<proc[chat_prefix]> <[channel].get[color].parsed><context.message>" targets:<[targets]>
    - customevent id:player_chats context:[message=<context.message>;channel=<[channel]>;targets=<[targets]>]
    on player joins:
    - determine <proc[chat_join]>
    on player quits:
    - determine <proc[chat_leave]>
    after player joins flagged:!chat.channel:
    - flag <player> chat.channel:global
