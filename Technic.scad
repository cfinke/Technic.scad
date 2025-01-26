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

stud_spacing = 8; // Matches LEGO.stud_spacing
technic_height_in_ms = 7.8; // Vertically-oriented technic pieces (like pin connectors) use this

technic_hole_diameter = 4.85; // Matches LEGO.stud_diameter

technic_axle_interference_fit_ratio = 1.022;

technic_axle_spline_thickness = 1.8;
technic_axle_spline_width = 4.85; // Matches LEGO.stud_diameter
technic_axle_spline_corner_radius = 0.4;
technic_axle_cross_section_radius = 1;
technic_axle_stop_thickness = 0.7; // Matches technic_pin_collar_thickness
technic_axle_stop_diameter = 5.9;

technic_pin_connector_outer_diameter = 7.36;
technic_pin_connector_wall_thickness = 1.3;
technic_pin_connector_shoulder_wall_thickness = 0.6;
technic_pin_connector_shoulder_depth = 0.70;

technic_gear_24_tooth_outer_diameter = 25.4;
technic_gear_24_tooth_bottom_diameter = 21.65;
technic_gear_24_tooth_inner_diameter = 19.6;
technic_gear_24_tooth_tooth_depth = ( technic_gear_24_tooth_outer_diameter - technic_gear_24_tooth_bottom_diameter ) / 2;
technic_gear_pin_hole_outer_diameter = 6.1;
technic_gear_pin_hole_offset_from_center = 5.675;
technic_gear_pin_hole_thickness = 6.1;
technic_gear_tooth_thickness = 3.7;
technic_gear_wheel_thickness = 1.3;
technic_gear_axle_reinforcement_width = 9.63;
technic_gear_axle_reinforcement_height = 5;
technic_gear_axle_reinforcement_thickness = 7.73;
technic_gear_axle_slot_length = ( ( technic_gear_pin_hole_offset_from_center * 2 ) + technic_hole_diameter ) * .8; // Close enough :)

technic_pin_outer_diameter = 4.85; // Matches LEGO.stud_diameter.
technic_pin_inner_diameter = 3.1; // Matches LEGO.hollow_stud_inner_diameter
technic_pin_collar_diameter = 5.6;
technic_pin_collar_thickness = 0.7; // Matches technic_axle_stop_thickness
technic_pin_lip_diameter = 5;
technic_pin_lip_thickness = 0.5;
technic_pin_slit_width = 0.75;
technic_pin_slit_length = 3.2;
technic_pin_slot_width = 0.75;
technic_pin_slot_length = 5.2;
technic_pin_friction_thickness = 0.15;
technic_pin_friction_width = 0.8;
technic_pin_friction_vertical_length = 5;

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
 *
 * Origin is centered at the bottom of the axle.
 */
