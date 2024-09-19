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

    -- user def state below --

    dev_h = nil, --device_handle from avionics_device.new_device(..) will be stored here.
    -- this allows us to do things like "click the screen and request keyboard focus"

    click_counter = 0,
    flag_dbg_draw_screen = false,
    flag_dbg_draw_bez = false,

}


function example_device.bezel_click( self, x,y, state )
    self.click_counter = self.click_counter + 1
end

function example_device.bezel_right_click( self, x,y, state )
end

function example_device.bezel_scroll( self, x,y, wheel, clicks )
end

function example_device.bezel_cursor( self, x,y )
end


function example_device.screen_click( self, x,y, state )
    self.dev_h:take_keyboard()
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
    --Drawing with SASL API currently doesn't work.
    --Support for other drawing API's can be added.
    local col_red = {1, 0, 0}
    sasl.gl.drawCircle( 10, 10, 50, true, col_red )
end


function example_device.draw_bezel( self, ambient_r, ambient_g, ambient_b )
end



local av = require("avionics_device")

--save as global so that gc doesnt destroy the device.
dev_h = av.new_device( example_device )
example_device.dev_h = dev_h

dev_h:set_popup_visible( true )

