# Relay

Handler for any relay with any number of channels.
It requires only GPIO numbers that control it (in form of a table)
Last parameter is a callback

## constructor

relay_handler.new(channels, broadcast_changes, callback) 

- channels, {gpio1 gpio2...}
```
    CHANNELS = {1}
```
- broadcast_changes- if set, channels.response will be broadcasted with each channel.on/off
- callback - called after channel.on/off in form of:
``` 
    self.callback('channel.on', channel)
    self.callback('channel.off', channel)
```

## Set channel state

Send a message:

    {
        'protocol': 'iot:1',
        'node': 'computer',
        'chip_id': 'd45656b45afb58b1f0a46',
        'event': 'channel.on',
        'parameters': {
            'channel': 3
        },
        'targets': [
            'ALL'
        ]
    }
  
Event *channel.on* enables and *channel.off* disable the relay. 
The channel number must be send in *parameters.channel* .    
    
## Read channels state

Send a message:

    {
        'protocol': 'iot:1',
        'node': 'computer',
        'chip_id': 'd45656b45afb58b1f0a46',
        'event': 'channel.states',
        'targets': [
            'ALL'
        ]
    }

Response:

    {
        "chip_id": 425761,
        "protocol": "iot:1",
        "node":"big-room-support-light", 
        "targets":
            ["ALL"],
        "event":"channels.response",
        "response":
            [0,1,0,0]
    }    
    

## Register worker in handler and listener:
    
    print ("core ready")
    CHANNELS = {2, 3, 4, 1}
    PORT = 5053
    network_message = require "network_message"
    relay_handler = require "relay_handler"
    server_listener = require "server_listener"
    
    handler = relay_handler(CHANNELS)
    
    -- add handlers to listener
    server_listener.add("relay", handler)
    
    -- run server
    server_listener.start(PORT)

## with autosending changes

    relay_handler = require "relay_handler"
    switch_handler = relay_handler(CHANNELS, 1)

## With callback
    
    cb = function(event, nil, channel_or_channels)
        print("event :"..event)
    end
    r_handler = relay_handler({3}, cb) 
    
    