module technic_axle(
	length = 2, // The length in studs. An axle of length 2 will be the same length as a 2-stud brick.
	stop = false, // Should it have a stop at the end?
) {
	difference() {
		union() {
			// If there's a stop (and thus an extra segment of length to cut off, we need to move the axle
			// down a segment, since it's returned from technic_axle_spline with the center of its base at the origin.
			translate( [ 0, 0, stop ? - ( stud_spacing ) : 0 ] ) {
				// If there's a stop, add an extra bit of length so that we can cut it off flush without seeing the small bit of rounded corners.
				                       technic_axle_spline( length = stop ? length + 1 : length );
				rotate( [ 0, 0, 90 ] ) technic_axle_spline( length = stop ? length + 1 : length );
			}

			if ( stop ) {
				cylinder( d = technic_axle_stop_diameter, h = technic_axle_stop_thickness );
			}
		}

		if ( stop ) {
			translate([ 0, 0, -( ( stud_spacing ) + EXTENSION_FOR_DIFFERENCE ) ] ) {
				cylinder( d = technic_axle_spline_width + EXTENSION_FOR_DIFFERENCE, h = ( stud_spacing ) + EXTENSION_FOR_DIFFERENCE );
			}
		}
	}

	/**
	 * Generate one of the axle splines. An axle is made up of two splines, rotated 90º from each other.
	 * Positioned with the bottom center of the axle spline at the origin.
	 */
	module technic_axle_spline( length ) {
		// To get the rounded corners when viewing the spline looking at the long wide side, we need
		// to intersect it with rounded rectangle turned 90º in that direction.
		translate( [ 0, 0, technic_height_in_ms * length / 2 ] ) {
			intersection() {
				rotate( [ 90, 0, 0 ] ) {
					linear_extrude( technic_axle_spline_thickness, center = true ) {
						technic_rounded_rectangle( width = technic_axle_spline_width, height = technic_height_in_ms * length, radius = technic_axle_cross_section_radius );
					}
				}

				linear_extrude( technic_height_in_ms * length, center = true ) {
					technic_rounded_rectangle( technic_axle_spline_width, technic_axle_spline_thickness, technic_axle_spline_corner_radius );
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
	translate( [ 0, 0, ( technic_height_in_ms * length ) / 2 ] ) {
		union() {
			// The hollow cylinder that forms the outer wall.
			difference() {
				cylinder( h = technic_height_in_ms * length, d = technic_pin_connector_outer_diameter, center = true );
				cylinder( h = technic_height_in_ms * length + EXTENSION_FOR_DIFFERENCE, r = ( technic_pin_connector_outer_diameter / 2 ) - technic_pin_connector_shoulder_wall_thickness, center = true );
			};

			difference() {
				cylinder( h = ( technic_height_in_ms * length ) - ( technic_pin_connector_shoulder_depth * 2 ), d = technic_pin_connector_outer_diameter, center = true );
				cylinder( h = ( technic_height_in_ms * length ) - ( technic_pin_connector_shoulder_depth * 2 ) + EXTENSION_FOR_DIFFERENCE, r = ( technic_hole_diameter / 2 ), center = true );
			};
		};
	}
}

/**
 * 24-tooth gears.
 *
 * part #3648: technic_24_tooth_gear();
 *
 * Origin is at the center of the gear in all directions.
 */
module technic_24_tooth_gear(
	width = 1, // In multiples of the original gear width, how wide should it be? e.g., a width of 3 would generate a single gear with the same total width as three gears set side-by-side.
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

	difference() {
		union() {
			// The central hub,
			difference() {
				union () {
					// The hub of the gear.
					cylinder( r = technic_gear_24_tooth_inner_diameter / 2, h = desired_gear_wheel_thickness, center = true );

					// The walls of the pin holes
					union () {
						translate( [ technic_gear_pin_hole_offset_from_center, 0, 0 ] )
							cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );

						translate( [ -technic_gear_pin_hole_offset_from_center, 0, 0 ] )
							cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );

						translate( [ 0, technic_gear_pin_hole_offset_from_center, 0 ] )
							cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );

						translate( [ 0, -technic_gear_pin_hole_offset_from_center, 0 ] )
							cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_pin_hole_thickness, center = true );
					};
				};

				// The pin holes.
				union() {
					translate( [ technic_gear_pin_hole_offset_from_center, 0, 0 ] ) difference() {
						cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
					};

					translate( [ -technic_gear_pin_hole_offset_from_center, 0, 0 ] )difference() {
						cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
					};

					translate( [ 0, technic_gear_pin_hole_offset_from_center, 0 ] )difference() {
						cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
					};

					translate( [ 0, -technic_gear_pin_hole_offset_from_center, 0 ] )difference() {
						cylinder( d = technic_hole_diameter, h = desired_pin_hole_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
					};
				};
			};

			// The teeth.
			translate( [ 0, 0, - ( desired_gear_tooth_thickness / 2 ) ] ) {
				// The gear teeth seem like they're a little too long (exceeding technic_gear_24_tooth_outer_diameter), but I can't tell if it matters.
				spur_gear( modul = 1, tooth_number = 24, width = desired_gear_tooth_thickness, bore = technic_gear_24_tooth_inner_diameter, pressure_angle=20 );
			};

			// The gear function leaves very small gaps at the bottom corners of the teeth. Fill that all in.
			difference() {
				cylinder( d = technic_gear_24_tooth_outer_diameter - ( technic_gear_24_tooth_tooth_depth * 2 ), h = desired_gear_tooth_thickness, center = true );
				cylinder( d = technic_gear_24_tooth_inner_diameter, h = desired_gear_tooth_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
			};

			difference() {
				rotate( [ 0, 0, 45 ] ) cube( size = [ technic_gear_axle_reinforcement_width, technic_gear_axle_reinforcement_height, desired_gear_axle_reinforcement_thickness ], center = true );
				// The walls of the pin holes
				union () {
					translate( [ technic_gear_pin_hole_offset_from_center, 0, 0 ] )
						cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );

					translate( [ -technic_gear_pin_hole_offset_from_center, 0, 0 ] )
						cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );

					translate( [ 0, technic_gear_pin_hole_offset_from_center, 0 ] )
						cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );

					translate( [ 0, -technic_gear_pin_hole_offset_from_center, 0 ] )
						cylinder( d = technic_gear_pin_hole_outer_diameter, h = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true );
				};
			};
		};

		// The axle hole.
		// This scaling is theoretically correct.
		rotate( [ 0, 0, 45 ] ) {
			scale( [ technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio ] ) {
				technic_axle( length = width );

				// The cross-opening for the axle fit is as wide as the widest edges of the pin holes. ~12.75
				// The cross-opening for the axle fit is as wide as the widest edges of the pin holes. ~12.75
				linear_extrude( height = desired_gear_axle_reinforcement_thickness + EXTENSION_FOR_DIFFERENCE, center = true ) {
					technic_rounded_rectangle(
						width = technic_axle_spline_thickness * technic_axle_interference_fit_ratio,
						height = technic_gear_axle_slot_length,
						radius = ( technic_axle_spline_thickness * technic_axle_interference_fit_ratio ) / 2
					);
				};
			};
		};
	};
}

