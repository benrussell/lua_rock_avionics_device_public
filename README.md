# Lua Rock: X-Plane Avionics Device API

## What is it?
Avionics Device API extensions for X-Plane Lua scripting plugins.
* Works with SASL 3.17.xx
* Should work with xLua and derivatives.
* Does not work with Gizmo64-Global.



## Usage:

```lua
local example_device = {...}

local av = require("avionics_device")
--save as global so that gc doesnt destroy the device.
dev_h = av.new_device( example_device )

dev_h:set_popup_visible( true )

--save the device handle so we can access it from callbacks
example_device.dev_h = dev_h
```



## Example Script:
See [example.lua](/example.lua)



## Using with SASL:
_SASL-v3.17.2 only.  SASL-v3.2.7 will crash._
1. Download avionics_device.zip (not available yet)
3. Copy `avionics_device.so`, `avionics_device.dylib` and `avionics_device.dll` into the `SASL/data/modules/Custom Module/` folder.
4. The call to `require("avionics_device")` from Lua scripts should now work.
5. Copy `/example.lua` from this site into  `SASL/data/modules/main.lua`
6. Change example script to suit your needs.


## Using with xLua:
* Untested.

The correct location to copy the avionics_device.* files to needs to be determined. This shouldn't be too difficult.



## API
See [API.md](/API.md) for more.



## License
* This is a commercial project. 
* A registration key is required for each avionics device. (Calulated from Device ID and Description data.)
* A watermark will be drawn on your device during unregistered use.
* No restrictions on re-distribution or sale.
* You may re-distribute the required avionics_device.* files with your product.
* There are no per-player license fees.


## Contact
For enquiries contact br@x-plugins.com