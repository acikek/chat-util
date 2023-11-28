# chat-util

Various chat utilities

## About

### Commands

#### channel

**Permission**: `chat.channel`<br>
Switches the chat channel. Configurable in the `chat_config` data script.

#### ignore

**Permission**: `chat.ignore`<br>
Ignores a player's messages. `unignore` is the reverse of this command.

#### mute

**Permission**: `chat.mute`<br>
Mutes a player for a duration of time. `unmute` is the reverse of this command.

### Config

The `chat_config` data script controls the channels and their data. Each value under the `channels` key is a MapTag with the key being the channel ID. This map contains:
- A `targets` key, which is parsed depending on the player and controls which players shall be targeted in that channel
- A `color` key, which determines the color of the player's message
- A `description` key, which is shown when the player runs `channel` without any arguments

Additionally, below the config, there are 3 procedure scripts that control the prefix of the chat message (everything before the actual message, including the player's name) and join and leave messages.

### Events

The `player_chats` *custom* event replaces the `player chats` event. It includes the same context tags with an additional `<context.channel>` map. The custom event is cancellable.  

## Setup

Clone using git:
```sh
git clone https://github.com/acikek/chat-util
```

### Dependencies

- [Command Utilities](https://forum.denizenscript.com/resources/command-utilities.78/)

## Scripts

### Command

- `chat_channel`
- `chat_ignore`
- `chat_mute`
- `chat_unignore`
- `chat_unmute`

### Data

- `chat_config`

### Procedure

- `chat_join`
- `chat_leave`
- `chat_prefix`

### World

- `chat_handler`

## License

MIT © 2022 Skye P.
