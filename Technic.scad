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

$fa = 1; $fs = 0.05;

// LEGO.scad values.
stud_spacing = 8; // Matches LEGO.stud_spacing
stud_diameter = 4.85; // Matches LEGO.stud_diameter
stud_height = 1.8; // Matches LEGO.stud_height
stud_inner_diameter = 3.1; // Matches LEGO.hollow_stud_inner_diameter
stud_outer_diameter = 4.85; // Matches LEGO.stud_diameter

// Global Technic.scad values.
technic_height_in_mm = 7.8; // Vertically-oriented technic pieces (like pin connectors) use this
technic_hole_diameter = 4.85; // Matches LEGO.stud_diameter
technic_axle_interference_fit_ratio = 1.022;

technic_axle_and_pin_connector_face_thickness = 1; // You would think this would match technic_bush_shoulder_height, but it doesn't really.

technic_axle_spline_thickness = 1.8;
technic_axle_spline_width = 4.85; // Matches LEGO.stud_diameter
technic_axle_spline_corner_radius = 0.4;
technic_axle_cross_section_radius = 1;
technic_axle_stop_thickness = 0.7; // Matches technic_pin_collar_thickness
technic_axle_stop_diameter = 5.9;
technic_axle_stud_height = 1.8; // Matches LEGO.stud_height
technic_axle_stud_inner_diameter = 3.1; // Matches LEGO.hollow_stud_inner_diameter
technic_axle_stud_outer_diameter = 4.85; // Matches LEGO.stud_diameter

technic_bush_big_diameter = 7.4;
technic_bush_small_diameter = 5.8;
technic_bush_shoulder_height = 1.3; // Should this match technic_pin_multiple_center_lip_thickness ?

technic_pin_connector_outer_diameter = 7.36;
technic_pin_connector_wall_thickness = 1.3;
technic_pin_connector_shoulder_wall_thickness = 0.6;
technic_pin_connector_shoulder_depth = 0.70;

technic_gear_12_tooth_gear_diameter = 12.7;
technic_gear_12_tooth_base_thickness = 0.4;
technic_gear_12_tooth_diameter = 12.6;
technic_gear_12_tooth_hub_diameter = 6.3;
technic_gear_12_tooth_lip_inner_diameter = 6.9;
technic_gear_12_tooth_lip_outer_diameter = 8.8;
technic_gear_12_tooth_lip_thickness = 0.8;
technic_gear_12_tooth_tooth_height = 2.4;
technic_gear_12_tooth_tooth_thickness = 2.4;
technic_gear_12_tooth_tooth_width_at_bottom = 1.4;
technic_gear_12_tooth_tooth_width_at_top = 0.8;

technic_gear_24_tooth_outer_diameter = 25.4;
technic_gear_24_tooth_bottom_diameter = 21.65;
technic_gear_24_tooth_inner_diameter = 19.6;
technic_gear_24_tooth_tooth_depth = ( technic_gear_24_tooth_outer_diameter - technic_gear_24_tooth_bottom_diameter ) / 2;
technic_gear_pin_hole_outer_diameter = 6.1;
technic_gear_pin_hole_offset_from_center = 5.675;
technic_gear_pin_hole_thickness = 6.1;
technic_gear_tooth_thickness = 3.7;
technic_gear_wheel_thickness = 1.3;
technic_gear_axle_reinforcement_width = 10;
technic_gear_axle_reinforcement_height = 6;
technic_gear_axle_reinforcement_thickness = 7.73;
technic_gear_axle_slot_length = ( ( technic_gear_pin_hole_offset_from_center * 2 ) + technic_hole_diameter ) * .8; // Close enough :)

technic_pin_outer_diameter = 4.85; // Matches LEGO.stud_diameter.
technic_pin_inner_diameter = 3.1; // Matches LEGO.hollow_stud_inner_diameter
technic_pin_collar_diameter = 5.6;
technic_pin_collar_thickness = 0.7; // Matches technic_axle_stop_thickness
technic_pin_lip_diameter = 5;
technic_pin_lip_thickness = 0.75;
technic_pin_slit_width = 0.75;
technic_pin_slit_length = 3.2;
technic_pin_slot_width = 0.75;
technic_pin_slot_length = 5.2;
technic_pin_friction_thickness = 0.15;
technic_pin_friction_width = 0.8;
technic_pin_friction_vertical_length = 5;
technic_pin_multiple_center_width = 7.8;
technic_pin_multiple_center_lip_thickness = 1.2; // Should this match technic_bush_shoulder_height ?
technic_pin_multiple_offset = 7.75;
technic_pin_multiple_center_lip_overhang = 1.35;

technic_elbow_outer_diameter = 7.9; // Matches LEGO.stud_spacing - LEGO.wall_play
technic_elbow_inner_diameter = 5;
technic_elbow_radius = 12;
technic_elbow_straight_length = 4.85; // Matches LEGO.stud_diameter
technic_elbow_overall_width = 16; // Matches ( LEGO.stud_spacing * 1.5 ) + ( technic_elbow_outer_diameter / 2 )
technic_elbow_axle_socket_depth = 2.4; // Matches LEGO.stud_spacing

technic_beam_hole_spacing = 8; // Matches LEGO.stud_spacing
technic_beam_webbing_thickness = 0.8;

// When OpenSCAD does the preview render, if two objects in a difference() end at exactly
// the same plane, it will show a shadowy 0-thickness layer. If instead, one of the difference()
// children extends any amount past that surface, the preview is much cleaner.
EXTENSION_FOR_DIFFERENCE = 1;

/**
 * Axles.
 *
 * part #3704:  technic_axle( length = 2 );
 * part #3705:  technic_axle( length = 4 );
 * part #3706:  technic_axle( length = 6 );
 * part #3707:  technic_axle( length = 8 );
 * part #3708:  technic_axle( length = 12 );
 * part #3737:  technic_axle( length = 10 );
 * part #4519:  technic_axle( length = 3 );
 * part #6587:  technic_axle( length = 3, stud = true );
 * part #15462: technic_axle( length = 5, stop = true );
 * part #23948: technic_axle( length = 11 );
 * part #24316: technic_axle( length = 3, stop = true );
 * part #32073: technic_axle( length = 5 );
 * part #44294: technic_axle( length = 7 );
 * part #50450: technic_axle( length = 32 );
 * part #50451: technic_axle( length = 16 );
 * part #55013: technic_axle( length = 8, stop = true );
 * part #60485: technic_axle( length = 9 );
 * part #87073: technic_axle( length = 4, stop = true );
 *
 * Origin is centered at the bottom of the axle.
 *
 * @param float length The length of the axle, in Technic units.
 * @param bool stop Whether there is a stop at the end.
 * @param bool stud Whether there is a stud at the end.
 */
