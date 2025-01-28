# Technic.scad

An OpenSCAD Technic-compatible piece generator. It currently supports generation of beams, axles, pin connectors, axle pins, elbows, and 24-tooth gears.

Modules
=======

`technic_24_tooth_gear();`
--------------------------
![A 24-tooth gear compatible with LEGO part #3648.](images/Technic%2024-Tooth%20Gear.png)

| Parameter | Values| Description |
|---|---|---|
| `width` | int | In multiples of the original gear width, how wide should it be? e.g., a width of 3 would generate a single gear with the same total width as three gears set side-by-side. |

`technic_axle();`
-----------------
![An axle compatible with LEGO part #3704.](images/Technic%20Axle.png)

Generate a Technic-compatible axle.

| Parameter | Values| Description |
|---|---|---|
| `length` | int | The length of the axle in "studs." |

`technic_axle_pin();`
--------------------------
![An axle pin compatible with LEGO part #11214.](images/Technic%20Axle%20Pin.png)

| Parameter | Values| Description |
|---|---|---|
| `axle_length` | int | In studs, how long the axle component should be. |
| `pin_length` | int | In studs, how long the pin component should be. |
| `friction` | bool | Whether the pin component should have friction ridges on it. |

`technic_beam();`
-----------------
![A beam compatible with LEGO part #32524, for example.](images/Technic%20Beam.png)

Generate a Technic-compatible beam.

| Parameter | Values| Description |
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

| Parameter | Values| Description |
|---|---|---|
| `height` | int | The height of the bush. |

`technic_elbow();`
--------------------------
![A 90º elbow compatible with LEGO part #25214.](images/Technic%20Elbow.png)

| Parameter | Values| Description |
|---|---|---|
| `length` | int | The number of studs one leg would cover, if laid down on a plate. |
| `width` | int | The number of studs the other leg would cover, if laid down on a plate. |
| `axle_socket_on_length` | bool | Whether there should be an interior socket for accepting an axle on the X axis. |
| `axle_socket_on_width` | bool | Whether there should be an interior socket for accepting an axle on the Y axis. |

`technic_pin();`
--------------------------
![A pin compatible with LEGO part #2780.](images/Technic%20Pin.png)

| Parameter | Values| Description |
|---|---|---|
| `top_length` | int | In studs, how long the top half of the pin should be. |
| `top_friction` | bool | Whether the top half of the pin should have friction ridges on it. |
| `bottom_length` | int | In studs, how long the bottom half of the pin should be. |
| `bottom_friction` | bool | Whether the bottom half of the pin should have friction ridges on it. |

`technic_pin_connector();`
--------------------------
![A pin connector compatible with LEGO part #18654.](images/Technic%20Pin%20Connector.png)

| Parameter | Values| Description |
|---|---|---|
| `length` | int | The length of the pin connector in "studs." FWIW, LEGO only makes these in length 1. |
