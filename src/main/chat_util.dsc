chat_handler:
  type: world
  debug: false
  events:
    on player chats:
    - determine passively cancelled
    - if <player.has_flag[chat.mute]>:
      - narrate "<red>You are muted!"
    - else:
      - define channel <script[chat_config].data_key[channels].get[<player.flag[chat.channel]>]>
      - narrate "<proc[chat_prefix]> <[channel].get[color].parsed><context.message>" targets:<[channel].get[targets].parsed>
    on player joins:
    - determine <proc[chat_join]>
    on player quits:
    - determine <proc[chat_leave]>
    after player joins flagged:!chat.channel:
    - flag <player> chat.channel:global