/**
 * Pins.
 *
 * part #2780: technic_pin( top_length = 1, top_friction = true, bottom_length = 1, bottom_friction = true );
 * part #3673: technic_pin( top_length = 1, top_friction = false, bottom_length = 1, bottom_friction = false );
 * part #4274: technic_pin( top_length = 0.5, bottom_length = 1 );
 * part #4459: technic_pin( top_length = 1, top_friction = true, bottom_length = 1, bottom_friction = true ); // This part has long friction ridges along the length of the pin, which isn't supported yet.
 * part #6558: technic_pin( top_length = 2, top_friction = true, bottom_length = 1, bottom_friction = true );
 * part #32556: technic_pin( top_length = 2, top_friction = false, bottom_length = 1, bottom_friction = false );
 * part #77765: technic_pin( top_length = 3, top_friction = false, bottom_length = 0, bottom_friction = false );
 * part #89678: technic_pin( top_length = 0.5, bottom_length = 1, bottom_friction = true );
 *
 * Origin is centered at the bottom of the pin.
 */
module technic_pin(
	top_length = 1,
	top_friction = true,
	bottom_length = 2,
	bottom_friction = false
) {
	translate( [ 0, 0, ( bottom_length * technic_height_in_ms ) - technic_pin_collar_thickness ] ) {
		technic_pin_half( length = top_length, friction = top_friction );
		translate( [ 0, 0, technic_pin_collar_thickness ] ) rotate( [ 0, 180, 0 ] ) technic_pin_half( length = bottom_length, friction = bottom_friction );
	}
}