module technic_axle(
	length = 2, // The length in studs. An axle of length 2 will be the same length as a 2-stud brick.
	stop = false, // Should it have a stop at the end?
	stud = false, // Should it have a stud on the end?
) {
	translate( [ 0, 0, stud ? technic_axle_stud_height : 0 ] ) {
		// A stud always requires a stop, in my opinion.
		let( has_stop = stop || stud ) {
			difference() {
				union() {
					// If there's a stop (and thus an extra segment of length to cut off, we need to move the axle
					// down a segment, since it's returned from technic_axle_spline with the center of its base at the origin.
					translate( [ 0, 0, has_stop ? - ( stud_spacing ) : 0 ] ) {
						// If there's a stop, add an extra bit of length so that we can cut it off flush without seeing the small bit of rounded corners.
						                       technic_axle_spline( length = has_stop ? length + 1 : length );
						rotate( [ 0, 0, 90 ] ) technic_axle_spline( length = has_stop ? length + 1 : length );
					}

					if ( has_stop ) {
						// The stop itself.
						cylinder( d = technic_axle_stop_diameter, h = technic_axle_stop_thickness );
					}
				}

				if ( has_stop ) {
					// Cut off the extra axle below the stop.
					translate([ 0, 0, -( ( stud_spacing ) + EXTENSION_FOR_DIFFERENCE ) ] ) {
						cylinder( d = technic_axle_spline_width + EXTENSION_FOR_DIFFERENCE, h = ( stud_spacing ) + EXTENSION_FOR_DIFFERENCE );
					}
				}
			}

			if ( stud ) {
				// Add a stud on the bottom.
				translate( [ 0, 0, -technic_axle_stud_height ] ) {
					technic_hollow_stud();
				}
			}
		}
	}

	/**
	 * Generate one of the axle splines. An axle is made up of two splines, rotated 90º from each other.
	 * Positioned with the bottom center of the axle spline at the origin.
	 */
	module technic_axle_spline( length ) {
		translate( [ 0, 0, technic_height_in_mm * length / 2 ] ) {
			rotate( [ 90, 0, 0 ] ) {
				minkowski() {
					union () {
						translate( [ 0, 0, - ( technic_axle_spline_thickness - ( 2 * technic_axle_spline_corner_radius ) ) / 2 ] ) linear_extrude( technic_axle_spline_thickness - ( 2 * technic_axle_spline_corner_radius ) ) {
							technic_rounded_rectangle(
								width = technic_axle_spline_width - ( 2 * technic_axle_spline_corner_radius ),
								height = ( technic_height_in_mm * length ) - ( 2 * technic_axle_spline_corner_radius ),
								radius = technic_axle_cross_section_radius
							);
						}
					}

					sphere( r = technic_axle_spline_corner_radius );
				}
			}
		}
	}
}

/**
 * Axle and pin connectors: they connect axles to pins.
 *
 * part #32184: technic_axle_and_pin_connector( length = 3 );
 *
 * The origin is centered underneath the first axle hole.
 *
 * @param float length The length of the connector, in Technic holes.
 * @param float height The height of the connector, in multiples of standard connector heights.
 */
module technic_axle_and_pin_connector( length = 4, height = 1 ) {
	// Add the two bushes, one on each end.
	                                                     technic_bush( height = height, stud_cutouts = false );
	translate( [ ( length - 1 ) * stud_spacing, 0, 0 ] ) technic_bush( height = height, stud_cutouts = false );

	// Add the connector faces.
	difference() {
		union() {
			difference() {
				union() {
					// The bottom face of the connector.
					hull() {
						cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h = technic_axle_and_pin_connector_face_thickness );

						translate( [ stud_spacing * ( length - 1 ), 0, 0 ] ) {
							cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h = technic_axle_and_pin_connector_face_thickness );
						}
					}

					// The top face of the connector.
					translate( [ 0, 0, ( height * technic_height_in_mm ) - technic_axle_and_pin_connector_face_thickness ] ) { // 1 is the height of the connector, which in LEGO, is always 1, but we could customize.
						hull() {
							cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h = technic_axle_and_pin_connector_face_thickness );

							translate( [ stud_spacing * ( length - 1 ), 0, 0 ] ) {
								cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h = technic_axle_and_pin_connector_face_thickness );
							}
						}
					}

				}

				// Remove the cylinders from the face that are occupied by the bushes.
				translate( [ 0, 0, -EXTENSION_FOR_DIFFERENCE / 2 ] ) {
					cylinder( d = technic_bush_big_diameter, h = ( height * technic_height_in_mm ) + EXTENSION_FOR_DIFFERENCE );

					translate( [ stud_spacing * ( length - 1 ), 0, 0 ] ) {
						cylinder( d = technic_bush_big_diameter, h = ( height * technic_height_in_mm ) + EXTENSION_FOR_DIFFERENCE);
					}
				}
			}

			let ( webbing_thickness = technic_pin_connector_shoulder_wall_thickness ) {
				// The webbing inside the connector, just like it is in a beam.
				translate( [ technic_bush_small_diameter / 2, -(webbing_thickness/2), 0 ] ) cube( [ ( length - 1 ) * stud_spacing - technic_bush_small_diameter, webbing_thickness,( height * technic_height_in_mm ) ] );
			}
		}

		// Remove the cylinders from the center that are occupied by the pin connectors.
		for ( i = [ 1 : length - 2 ] ) {
			for ( j = [ 1 : height ] ) {
				translate( [ i * technic_beam_hole_spacing, 0, ((j-1) * technic_height_in_mm ) + ( technic_height_in_mm / 2 ) ] ) rotate( [ 90, 0, 0 ] ) translate( [ 0, 0, -( technic_height_in_mm / 2 ) ] ) cylinder( d = technic_pin_connector_outer_diameter, h = technic_height_in_mm );
			}
		}
	}

	// Add the pin holes along the center, essentially a beam portion.
	// These protrude every so slightly past the outer connector faces, which looks like an error,
	// but is how those pieces actually are in reality.
	for ( i = [ 1 : length - 2 ] ) {
		for ( j = [ 1 : height ] ) {
			translate( [ i * technic_beam_hole_spacing, 0, ((j-1) * technic_height_in_mm ) + ( technic_height_in_mm / 2 ) ] ) rotate( [ 90, 0, 0 ] ) translate( [ 0, 0, -( technic_height_in_mm / 2 ) ] ) technic_pin_connector();
		}
	}
}

/**
 * Axle/pin combos.
 *
 * part #11214: technic_axle_pin( axle_length = 1, pin_length = 2 );
 *
 * Origin is centered at the bottom of the axle.
 */
module technic_axle_pin(
	axle_length = 1,
	pin_length = 2,
	friction = true
) {
	translate( [ 0, 0, technic_height_in_mm * axle_length ] ) {
		intersection() {
			// Position it so the axle ends at the origin and the pin is above it.
			rotate( [ 180, 0, 0 ] ) {
				// Include a stop, which is the same as the pin collar.
				technic_axle( length = axle_length, stop = true );
			}

			translate( [ 0, 0, -( ( technic_height_in_mm * axle_length ) + EXTENSION_FOR_DIFFERENCE ) ] ) {
				linear_extrude( ( technic_height_in_mm * axle_length ) + EXTENSION_FOR_DIFFERENCE ) {
					circle( d = technic_axle_spline_width + EXTENSION_FOR_DIFFERENCE );
				}
			}
		};

		// The pin collar is already generated in technic_axle() as the stop, so shift the pin down a bit so it's not doubled.
		// @todo In a real piece like this, is the collar part of the axle length or the pin length?
		translate( [ 0, 0, -technic_pin_collar_thickness ] ) {
			technic_pin_half( length = pin_length, friction = friction );
		}
	}
}

