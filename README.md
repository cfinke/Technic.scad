# Technic.scad

An OpenSCAD Technic-compatible piece generator. It currently supports generation of beams, axles, pin connectors, axle pins, elbows, and gears.

Modules
=======

`technic_axle();`
-----------------
![An axle compatible with LEGO part #3704.](images/Technic%20Axle.png)

Generate a Technic-compatible axle.

| Parameter | Type | Description |
|---|---|---|
| `length` | int | The length of the axle in "studs." |
| `stop` | bool | Whether there is a stop at the end. |
| `stud` | bool | Whether there is a stud at the end. |

`technic_axle_connector();`
--------------------------
![An axle connector compatible with LEGO part #6538a.](images/Technic%20Axle%20Connector.png)

Generate a Technic-compatible axle connector.

| Parameter | Type | Description |
|---|---|---|
| `length` | int | The length of the axle connector in "studs." |
| `ridged` | bool | Whether the connector should have ridges on it. |

`technic_axle_pin();`
--------------------------
![An axle pin compatible with LEGO part #11214.](images/Technic%20Axle%20Pin.png)

Generate a Technic-compatible axle pin.

| Parameter | Type | Description |
|---|---|---|
| `axle_length` | int | In studs, how long the axle component should be. |
| `pin_length` | int | In studs, how long the pin component should be. |
| `friction` | bool | Whether the pin component should have friction ridges on it. |

`technic_axle_and_pin_connector();`
![An axle and pin connector compatible with LEGO part #32184.](images/Technic%20Axle%20and%20Pin%20Connector.png)

Generate a Technic-compatible axle and pin connector.

| Parameter | Type | Description |
|---|---|---|
| `length` | int | In studs, how long the connector should be. |
| `height` | int | How tall the connector should be, in multiples of the standard connector height. |

`technic_beam();`
-----------------
![A beam compatible with LEGO part #32524, for example.](images/Technic%20Beam.png)

Generate a Technic-compatible beam.

| Parameter | Type | Description |
|---|---|---|
| `length` | int | The number of holes in the beam. |
| `height` | int | The height (or thickness?) of the beam in multiples of normal beams. |
| `angle` | float | The change in angle (clockwise) that will occur at the vertex'th hole. |
| `vertex` | int | The number of the hole at which the angle should change, if the angle param is not zero. |
| `axle_holes` | int[] | An array of hole positions that should be axle holes, starting at 1. |

`technic_bush();`
-----------------
![A bush compatible with LEGO part #4265c, for example.](images/Technic%20Bush.png)

Generate a Technic-compatible bush.

| Parameter | Type | Description |
|---|---|---|
| `height` | int | The height of the bush. |
| `stud_cutouts` | bool | Whether one end should have cutouts in the edge to fit between studs. Only applies to heights greater than 1/2. |

`technic_connector_hub();`
--------------------------
![A connector hub compatible with LEGO part #27940, for example.](images/Technic%20Connector%20Hub.png)

Generate a Technic-compatible connector hub.

| Parameter | Type | Description |
|---|---|---|
| `hub_height` | int | The height of the hub, in Technic units. |
| `hub_type` | string | What type of hub should it be? Either "axle" or "pin". |
| `spoke_lengths` | float[] | How long should each spoke be? |
| `spoke_angles` | float[] | At what angle should each spoke connect? |
| `spoke_heights` | float[] | How high up on the hub should each spoke be placed? |
| `spoke_types` | string | What type of connector should each spoke be? Either "axle", "axle connector", "pin", "bar connector" or "tow ball". |

`technic_elbow();`
--------------------------
![A 90º elbow compatible with LEGO part #25214.](images/Technic%20Elbow.png)

Generate a Technic-compatible 90º elbow.

| Parameter | Type | Description |
|---|---|---|
| `length` | int | The number of studs one leg would cover, if laid down on a plate. |
| `width` | int | The number of studs the other leg would cover, if laid down on a plate. |
| `axle_socket_on_length` | bool | Whether there should be an interior socket for accepting an axle on the X axis. |
| `axle_socket_on_width` | bool | Whether there should be an interior socket for accepting an axle on the Y axis. |

`technic_gear_double_sided();`
--------------------------
![A spur gear compatible with LEGO part #3648.](images/Technic%20Gear%20%28Double-Sided%29.png)

Generate a Technic-compatible double-sided spur gear.

| Parameter | Type | Description |
|---|---|---|
| `width` | int | In multiples of the original gear width, how wide should it be? e.g., a width of 3 would generate a single gear with the same total width as three gears set side-by-side. |
| `teeth` | int | How many teeth should the gear have? The minimum reasonable value is probably 14. |

`technic_gear_single_sided();`
--------------------------
![A single-sided gear, compatible with LEGO part #6589.](images/Technic%20Gear%20%28Single-Sided%29.png)

Generate a single-sided gear, sometimes called a half-gear.

| Parameter | Type | Description |
|---|---|---|
| `teeth` | int | How many teeth should the gear have? The minimum reasonable value is probably 10. |
| `bevel` | bool | Should the gear teeth be beveled? |
| `center_hole` | string | What connector should the center hole be compatible with? Supported values are "axle" and "pin". |

`technic_pin();`
--------------------------
![A pin compatible with LEGO part #2780.](images/Technic%20Pin.png)

Generate a Technic-compatible pin.

| Parameter | Type | Description |
|---|---|---|
| `top_length` | int | In studs, how long the top half of the pin should be. |
| `top_friction` | bool | Whether the top half of the pin should have friction ridges on it. |
| `bottom_type` | string | What should the bottom of the pin be? "pin", "tow ball", "stud", or "bush" |
| `bottom_length` | int | In studs, how long the bottom half of the pin should be. |
| `bottom_friction` | bool | Whether the bottom half of the pin should have friction ridges on it. |
| `multiplier` | int | Should this generate multiple sets of connected pins? If so, how many? |
| `squared_pin_holes` | bool | Whether the slits in the ends of the pins should be along the same plane instead of parallel to each other. |

`technic_pin_connector();`
--------------------------
![A pin connector compatible with LEGO part #18654.](images/Technic%20Pin%20Connector.png)

Generate a Technic-compatible pin connector.

| Parameter | Type | Description |
|---|---|---|
| `length` | int | The length of the pin connector in "studs." FWIW, LEGO only makes these in length 1. |

`technic_tire();`
--------------------------
![A tire connector compatible with LEGO part #89201.](images/Technic%20Tire.png)

Generate a Technic-compatible tire.

| Parameter | Type | Description |
|---|---|---|
| `tread_width` | float | Width of the tire tread. |
| `diameter` | float | Outer diameter of the tire. |
| `tread_thickness` | float | Thickness of the tire tread. |

`technic_wheel();`
--------------------------
![A wheel compatible with LEGO part #20896.](images/Technic%20Wheel.png)

Generate a Technic-compatible wheel (also referred to as rims).

| Parameter | Type | Description |
|---|---|---|
| `diameter` | float | The diameter of the wheel. |
| `width` | float | The width of the wheel, across where the tread would lie. |
| `center_groove` | bool | Whether it has a center groove for holding a tire in place. |
| `hole_type` | string | Is the center hole for an "axle" or a "pin"? |
| `spoke_count` | int | How many spokes should it have? |
| `spoke_style` | string | What style of spoke does it have? Only "double" is supported now. |

`technic_worm_gear();`
--------------------------
![A worm gear compatible with LEGO part #4716.](images/Technic%20Gear%20%28Worm%29.png)

Generate a Technic-compatible worm gear.

| Parameter | Type | Description |
|---|---|---|
| `height` | float | The height of the gear, in Technic units. |
| `width` | int | The width of the gear, in some unknown units. The two real-world Technic worm gears seem to be roughly multiples of 3.5mm (3x and 4x), and values outside of 3-5 don't really work. |
| `opening` | string | Whether the opening should be axle shaped, or the half-axle/half-circle shape that some new gears use. "axle" or "axle2" |
