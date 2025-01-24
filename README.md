# Technic.scad

An OpenSCAD Technic-compatible piece generator. It currently supports generation of axles, pin connectors, axle pins, and 24-tooth gears.

![The default ouput of each Technic.scad module.](images/Technic.png)

Modules
=======

`technic_axle();`
-----------------
![An axle compatible with LEGO part #3704.](images/technic_axle.png)

Generate a Technic-compatible axle.

| Parameter | Values| Description |
|---|---|---|
| `length` | int | The length of the axle in "stud widths." |

`technic_pin_connector();`
--------------------------
![A pin connector compatible with LEGO part #18654.](images/technic_pin_connector.png)

| Parameter | Values| Description |
|---|---|---|
| `length` | int | The length of the pin connector in "stud widths." FWIW, LEGO only makes these in length 1. |

`technic_24_tooth_gear();`
--------------------------
![A 24-tooth gear compatible with LEGO part #3648.](images/technic_24_tooth_gear.png)

| Parameter | Values| Description |
|---|---|---|
| `width` | int | In multiples of the original gear width, how wide should it be? e.g., a width of 3 would generate a single gear with the same total width as three gears set side-by-side. |

`technic_axle_pin();`
--------------------------
![An axle pin compatible with LEGO part #11214.](images/technic_axle_pin.png)

| Parameter | Values| Description |
|---|---|---|
| `axle_length` | int | In stud widths, how long the axle component should be. |
| `pin_length` | int | In stud widths, how long the pin component should be. |
| `friction` | bool | Whether the pin component should have friction ridges on it. |