/**
 * Beams.
 *
 * part #6629: technic_beam( length = 9, angle = 53.5, vertex = 6, axle_holes = [1, 9] )
 * part #6632: technic_beam( length = 3, height = 1/2, axle_holes = [1, 3] )
 * part #7229: technic_beam( length = 3, axle_holes = [2] )
 * part #11478: technic_beam( length = 5, height = 1/2, axle_holes = [1, 5] )
 * part #18654: technic_beam( length = 1 ) [equivalent to a pin connector]
 * part #32017: technic_beam( length = 5, height = 1/2 )
 * part #32056: technic_beam( length = 5, height = 1/2, angle = 90, vertex = 3, axle_holes = [1,3,5] )
 * part #32063: technic_beam( length = 6, height = 1/2 )
 * part #32065: technic_beam( length = 7, height = 1/2 )
 * part #32140: technic_beam( length = 5, angle = 90, vertex = 4, axle_holes = [1] )
 * part #32271: technic_beam( length = 9, angle = 53.5, vertex = 7, axle_holes = [1, 9] )
 * part #32278: technic_beam( length = 15 )
 * part #32316: technic_beam( length = 5 )
 * part #32348: technic_beam( length = 7, angle = 53.5, vertex = 4, axle_holes = [1, 7] )
 * part #32449: technic_beam( length = 4, height = 1/2, axle_holes = [1, 4] )
 * part #32523: technic_beam( length = 3 )
 * part #32524: technic_beam( length = 7 )
 * part #32525: technic_beam( length = 11 )
 * part #32526: technic_beam( length = 7, angle = 90, vertex = 1 )
 * part #40490: technic_beam( length = 9 )
 * part #41239: technic_beam( length = 13 )
 * part #41677: technic_beam( length = 2, height = 1/2, axle_holes = [1, 2] )
 * part #43857: technic_beam( length = 2 )
 * part #60483: technic_beam( length = 2, axle_holes = [1] )
 *
 * Origin is below the center of the first hole.
 *
 * @param int length How many holes should the beam contain?
 * @param float height How tall (in multiples of technic beam thicknesses) should the beam be?
 * @param float angle The change in angle (clockwise) that will occur at the vertex'th hole.
 * @param int vertex The number of the hole at which the angle should change, if the angle param is not zero.
 * @param array[int] axle_holes Which holes should be axle holes instead.
 */
module technic_beam( length = 5, height = 1, angle = 0, vertex = 1, axle_holes = [] ) {
	// When making the second part of an angled beam, remap the axle hole locations for that smaller beam.
	function angled_axle_holes( all_axle_holes, original_vertex ) = [
		if ( len( all_axle_holes ) > 0 ) for ( i = [ 0 : len( all_axle_holes ) - 1 ] ) if ( all_axle_holes[i] > original_vertex ) all_axle_holes[i] - original_vertex + 1
	];

