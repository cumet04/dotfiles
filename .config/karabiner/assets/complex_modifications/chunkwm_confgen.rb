require 'json'

def conf
    mod1 = "left_control"
    mod2 = "right_option"
    {
        title: 'chunkwm key bindings',
        rules: [
            rule("move window", 
                hotkey_for_command(
                    [ mod1, mod2 ], "close_bracket", 
                    "/usr/local/bin/chunkc tiling::window --swap next"
                ),
                hotkey_for_command(
                    [ mod1, mod2 ], "open_bracket", 
                    "/usr/local/bin/chunkc tiling::window --swap prev"
                ),
                *( (1..9).map(&:to_s).map{ |i| 
                    hotkey_for_command(
                        [ mod1, mod2 ], i, 
                        "/usr/local/bin/chunkc tiling::window --send-to-desktop #{i}"
                    )
                } )
            ),
            rule("focus window", 
                hotkey_for_command(
                    [ mod1 ], "close_bracket", 
                    "/usr/local/bin/chunkc tiling::window --focus next"
                ),
                hotkey_for_command(
                    [ mod1 ], "open_bracket", 
                    "/usr/local/bin/chunkc tiling::window --focus prev"
                ),
            ),
            rule("resize", 
                hotkey_for_command(
                    [ mod1 ], "h", 
                    "/usr/local/bin/chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge west"
                ),
                hotkey_for_command(
                    [ mod1 ], "l", 
                    "/usr/local/bin/chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge east"
                ),
                hotkey_for_command(
                    [ mod1 ], "k", 
                    "/usr/local/bin/chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge north"
                ),
                hotkey_for_command(
                    [ mod1 ], "j", 
                    "/usr/local/bin/chunkc tiling::window --use-temporary-ratio 0.05 --adjust-window-edge south"
                ),
                hotkey_for_command(
                    [ mod1 ], "f", 
                    "/usr/local/bin/chunkc tiling::window --toggle fullscreen"
                ),
            ),
        ]
    }
end

def rule(desc, *rules)
    {
        description: desc,
        manipulators: rules
    }
end

def hotkey_for_command(mod, key, command)
    {
        type: "basic",
        from: {
            key_code: key,
            modifiers: {
                mandatory: mod
            }
        },
        to: [
            {
                shell_command: command
            }
        ]
    }
end


puts JSON.pretty_generate(conf)
