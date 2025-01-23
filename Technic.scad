/**
 * LEGO and Technic are trademarks of the LEGO Group.
 *
 * For standard LEGO-compatible bricks, see LEGO.scad. This module
 * is specifically for parts without studs, like gears and axles.
 *
 * Copyright (c) 2025 Christopher Finke
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

$fa = 1; $fs = 0.05;

stud_length_in_ms = 8;

technic_axle_spline_thickness = 1.8;
technic_axle_spline_width = 4.75;
technic_axle_spline_corner_radius = 0.4;
technic_axle_cross_section_radius = 1;

module technic() {
	technic_axle( length = 10 );
}

/**
 * Axles.
 *
 * part #3704:  technic_axle( length = 2 );
 * part #4519:  technic_axle( length = 3 );
 * part #3705:  technic_axle( length = 4 );
 * part #32073: technic_axle( length = 5 );
 * part #3706:  technic_axle( length = 6 );
 * part #44294: technic_axle( length = 7 );
 * part #3707:  technic_axle( length = 8 );
 * part #60485: technic_axle( length = 9 );
 * part #3737:  technic_axle( length = 10 );
 * part #23948: technic_axle( length = 11 );
 * part #3708:  technic_axle( length = 12 );
 * part #50451: technic_axle( length = 16 );
 * part #50450: technic_axle( length = 32 );
 */
module technic_axle(
	length=2, // The length in studs. An axle of length 2 will be the same length as a 2-stud brick.
) {
	                       technic_axle_spline( length = length );
	rotate( [ 0, 0, 90 ] ) technic_axle_spline( length = length );
}

/**
 * Generate one of the axle splines. An axle is made up of two splines, rotated 90º from each other.
 */
module technic_axle_spline( length ) {
	// To get the rounded corners when viewing the spline looking at the long wide side, we need
	// to intersect it with rounded rectangle turned 90º in that direction.
	intersection() {
		rotate([90,0,0])
			linear_extrude( technic_axle_spline_thickness, center = true )
				technic_rounded_rectangle( width = technic_axle_spline_width, height = stud_length_in_ms * length, radius = technic_axle_cross_section_radius );

		linear_extrude( stud_length_in_ms * length, center = true )
			technic_rounded_rectangle( technic_axle_spline_width, technic_axle_spline_thickness, technic_axle_spline_corner_radius );
	};
}

/**
 * Generate a rounded rectangle.
 */
module technic_rounded_rectangle( width = 1, height = 1, radius = 0.1 ) {
	union() {
		// Position a circle to act as each rounded corner of the axle.
		translate([-( width / 2 ) + radius,  ( height / 2 ) - radius, 0]) circle(r = radius);
		translate([ ( width / 2 ) - radius,  ( height / 2 ) - radius, 0]) circle(r = radius);
		translate([ ( width / 2 ) - radius, -( height / 2 ) + radius, 0]) circle(r = radius);
		translate([-( width / 2 ) + radius, -( height / 2 ) + radius, 0]) circle(r = radius);

		// Now add squares to fill in the spaces between the circles in each direction.
		square([width - ( radius * 2 ), height],                  center = true);
		square([width,                  height - ( radius * 2 )], center = true);
	};
}

technic();