	// In theory, 120 is the maximum angle before it will interfere with itself.
	// We could limit that, but we'll leave it as an exercise in self-restraint for the reader.
	if ( angle != 0 ) {
		// When it's an angled beam, construct it as the union of two smaller beams.
		// This results in a small extra bit of wall near the vertex hole that
		// wouldn't be present in a real Technic beam, but it's so much simpler
		// to do it this way.
		technic_beam( length = vertex, height = height, angle = 0, axle_holes = axle_holes );

		translate( [ ( vertex - 1 ) * technic_beam_hole_spacing, 0, 0 ] ) {
			rotate( [ 0, 0, angle ] ) {
				technic_beam( length = length - vertex + 1, height = height, angle = 0, axle_holes = angled_axle_holes( axle_holes, vertex ) );
			}
		}
	} else {
		// Generate the pin connectors that make up the inside of the beam.
		for ( i = [ 1 : length ] ) {
			translate( [ technic_beam_hole_spacing * ( i - 1 ), 0, 0 ] ) {
				if ( len( search( i, axle_holes ) ) > 0 ) {
					difference() {
						cylinder( d = technic_pin_connector_outer_diameter, h = height * technic_height_in_mm );

						// @todo This still leaves a tiny bit of extra material in the axle hole at the vertex of an angled beam (if there is one there).
						translate( [ 0, 0, -height * technic_height_in_mm ] ) {
							technic_axle_hole( height = height * 2 );
						}
					}
				} else {
					technic_pin_connector( length = height );
				}
			}
		}

		// Add the walls along the edges of the rows of pins.
		translate( [ 0, -( technic_pin_connector_outer_diameter / 2 ), ( technic_height_in_mm * height ) / 2 ] ) {
			difference() {
				translate( [ 0, 0, -technic_beam_webbing_thickness / 2 ] ) {
					cube( [ ( length - 1 ) * technic_beam_hole_spacing, technic_pin_connector_outer_diameter, technic_beam_webbing_thickness ] );
				}

				union () {
					for ( i = [ 1 : length ] ) {
						translate( [ technic_beam_hole_spacing * ( i - 1 ), technic_pin_connector_outer_diameter / 2, 0 ] ) {
							cylinder( d = technic_pin_connector_outer_diameter, h = technic_beam_webbing_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
						}
					}
				}
			}
		}

		// Add the webbing between the pin connector walls.
		translate( [ 0, - ( technic_pin_connector_outer_diameter / 2 ), 0 ] ) {
			cube( [ ( length - 1 ) * technic_beam_hole_spacing, technic_pin_connector_shoulder_wall_thickness, technic_height_in_mm * height ] );
			translate( [ 0, technic_pin_connector_outer_diameter - technic_pin_connector_shoulder_wall_thickness, 0 ] ) {
				cube( [ ( length - 1 ) * technic_beam_hole_spacing, technic_pin_connector_shoulder_wall_thickness, technic_height_in_mm * height ] );
			}
		}
	}
}

/**
 * Bushes.
 *
 * part #4265c: technic_bush( height = 1/2 );
 * part #3713:  technic_bush( height = 1 )
 *
 * Origin is centered beneath the bush.
 */
module technic_bush( height = 1/2, stud_cutouts = true ) {
	difference() {
		union () {
			difference() {
				// The main inner cylinder that forms the interior walls.
				cylinder( h = height * technic_height_in_mm, d = technic_bush_small_diameter );

				// Bushes at least 1 unit tall have slots in the side (for air? material savings?)
				if ( height >= 1 ) {
					translate ( [ 0,  ( technic_bush_small_diameter + EXTENSION_FOR_DIFFERENCE ) / 2, ( ( height * technic_height_in_mm ) - ( 2 * technic_bush_shoulder_height ) ) / 2 + technic_bush_shoulder_height ]) {
						rotate( [ 90, 0, 0 ] ) {
							linear_extrude( technic_bush_small_diameter + EXTENSION_FOR_DIFFERENCE ) {
								technic_rounded_rectangle( width = technic_pin_slot_width, height = ( height * technic_height_in_mm ) - ( 2 * technic_bush_shoulder_height ) );
							}
						}
					}
				}
			}

			// The bottom shoulder.
			cylinder( h = technic_bush_shoulder_height, d = technic_bush_big_diameter );

			// The top shoulder.
			translate( [ 0, 0, ( height * technic_height_in_mm ) - technic_bush_shoulder_height ] ) {
				difference() {
					cylinder( h = technic_bush_shoulder_height, d = technic_bush_big_diameter );

					if ( height > 1/2 && stud_cutouts ) {
						// Bushes taller than 1/2 units get cutouts in the lip so that they'll fit between studs.
						translate( [ -stud_spacing / 2, -stud_spacing / 2, -EXTENSION_FOR_DIFFERENCE / 2 ] ) {
							union () {
								cylinder( d = stud_diameter, h = technic_bush_shoulder_height + EXTENSION_FOR_DIFFERENCE );
								translate( [ stud_spacing, 0, 0 ] ) cylinder( d = stud_diameter, h = technic_bush_shoulder_height + EXTENSION_FOR_DIFFERENCE );
								translate( [ stud_spacing, stud_spacing, 0 ] ) cylinder( d = stud_diameter, h = technic_bush_shoulder_height + EXTENSION_FOR_DIFFERENCE );
								translate( [ 0, stud_spacing, 0 ] ) cylinder( d = stud_diameter, h = technic_bush_shoulder_height + EXTENSION_FOR_DIFFERENCE );
							}
						}
					}
				}
			}
		}

		// The axle hole.
		translate( [ 0, 0, ( height * technic_height_in_mm ) / 2 ] ) technic_axle_hole( height = height );
	}
}

/**
 * Elbows
 *
 * part #25214: technic_elbow( length = 2, width = 2 )
 *
 * Origin is at the point where the X and Y axes would meet, with each of them centered in the hole at the end of each leg of the elbow.
 */
module technic_elbow(
	length = 2, // The number of studs one leg would cover, if laid down on a plate.
	width = 2, // The number of studs the other leg would cover, if laid down on a plate.
	axle_socket_on_length = true, // Whether there should be an interior socket for accepting an axle on the X axis.
	axle_socket_on_width = true, // Whether there should be an interior socket for accepting an axle on the Y axis.
) {
	// Use the longer dimension as the length and the shorter dimension as the width.
	// This simplifies some decisions we need to make about what goes where.
	//
	// length is along the X axis, width is along the Y axis.
	real_length = max( 2, max( length, width ) );
	real_width = max( 2, min( length, width ) );

	difference() {
		union() {
			// The two straight parts can be placed in their known positions, and then we can calculate
			// the starting and stopping points of the elbow.
			translate( [ ( real_length * stud_spacing ) - technic_elbow_straight_length, 0, 0 ] ) {
				rotate( [ 0, 90, 0 ] ) {
					difference() {
						cylinder( d = technic_elbow_outer_diameter, h = technic_elbow_straight_length );
						translate( [ 0, 0, -EXTENSION_FOR_DIFFERENCE ] ) {
							cylinder( d = technic_elbow_inner_diameter, h = technic_elbow_straight_length + ( 2 * EXTENSION_FOR_DIFFERENCE ) );
						}
					}

					if ( axle_socket_on_length ) {
						// Add the material that will be the ridges for the axle socket.
						cylinder( d = technic_elbow_inner_diameter, h = technic_elbow_straight_length - technic_elbow_axle_socket_depth );
					}
				}
			}

			translate( [ 0, ( real_width * stud_spacing ) - technic_elbow_straight_length, 0 ] ) {
				rotate( [ -90, 0, 0 ] ) {
					difference() {
						cylinder( d = technic_elbow_outer_diameter, h = technic_elbow_straight_length );
						translate( [ 0, 0, -EXTENSION_FOR_DIFFERENCE ] ) cylinder( d = technic_elbow_inner_diameter, h = technic_elbow_straight_length + ( 2 * EXTENSION_FOR_DIFFERENCE ) );
					}

					if ( axle_socket_on_width ) {
						// Add the material that will be the ridges for the axle socket.
						cylinder( d = technic_elbow_inner_diameter, h = technic_elbow_straight_length - technic_elbow_axle_socket_depth );
					}
				}
			}

			// So we need a tube to connect ( real_width * stud_spacing ) - technic_elbow_straight_length on both X and Y.
			translate( [ ( real_width * stud_spacing ) - technic_elbow_straight_length, ( real_width * stud_spacing ) - technic_elbow_straight_length, 0 ] ) {
				rotate( [ 180, 180, 0 ] ) {
					rotate_extrude( angle = 90 ) {
						translate( [ ( real_width * stud_spacing ) - technic_elbow_straight_length, 0, 0 ] ) {
							circle( d = technic_elbow_outer_diameter );
						}
					}
				}
			}

			// And we also need to fill in any gaps if length doesn't match width.
			if ( real_length > real_width ) {
				translate( [ ( real_width * stud_spacing ) - technic_elbow_straight_length, 0, 0 ] ) {
					rotate( [ 0, 90, 0 ] ) {
						cylinder( d = technic_elbow_outer_diameter, h = ( real_length - real_width ) * stud_spacing );
					}
				}
			}
		}

		if ( axle_socket_on_length ) {
			// Subtract the axle socket area along the length.
			translate( [ real_width * stud_spacing, 0, 0 ] ) {
				rotate( [ 0, -90, 0 ] ) {
					technic_axle_hole( height = 1 );
				}
			}
		}

		if ( axle_socket_on_width ) {
			// Subtract the axle socket area along the width.
			translate( [ 0, real_length * stud_spacing, 0 ] ) {
				rotate( [ 90, 0, 0 ] ) {
					technic_axle_hole( height = 1 );
				}
			}
		}
	}
}

/**
 * Double-sided gears (as opposed to the one-sided gears sometimes called "half-gears").
 *
 * part #3648: technic_gear_double_sided( teeth = 24 );
 * part #3549: technic_gear_double_sided( teeth = 40 );
 *
 * Origin is at the center of the gear in all directions.
 *
 * @param int teeth How many teeth should the gear have? The minimum reasonable value is probably X.
 * @param int width In multiples of the original gear width, how wide should it be? e.g., a width of 3 would generate a single gear with the same total width as three gears set side-by-side.
 */
module technic_gear_double_sided(
	teeth = 24,
	width = 1,
) {
	include <lib/gears/gears.scad>;

	// The overall widest part of a gear is the axle reinforcement.
	// For determining the other widths (thicknesses), the constants are:
	// * the difference between the axle reinforcement thickness and the pin hole thickness.
	// * the difference between the tooth thickness and the wheel thickness.
	// * the difference between the wheel thickness and the pin hole thickness.
	// Calculate the remaining values based on these differences.
	desired_gear_axle_reinforcement_thickness = width * technic_gear_axle_reinforcement_thickness;
	desired_pin_hole_thickness = desired_gear_axle_reinforcement_thickness - ( technic_gear_axle_reinforcement_thickness - technic_gear_pin_hole_thickness );
	desired_gear_tooth_thickness = desired_gear_axle_reinforcement_thickness - ( technic_gear_axle_reinforcement_thickness - technic_gear_tooth_thickness );
	desired_gear_wheel_thickness = desired_gear_axle_reinforcement_thickness - ( technic_gear_axle_reinforcement_thickness - technic_gear_wheel_thickness );

	// A gear is 1 inch wide for every 24 teeth.
	gear_diameter = ( teeth / 24 ) * technic_gear_24_tooth_outer_diameter;

	// For the inner sunken area, use the measured size of a 24-tooth gear to scale it, always leaving the raised part near the teeth a constant size.
	gear_inner_diameter = gear_diameter - ( technic_gear_24_tooth_outer_diameter - technic_gear_24_tooth_inner_diameter );

	// The diagonal distance from the center of the gear to the center of a pin hole in a 24-tooth gear is technic_gear_pin_hole_offset_from_center.
	// This means the horizontal and vertical distances will be found via cosine 45º = X / technic_gear_pin_hole_offset_from_center. => ( 1 / sqrt( 2 ) ) = X / technic_gear_pin_hole_offset_from_center => technic_gear_pin_hole_offset_from_center / sqrt( 2 ) = X
	technic_gear_pin_hole_horizontal_offset_from_center = technic_gear_pin_hole_offset_from_center / sqrt(2);

	difference() {
		union() {
			// The central hub,
			difference() {
				union () {
					// The hub of the gear.
					cylinder( d = gear_inner_diameter, h = desired_gear_wheel_thickness, center = true );

					// The walls of the pin holes
					union () {
						rotate( [ 0, 0, 45 ] ) {
							for ( x = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : gear_inner_diameter / 2 ] ) {
								for ( y = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : ( gear_inner_diameter / 2 ) ] ) {
									diagonal = sqrt( x ^ 2 + y ^ 2 );

									if ( diagonal + ( technic_gear_pin_hole_outer_diameter / 2 ) <= ( gear_inner_diameter / 2 ) ) {
										translate( [ x, y, 0 ] ) {
											cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );
										};

										translate( [ x, -y, 0 ] ) difference() {
											cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );
										};

										translate( [ -x, y, 0 ] ) difference() {
											cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );
										};

										translate( [ -x, -y, 0 ] ) difference() {
											cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );
										};
									}
								}
							}
						}
					};
				};

				// The pin holes.
				union() {
					// As long as the gear is big enough to allow it in the center section, create a grid of pin holes spaced 2 * technic_gear_pin_hole_horizontal_offset_from_center from each other.

					rotate( [ 0, 0, 45 ] ) {
						for ( x = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : gear_inner_diameter / 2 ] ) {
							for ( y = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : ( gear_inner_diameter / 2 ) ] ) {
								diagonal = sqrt( x ^ 2 + y ^ 2 );

								if ( diagonal + ( technic_gear_pin_hole_outer_diameter / 2 ) <= ( gear_inner_diameter / 2 ) ) {
									translate( [ x, y, 0 ] ) {
										cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
									};

									translate( [ x, -y, 0 ] ) difference() {
										cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
									};

									translate( [ -x, y, 0 ] ) difference() {
										cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
									};

									translate( [ -x, -y, 0 ] ) difference() {
										cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
									};
								}
							}
						}
					}
				};
			};

			// The teeth.
			translate( [ 0, 0, - ( desired_gear_tooth_thickness / 2 ) ] ) {
				// The gear teeth seem like they're a little too long (exceeding gear_diameter), but I can't tell if it matters.
				spur_gear( modul = 1, tooth_number = teeth, width = desired_gear_tooth_thickness, bore = gear_inner_diameter, pressure_angle=20, optimized = false );
			};

			// The gear function leaves very small gaps at the bottom corners of the teeth. Fill that all in.
			difference() {
				cylinder( d = gear_diameter - ( technic_gear_24_tooth_tooth_depth * 2 ), h = desired_gear_tooth_thickness, center = true );
				cylinder( d = gear_inner_diameter, h = desired_gear_tooth_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
			};

			// The supports around the axle holes.
			difference() {
				union() {
					rotate( [ 0, 0, 45 ] ) {
						// The center hole.
						rotate( [ 0, 0, 90 ] ) {
							cube( size = [ technic_gear_axle_reinforcement_width, technic_gear_axle_reinforcement_height, desired_gear_axle_reinforcement_thickness ], center = true );
						}

						let ( x = technic_gear_pin_hole_horizontal_offset_from_center ) {
							for ( y = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : ( gear_inner_diameter / 2 ) ] ) {
								if ( y != technic_gear_pin_hole_horizontal_offset_from_center ) {
									diagonal = sqrt( x ^ 2 + y ^ 2 );

									if ( diagonal + ( technic_gear_pin_hole_outer_diameter / 2 ) <= ( gear_inner_diameter / 2 ) ) {
										translate( [ 0, y - technic_gear_pin_hole_horizontal_offset_from_center, 0 ] ) rotate( [ 0, 0, 90 ] ) {
											cube( size = [ technic_gear_axle_reinforcement_width, technic_gear_axle_reinforcement_height, desired_gear_axle_reinforcement_thickness ], center = true );
										}

										if ( y != technic_gear_pin_hole_horizontal_offset_from_center ) { // Don't add the center hole twice.
											translate( [ 0, -y + technic_gear_pin_hole_horizontal_offset_from_center, 0 ] ) rotate( [ 0, 0, 90 ] ) {
												cube( size = [ technic_gear_axle_reinforcement_width, technic_gear_axle_reinforcement_height, desired_gear_axle_reinforcement_thickness ], center = true );
											}
										}
									}
								}
							}
						}

						for ( x = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : gear_inner_diameter / 2 ] ) {
							let ( y = technic_gear_pin_hole_horizontal_offset_from_center ) {
								if ( x != technic_gear_pin_hole_horizontal_offset_from_center ) {
									diagonal = sqrt( x ^ 2 + y ^ 2 );

									if ( diagonal + ( technic_gear_pin_hole_outer_diameter / 2 ) <= ( gear_inner_diameter / 2 ) ) {
										translate( [ x - technic_gear_pin_hole_horizontal_offset_from_center, 0, 0 ] ) {
											cube( size = [ technic_gear_axle_reinforcement_width, technic_gear_axle_reinforcement_height, desired_gear_axle_reinforcement_thickness ], center = true );
										}

										translate( [ -x + technic_gear_pin_hole_horizontal_offset_from_center, 0, 0 ] ) {
											cube( size = [ technic_gear_axle_reinforcement_width, technic_gear_axle_reinforcement_height, desired_gear_axle_reinforcement_thickness ], center = true );
										}
									}
								}
							}
						}
					}
				}

				// The walls of the pin holes
				union () {
					rotate( [ 0, 0, 45 ] ) {
						for ( x = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : gear_inner_diameter / 2 ] ) {
							for ( y = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : ( gear_inner_diameter / 2 ) ] ) {
								translate( [ x, y, 0 ] ) {
									cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
								};

								translate( [ x, -y, 0 ] ) difference() {
									cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
								};

								translate( [ -x, y, 0 ] ) difference() {
									cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
								};

								translate( [ -x, -y, 0 ] ) difference() {
									cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
								};
							}
						}
					}
				};
			};
		};

		// The axle holes.
		rotate( [ 0, 0, 45 ] ) {
			// The center hole.
			rotate( [ 0, 0, 90 ] ) {
				technic_gear_wide_axle_hole( height = desired_gear_axle_reinforcement_thickness, center_of_multiple = true ); // @todo Theoretically, center_of_multiple should be false if there's only one axle hole in total.
			}

			// Run along the x axis and add the other holes.
			// Rather than setting x,y to 0,0, we're using the same math here that we did to determine whether there would be pin holes
			// past this point. This looks a little more complicated but lets us reuse the same logic, ensuring that the pin holes and
			// axle holes always match. Maybe I'll come back and simplify this some day.
			let ( x = technic_gear_pin_hole_horizontal_offset_from_center ) {
				for ( y = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : ( gear_inner_diameter / 2 ) ] ) {
					if ( y != technic_gear_pin_hole_horizontal_offset_from_center ) {
						diagonal = sqrt( x ^ 2 + y ^ 2 );

						if ( diagonal + ( technic_gear_pin_hole_outer_diameter / 2 ) <= ( gear_inner_diameter / 2 ) ) {
							translate( [ 0, y - technic_gear_pin_hole_horizontal_offset_from_center, 0 ] ) rotate( [ 0, 0, 90 ] ) {
								technic_gear_wide_axle_hole( height = desired_gear_axle_reinforcement_thickness );
							}

							if ( y != technic_gear_pin_hole_horizontal_offset_from_center ) { // Don't add the center hole twice.
								translate( [ 0, -y + technic_gear_pin_hole_horizontal_offset_from_center, 0 ] ) rotate( [ 0, 0, 90 ] ) {
									technic_gear_wide_axle_hole( height = desired_gear_axle_reinforcement_thickness );
								}
							}
						}
					}
				}
			}

			// Run along the y axis and add the other holes.
			for ( x = [ technic_gear_pin_hole_horizontal_offset_from_center : technic_gear_pin_hole_horizontal_offset_from_center * 2 : gear_inner_diameter / 2 ] ) {
				let ( y = technic_gear_pin_hole_horizontal_offset_from_center ) {
					if ( x != technic_gear_pin_hole_horizontal_offset_from_center ) {
						diagonal = sqrt( x ^ 2 + y ^ 2 );

						if ( diagonal + ( technic_gear_pin_hole_outer_diameter / 2 ) <= ( gear_inner_diameter / 2 ) ) {
							translate( [ x - technic_gear_pin_hole_horizontal_offset_from_center, 0, 0 ] ) {
								technic_gear_wide_axle_hole( height = desired_gear_axle_reinforcement_thickness );
							}

							translate( [ -x + technic_gear_pin_hole_horizontal_offset_from_center, 0, 0 ] ) {
								technic_gear_wide_axle_hole( height = desired_gear_axle_reinforcement_thickness );
							}
						}
					}
				}
			}
		}
	}
}

