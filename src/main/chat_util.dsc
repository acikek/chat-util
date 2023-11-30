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
    - definemap context:
        channel: <[channel]>
        recipients: <[channel].get[targets].parsed.exclude[<player.flag[chat.ignored_by].if_null[<list>]>]>
        full_text: <proc[chat_prefix]> <[channel].get[color].parsed><context.message>
        format: <context.format>
    - customevent id:player_chats context:<[context]> save:event
    - if not <entry[event].was_cancelled>:
      - narrate <[context.full_text]> targets:<[context.recipients]>
    on player joins:
    - determine <proc[chat_join]>
    on player quits:
    - determine <proc[chat_leave]>
    after player joins flagged:!chat.channel:
    - flag <player> chat.channel:global