module technic_pin_half(
	length = 1,
	friction = true
) {
	if ( length > 0 ) { // A "half pin" just has a 1.7mm extension (2.5 including the collar) of the pin body past the collar.
		difference() {
			union() {
				// Pin body
				if ( length == 0.5 ) {
					cylinder( d = technic_pin_outer_diameter, h = 1.8 + technic_pin_collar_thickness ); // 1.8 matches stud height
				} else {
					cylinder( d = technic_pin_outer_diameter, h = length * technic_height_in_ms );
				}

				// Pin collar.
				cylinder( d = technic_pin_collar_diameter, h = technic_pin_collar_thickness );

				if ( length > ( 0.5 ) ) {
					// Pin lip
					translate( [ 0, 0, ( length * technic_height_in_ms ) - technic_pin_lip_thickness ] ) {
						cylinder( d = technic_pin_lip_diameter, h = technic_pin_lip_thickness );
					}

					if ( friction ) {
						// End lines
						intersection() {
							// The cylinders that define the areas vertically where the friction lines will appear
							union() {
								for ( idx = [ 0 : length ] ) {
									// Center.
									translate( [ 0, 0, ( idx * 2 * technic_height_in_ms ) / 2 - ( technic_pin_friction_vertical_length / 2 )  ] ) {
										cylinder( d = technic_pin_outer_diameter + ( 2 * technic_pin_friction_thickness ), h = technic_pin_friction_vertical_length );
									}
								}
							}

							// The cubes that define the areas radially where the friction lines will appears.
							union() {
								rotate( [0, 0, 45 ] ) translate( [0, 0, ( length * technic_height_in_ms ) / 2 ] ) {
									cube( [ technic_pin_friction_width, technic_pin_outer_diameter * 2, length * technic_height_in_ms ], center = true );
								}

								rotate( [0, 0, 135 ] ) translate( [0, 0, ( length * technic_height_in_ms ) / 2 ] ) {
									cube( [ technic_pin_friction_width, technic_pin_outer_diameter * 2, length * technic_height_in_ms ], center = true );
								}
							}
						}

						// The radial friction lines
						if ( length > 1 ) {
							for ( idx = [ 1 : length - 1 ] ) {
								translate( [ 0, 0, ( idx * 2 * technic_height_in_ms ) / 2 ] ) {
									cylinder( d = technic_pin_outer_diameter + ( 2 * technic_pin_friction_thickness ), h = technic_pin_friction_width, center = true );
								}
							}
						}
					}
				}
			};

			// Remove the center of the pin.
			translate( [ 0, 0, -EXTENSION_FOR_DIFFERENCE ] ) cylinder( d = technic_pin_inner_diameter, h = ( length * technic_height_in_ms ) + ( 2 * EXTENSION_FOR_DIFFERENCE ) );

			if ( length >= 1 ) { // Half-pins don't get slits and slots.
				// Remove the slit at the top that makes the pin end flex.
				translate( [ 0, technic_pin_lip_diameter, length * technic_height_in_ms ] ) {
					rotate( [ 90, 0, 0 ] ) {
						linear_extrude( technic_pin_lip_diameter * 2 ) {
							technic_rounded_rectangle( width = technic_pin_slit_width, height = technic_pin_slit_length * 2, radius = technic_pin_slit_width / 2 );
						}
					}
				}
			}

			// Remove the slot across the center of the pin.
			if ( length > 1 ) {
				for ( idx = [ 1 : length - 1 ] ) {
					translate( [ 0, 0, ( idx * 2 * technic_height_in_ms ) / 2 ] ) {
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
	translate( [ 0, 0, technic_height_in_ms * axle_length ] ) {
		intersection() {
			// Position it so the axle ends at the origin and the pin is above it.
			rotate( [ 180, 0, 0 ] ) {
				// Include a stop, which is the same as the pin collar.
				technic_axle( length = axle_length, stop = true );
			}

			translate( [ 0, 0, -( ( technic_height_in_ms * axle_length ) + EXTENSION_FOR_DIFFERENCE ) ] ) {
				linear_extrude( ( technic_height_in_ms * axle_length ) + EXTENSION_FOR_DIFFERENCE ) {
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
					scale( [ technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio ] ) {
						technic_axle( length = 1 );
					}
				}
			}
		}

		if ( axle_socket_on_width ) {
			// Subtract the axle socket area along the width.
			translate( [ 0, real_length * stud_spacing, 0 ] ) {
				rotate( [ 90, 0, 0 ] ) {
					scale( [ technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio, technic_axle_interference_fit_ratio ] ) {
						technic_axle( length = 1 );
					}
				}
			}
		}
	}
}

/**
 * Beams.
 *
 * part #18654: technic_beam( length = 1 ) [equivalent to a pin connector]
 * part #43857: technic_beam( length = 2 )
 * part #32523: technic_beam( length = 3 )
 * part #32316: technic_beam( length = 5 )
 * part #32524: technic_beam( length = 7 )
 * part #40490: technic_beam( length = 9 )
 * part #32525: technic_beam( length = 11 )
 * part #41239: technic_beam( length = 13 )
 * part #32278: technic_beam( length = 15 )
 *
 * Origin is below the center of the first hole.
 */
module technic_beam( length = 5, height = 1 ) {
	// Generate the pin connectors that make up the inside of the beam.
	for ( i = [ 1 : length ] ) {
		translate( [ technic_beam_hole_spacing * ( i - 1 ), 0, 0 ] ) {
			technic_pin_connector( length = height );
		}
	}

	// Add the walls along the edges of the rows of pins.
	translate( [ 0, -( technic_pin_connector_outer_diameter / 2 ), ( technic_height_in_ms * height ) / 2 ] ) {
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
		cube( [ ( length - 1 ) * technic_beam_hole_spacing, technic_pin_connector_shoulder_wall_thickness, technic_height_in_ms * height ] );
		translate( [ 0, technic_pin_connector_outer_diameter - technic_pin_connector_shoulder_wall_thickness, 0 ] ) {
			cube( [ ( length - 1 ) * technic_beam_hole_spacing, technic_pin_connector_shoulder_wall_thickness, technic_height_in_ms * height ] );
		}
	}
}

/**
 * Generate a rounded rectangle.
 */
module technic_rounded_rectangle( width = 1, height = 1, radius = 0.1 ) {
	union() {
		// Position a circle to act as each rounded corner of the axle.
		translate( [ -( width / 2 ) + radius,  ( height / 2 ) - radius, 0 ] ) circle( r = radius );
		translate( [  ( width / 2 ) - radius,  ( height / 2 ) - radius, 0 ] ) circle( r = radius );
		translate( [  ( width / 2 ) - radius, -( height / 2 ) + radius, 0 ] ) circle( r = radius );
		translate( [ -( width / 2 ) + radius, -( height / 2 ) + radius, 0 ] ) circle( r = radius );

		// Now add squares to fill in the spaces between the circles in each direction.
		square( [ width - ( radius * 2 ), height ],                 center = true );
		square( [ width,                  height - ( radius * 2 )], center = true );
	};
}
