# Technic.scad

An OpenSCAD Technic-compatible piece generator. It currently supports generation of axles and pin connectors.

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