/**
 * A single-sided gear.
 *
 * part #6589: technic_gear_single_sided()
 * part #32198: technic_gear_single_sided( teeth = 20 )
 * part #87407: technic_gear_single_sided( teeth = 20, center_hole = "pin" )
 *
 * Origin is centered at the bottom of the gear (the non-toothed side).
 *
 * @param int teeth How many teeth should the gear have? The minimum reasonable value is probably 10.
 * @param bool bevel Should the gear teeth be beveled?
 * @param string center_hole What connector should the center hole be compatible with? Supported values are "axle" and "pin".
 */
module technic_gear_single_sided( teeth = 12, bevel = true, center_hole = "axle" ) {
	// Gears appear to be one inch wide for every 24 teeth they have.
	gear_diameter = ( teeth / 12 ) * technic_gear_12_tooth_gear_diameter;

	// The diameter of the hub grows with gear diameter enough to keep the length of the exposed teeth constant.
	exposed_tooth_length = ( technic_gear_12_tooth_gear_diameter - technic_gear_12_tooth_hub_diameter );

	// ...but the 12-tooth size is the minimum in order to support the axle or pin hole in the center.
	hub_diameter = max( technic_gear_12_tooth_hub_diameter, gear_diameter - exposed_tooth_length );

	difference() {
		union() {
			// The lip that acts as a washer between the gear and a beam or brick.
			linear_extrude( technic_gear_12_tooth_lip_thickness ) {
				difference() {
					circle( d = technic_gear_12_tooth_lip_outer_diameter );
					circle( d = technic_gear_12_tooth_lip_inner_diameter );
				}
			}

			// The base of the gear.
			translate( [ 0, 0, technic_gear_12_tooth_lip_thickness ] ) cylinder( d = gear_diameter, h = technic_gear_12_tooth_base_thickness );

			// The hub of the gear.
			translate( [ 0, 0, technic_gear_12_tooth_lip_thickness + technic_gear_12_tooth_base_thickness ] ) cylinder( d = hub_diameter, h = technic_gear_12_tooth_tooth_thickness );

			// The teeth.
			// @todo Is the tooth width/depth/etc. a function of the number of teeth? Or the diameter of the gear? Or something else?
			translate( [ 0, 0, technic_gear_12_tooth_base_thickness + technic_gear_12_tooth_lip_thickness ] ) {
				let( inward_slant = ( technic_gear_12_tooth_tooth_width_at_bottom - technic_gear_12_tooth_tooth_width_at_top ) / 2 ) {
					for ( i = [ 1 : teeth ] ) {
						rotate( [ 0, 0, 360 / teeth * i ] ) {
							rotate( [ 90, 0, 0 ] ) {
								translate( [ 0, 0, -gear_diameter / 2 ] ) {
									difference() {
										linear_extrude( gear_diameter / 2 ) {
											translate( [ -technic_gear_12_tooth_tooth_width_at_bottom / 2, 0, 0 ] ) polygon(
												points = [
													[ 0, 0 ],
													[ technic_gear_12_tooth_tooth_width_at_bottom, 0 ],
													[ technic_gear_12_tooth_tooth_width_at_bottom - inward_slant, technic_gear_12_tooth_tooth_height ],
													[ inward_slant, technic_gear_12_tooth_tooth_height ],
													[ 0, 0 ]
												]
											);
										}

										// Remove the bevel.
										if ( bevel ) {
											let( extra_offset_for_preview = 0.001 ) {
												translate( [-technic_gear_12_tooth_tooth_width_at_bottom / 2 - extra_offset_for_preview, technic_gear_12_tooth_tooth_height / 2 + extra_offset_for_preview, -extra_offset_for_preview ] ) {
													rotate( [ 90, 0, 90 ] ) {
														linear_extrude( technic_gear_12_tooth_tooth_width_at_bottom ) {
															// The bevel is assumed to be a 45º cut that is half as tall as the tooth. This might be wrong.
															polygon(
																points = [
																	[ 0, 0 ],
																	[ technic_gear_12_tooth_tooth_height / 2, 0 ],
																	[ technic_gear_12_tooth_tooth_height / 2, technic_gear_12_tooth_tooth_height / 2 ],
																	[ 0, 0 ]
																]
															);
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		if ( center_hole == "axle" ) {
			// Remove the axle hole.
			technic_axle_hole( height = 1 ); // @todo If we add a width/thickness option, it would replace 1 here.
		} else if ( center_hole == "pin" ) {
			translate( [ 0, 0, technic_gear_12_tooth_lip_thickness - ( EXTENSION_FOR_DIFFERENCE / 2 ) ] ) {
				cylinder( d = min( technic_pin_connector_outer_diameter, technic_gear_12_tooth_lip_inner_diameter ), h = technic_gear_12_tooth_base_thickness + technic_gear_12_tooth_tooth_height + EXTENSION_FOR_DIFFERENCE );
			}
		}
	}

	if ( center_hole == "pin" ) {
		translate( [ 0, 0, technic_gear_12_tooth_lip_thickness ] ) {
			technic_pin_connector( length = 1 );
		}
	}
}

/**
 * Pins.
 *
 * part #2780: technic_pin( top_length = 1, top_friction = true, bottom_length = 1, bottom_friction = true )
 * part #3673: technic_pin( top_length = 1, top_friction = false, bottom_length = 1, bottom_friction = false )
 * part #4274: technic_pin( top_length = 1, stud = true )
 * part #4459: technic_pin( top_length = 1, top_friction = true, bottom_length = 1, bottom_friction = true ) // This part has long friction ridges along the length of the pin, which isn't supported yet.
 * part #6558: technic_pin( top_length = 2, top_friction = true, bottom_length = 1, bottom_friction = true )
 * part #32138: technic_pin( multiplier = 2 )
 * part #32556: technic_pin( top_length = 2, top_friction = false, bottom_length = 1, bottom_friction = false )
 * part #65098: technic_pin( multiplier = 2, squared_pin_holes = true )
 * part #77765: technic_pin( top_length = 3, top_friction = false, bottom_length = 0, bottom_friction = false )
 * part #89678: technic_pin( top_length = 1, top_friction = true, stud = true )
 *
 * Origin is centered at the bottom of the pin.
 *
 * @param float top_length How long is the pin on the top?
 * @param bool top_friction Should the top part have friction ridges?
 * @param float bottom_length How long is the pin on the bottom?
 * @param bool bottom_friction Should the bottom part have friction ridges?
 * @param int multiplier How many pin sets should there be?
 * @param bool axle_hole If a multiple pin, should there be an axle hole?
 * @param bool stud If true, the bottom part of the pin will be a stud, regardless of bottom_length and bottom_friction.
 */
module technic_pin(
	top_length = 1,
	top_friction = true,
	bottom_length = 1,
	bottom_friction = true,
	multiplier = 1,
	axle_holes = true,
	squared_pin_holes = false,
	stud = false
) {
	let ( bottom_length_in_mm = stud ? stud_height : bottom_length * technic_height_in_mm ) {
		if ( multiplier > 1 ) {
			translate( [ 0, 0, bottom_length_in_mm ] ) {
				difference() {
					union() {
						// The pin halves.
						for ( i = [ 1 : multiplier ] ) {
							translate( [ ( i - 1 ) * technic_pin_multiple_offset, 0, technic_pin_multiple_center_width ] ) technic_pin_half( length = top_length, friction = top_friction, squared_pin_holes = squared_pin_holes );

							if ( stud ) {
								translate( [ ( i - 1 ) * technic_pin_multiple_offset, 0, -bottom_length_in_mm] ) technic_hollow_stud();
							} else {
								translate( [ ( i - 1 ) * technic_pin_multiple_offset, 0, 0 ] ) rotate( [ 0, 180, 0 ] ) technic_pin_half( length = bottom_length, friction = bottom_friction, squared_pin_holes = squared_pin_holes );
							}
						}

						// The bottom lip that separates the pins from the center section.
						hull() {
							cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h = technic_pin_multiple_center_lip_thickness );
							translate( [ technic_pin_multiple_offset * ( multiplier - 1 ), 0, 0 ] ) {
								cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h = technic_pin_multiple_center_lip_thickness );
							}
						}

						// The top lip that separates the pins from the center section.
						translate( [ 0, 0, technic_pin_multiple_center_width - technic_pin_multiple_center_lip_thickness ] ) {
							hull() {
								cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h =technic_pin_multiple_center_lip_thickness );
								translate( [ technic_pin_multiple_offset * ( multiplier - 1 ), 0, 0 ] ) cylinder( d = technic_pin_outer_diameter + ( technic_pin_multiple_center_lip_overhang * 2 ), h =technic_pin_multiple_center_lip_thickness );
							}
						}

						// The body of the center section.
						hull() {
							cylinder( d = technic_pin_outer_diameter, h = technic_pin_multiple_center_width );
							translate( [ technic_pin_multiple_offset * ( multiplier - 1 ), 0, 0 ] ) cylinder( d = technic_pin_outer_diameter, h = technic_pin_multiple_center_width );
						}

						if ( axle_holes ) {
							// Generate the support area around the axle holes.
							for ( i = [ 1 : multiplier - 1 ] ) {
								translate( [ ( ( i - .5 ) * technic_pin_multiple_offset ), 0, technic_pin_multiple_center_width / 2 ] ) {
									rotate( [ 90, 0, 0 ] ) {
										intersection() {
											// 1.5 is an arbitrary choice that is correct enough, assuming the cross-section size of an axle can't be customized and the width of the center of a multiple-pin can't be customized.
											scale( [ 1.5, 1.5, 1 ] ) {
												technic_axle_hole( height = technic_pin_outer_diameter + EXTENSION_FOR_DIFFERENCE );
											}

											// Only allow the axle support to extend as far as the edge of the lip of the center section.
											cube( [ technic_pin_multiple_center_width, technic_pin_multiple_center_width, technic_pin_outer_diameter + ( 2 * technic_pin_multiple_center_lip_overhang ) ], center = true );
										}
									}
								}
							}

						}
					}

					if ( axle_holes ) {
						// Remove the axle holes.
						for ( i = [ 1 : multiplier - 1 ] ) {
							translate( [ ( ( i - .5 ) * technic_pin_multiple_offset ), 0, technic_pin_multiple_center_width / 2 ] ) {
								rotate( [ 90, 0, 0 ] ) {
									translate( [ 0, 0, 0 ] ) {
										technic_axle_hole( height = technic_pin_outer_diameter + EXTENSION_FOR_DIFFERENCE );
									}
								}
							}
						}
					}
				}
			}
		} else {
			translate( [ 0, 0, ( bottom_length_in_mm ) - ( stud ? 0 : technic_pin_collar_thickness ) ] ) {
				// The top half of the pin.
				technic_pin_half( length = top_length, friction = top_friction, squared_pin_holes = squared_pin_holes );

				if ( stud ) {
					// The stud.
					translate( [ 0, 0, -bottom_length_in_mm ] ) technic_hollow_stud();
				} else {
					// The bottom half of the pin.
					translate( [ 0, 0, technic_pin_collar_thickness ] ) rotate( [ 0, 180, 0 ] ) technic_pin_half( length = bottom_length, friction = bottom_friction, squared_pin_holes = squared_pin_holes );
				}
			}
		}
	}
}

/**
 * Pin connectors.
 *
 * part #18654: technic_pin_connector( length = 1 ) [equivalent to a 1-hole beam]
 *
 * Origin is centered at the bottom center of the pin connector.
 */
module technic_pin_connector(
	length = 1, // The length in studs. An axle of length 2 will be the same length as a 2-stud brick.
) {
	translate( [ 0, 0, ( technic_height_in_mm * length ) / 2 ] ) {
		union() {
			// The hollow cylinder that forms the outer wall.
			difference() {
				cylinder( h = technic_height_in_mm * length, d = technic_pin_connector_outer_diameter, center = true );
				cylinder( h = technic_height_in_mm * length + EXTENSION_FOR_DIFFERENCE, r = ( technic_pin_connector_outer_diameter / 2 ) - technic_pin_connector_shoulder_wall_thickness, center = true );
			};

			difference() {
				cylinder( h = ( technic_height_in_mm * length ) - ( technic_pin_connector_shoulder_depth * 2 ), d = technic_pin_connector_outer_diameter, center = true );
				cylinder( h = ( technic_height_in_mm * length ) - ( technic_pin_connector_shoulder_depth * 2 ) + EXTENSION_FOR_DIFFERENCE, r = ( technic_hole_diameter / 2 ), center = true );
			};
		};
	}
}

/**
 * @param float length How long, in Technic units, is the pin half?
 * @param bool friction Whether it should have friction ridges.
 * @param bool squared_pin_holes Apparently "squared" pin holes mean the slits at the end of the pin are rotated 90º from their usual orientation.
 */
module technic_pin_half(
	length = 1,
	friction = true,
	squared_pin_holes = false
) {
	if ( length > 0 ) { // A "half pin" just has a 1.7mm extension (2.5 including the collar) of the pin body past the collar.
		difference() {
			union() {
				// Pin body
				if ( length == 0.5 ) {
					cylinder( d = technic_pin_outer_diameter, h = 1.8 + technic_pin_collar_thickness ); // 1.8 matches stud height
				} else {
					cylinder( d = technic_pin_outer_diameter, h = length * technic_height_in_mm );
				}

				// Pin collar.
				cylinder( d = technic_pin_collar_diameter, h = technic_pin_collar_thickness );

				if ( length > ( 0.5 ) ) {
					// Pin lip
					translate( [ 0, 0, ( length * technic_height_in_mm ) - technic_pin_lip_thickness ] ) {
						cylinder( d = technic_pin_lip_diameter, h = technic_pin_lip_thickness );
					}

					if ( friction ) {
						// End lines
						intersection() {
							// The cylinders that define the areas vertically where the friction lines will appear
							union() {
								for ( idx = [ 0 : length ] ) {
									// Center.
									translate( [ 0, 0, ( idx * 2 * technic_height_in_mm ) / 2 - ( technic_pin_friction_vertical_length / 2 )  ] ) {
										cylinder( d = technic_pin_outer_diameter + ( 2 * technic_pin_friction_thickness ), h = technic_pin_friction_vertical_length );
									}
								}
							}

							// The cubes that define the areas radially where the friction lines will appears.
							union() {
								rotate( [0, 0, 45 ] ) translate( [0, 0, ( length * technic_height_in_mm ) / 2 ] ) {
									cube( [ technic_pin_friction_width, technic_pin_outer_diameter * 2, length * technic_height_in_mm ], center = true );
								}

								rotate( [0, 0, 135 ] ) translate( [0, 0, ( length * technic_height_in_mm ) / 2 ] ) {
									cube( [ technic_pin_friction_width, technic_pin_outer_diameter * 2, length * technic_height_in_mm ], center = true );
								}
							}
						}

						// The radial friction lines
						if ( length > 1 ) {
							for ( idx = [ 1 : length - 1 ] ) {
								translate( [ 0, 0, ( idx * 2 * technic_height_in_mm ) / 2 ] ) {
									cylinder( d = technic_pin_outer_diameter + ( 2 * technic_pin_friction_thickness ), h = technic_pin_friction_width, center = true );
								}
							}
						}
					}
				}
			};

			// Remove the center of the pin.
			translate( [ 0, 0, -EXTENSION_FOR_DIFFERENCE ] ) cylinder( d = technic_pin_inner_diameter, h = ( length * technic_height_in_mm ) + ( 2 * EXTENSION_FOR_DIFFERENCE ) );

			if ( length >= 1 ) { // Half-pins don't get slits and slots.
				// Remove the slit at the top that makes the pin end flex.
				rotate( [ 0, 0, squared_pin_holes ? 90 : 0 ] ) {
					translate( [ 0, technic_pin_lip_diameter, length * technic_height_in_mm ] ) {
						rotate( [ 90, 0, 0 ] ) {
							linear_extrude( technic_pin_lip_diameter * 2 ) {
								technic_rounded_rectangle( width = technic_pin_slit_width, height = technic_pin_slit_length * 2, radius = technic_pin_slit_width / 2 );
							}
						}
					}
				}
			}

			// Remove the slot across the center of the pin.
			if ( length > 1 ) {
				for ( idx = [ 1 : length - 1 ] ) {
					translate( [ 0, 0, ( idx * 2 * technic_height_in_mm ) / 2 ] ) {
						rotate( [ 90, 0, idx % 2 == 0 ? 0 : 90 ] ) {
							translate( [ 0, 0, - technic_pin_lip_diameter ] ) {
								linear_extrude( technic_pin_lip_diameter * 2 ) {
									technic_rounded_rectangle( width = technic_pin_slot_width, height = technic_pin_slot_length, radius = technic_pin_slot_width / 2 );
								}
							}
						}
					}
				}
			}
		}
	}
}

/**
 * Utility modules. None of these produce an entire Technic-compatible piece on their own.
 */

/**
 * Generate a rounded rectangle.
 */
module technic_rounded_rectangle( width = 1, height = 1, radius = 0.1 ) {
	hull() {
		// Position a circle to act as each rounded corner of the axle.
		translate( [ -( width / 2 ) + radius,  ( height / 2 ) - radius, 0 ] ) circle( r = radius );
		translate( [  ( width / 2 ) - radius,  ( height / 2 ) - radius, 0 ] ) circle( r = radius );
		translate( [  ( width / 2 ) - radius, -( height / 2 ) + radius, 0 ] ) circle( r = radius );
		translate( [ -( width / 2 ) + radius, -( height / 2 ) + radius, 0 ] ) circle( r = radius );
	}
}

module technic_axle_hole( height = 1 ) {
	scale( [ technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio ] ) {
		translate( [ 0, 0, - ( height * 2 * technic_height_in_mm ) / 2 ] ) technic_axle( length = height * 2 );
	}
}

module technic_gear_wide_axle_hole( height, center_of_multiple = false ) {
	technic_axle_hole( height = height );

	scale( [ technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio ] ) {
		// The cross-opening for the axle fit is as wide as the widest edges of the pin holes. ~12.75
		linear_extrude( height = height + EXTENSION_FOR_DIFFERENCE, center = true ) {
			technic_rounded_rectangle(
				width = technic_axle_spline_thickness * technic_axle_interference_fit_ratio,
				height = technic_gear_axle_slot_length * ( center_of_multiple ? 0.7 : 1 ),
				radius = ( technic_axle_spline_thickness * technic_axle_interference_fit_ratio ) / 2
			);
		}
	}
}

module technic_hollow_stud() {
	linear_extrude( stud_height ) {
		difference() {
			circle( d = stud_outer_diameter );
			circle( d = stud_inner_diameter );
		}
	}
}