# Avionics Device Lua API

## Device Interaction and Control
A device instance is Lua has the following API:
```lua
device_instance = {
    function needs_drawing( self ) 
    end,

    function set_popup_visible( self, bool_show )
    end,

    function is_popup_visible( self ) 
        return bool_visible
    end,

    function popout( self )
    end,

    function is_popped_out( self ) 
        return bool_popped
    end,

    function take_keyboard( self )
    end,

    function has_keyboard( self ) 
        return bool_has_kbd_focus
    end,

    function get_geo( self ) 
        return left,top,right,bottom
    end,

    function set_geo( self, left,top,right,bottom )
    end,

    function get_geo_os( self ) 
        return left,top,right,bottom
    end,

    function set_geo_os( self, left,top,right,bottom )
    end,
}
```

### Usage:
```lua
dev_h = av.new_device( dev_definition_tbl )

dev_h:set_popup_visible( true )
dev_h:popout()
dev_h:take_keyboard()
```





## Device Creation and Destruction:
```lua
function avionics_device.new_device( device_params_tbl )
    -- See the Device Interaction and Control section for
    -- the defintion of device_instance
    return device_instance
end
```

The `device_params_tbl` has a mandatory structure.

The `device_params_tbl` is passed as the value of `self` to the member functions. You can use it as a refcon to store persistent state.

```lua
local example_device = {
    name = "Lua Avionics Device",
    description = "Avionics Device powered by Lua Rocks extension module.",

    drm_key = "1234",
    
    width = 800,
    height = 600,

    bez_width = 1024,
    bez_height = 768,

    off_x = 50,
    off_y = 50,

    draw_on_demand = 0,
}


function example_device.bezel_click( self, x,y, state )
end

function example_device.bezel_right_click( self, x,y, state )
end

function example_device.bezel_scroll( self, x,y, wheel, clicks )
end

function example_device.bezel_cursor( self, x,y )
end


function example_device.screen_click( self, x,y, state )
end

function example_device.screen_right_click( self, x,y, state )
end

function example_device.screen_scroll( self, x,y, wheel, clicks )
end

function example_device.screen_cursor( self, x,y )
end


function example_device.keypress( self, key, flags, vkey, losing_focus )
end

function example_device.brightness( self, rheo, ambient_brightness, bus_volts_ratio )
end


function example_device.draw_screen( self )
end


function example_device.draw_bezel( self, ambient_r, ambient_g, ambient_b )
end
```

