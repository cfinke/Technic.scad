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

// Length of the top end of the pin, in studs
pin_top_length = 1; // [ 0:0.5:100 ]

// Should the top pin end have friction ridges?
pin_top_friction = true; // [ true, false ]

// Length of the bottom end of the pin, in studs
pin_bottom_length = 1; // [ 0:0.5:100 ]

// Should the bottom pin end have friction ridges?
pin_bottom_friction = true; // [ true, false ]

// How many sets of pins should there be?
pin_multiplier = 1; // [ 0:100 ]

// If a multiple pin, should there be axle holes between each set of pins?
pin_axle_holes = true; // [ true, false ]

// Should the slits in the ends of the pin form a continuous line instead of being parallel with each other? This only really matters for models with pin_multiplier > 1.
pin_squared_pin_holes = false; // [ true, false ]

color( "white" ) technic_pin(
	top_length = pin_top_length,
	top_friction = pin_top_friction,
	bottom_length = pin_bottom_length,
	bottom_friction = pin_bottom_friction,
	multiplier = pin_multiplier,
	axle_holes = pin_axle_holes,
	squared_pin_holes = pin_squared_pin_holes
);
