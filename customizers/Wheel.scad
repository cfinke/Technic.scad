/**
 * LEGO and Technic are trademarks of the LEGO Group.
 *
 * For standard LEGO-compatible bricks, see LEGO.scad. This module
 * is specifically for parts without studs, like gears and axles.
 *
 * Copyright (c) 2025 Christopher Finke (cfinke@gmail.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

include <../Technic.scad>;

/* [General] */

// Diameter of the wheel.
wheel_diameter = 9.9; // [ 0.1 : 100 ]

// Width of the wheel.
wheel_width = 14; // [ 0.5 : 100 ]

// What kind of center hole should it have?
wheel_hole_type = "axle"; // [ "axle", "pin" ]

// Should it have a center groove?
wheel_center_groove = true; // [ true, false ]

// How many spokes?
wheel_spoke_count = 6; // [ 0 : 100 ]

color( "gray" ) technic_wheel(
	diameter = wheel_diameter,
	width = wheel_width,
	center_groove = wheel_center_groove,
	hole_type = wheel_hole_type,
	spoke_count = wheel_spoke_count
);
