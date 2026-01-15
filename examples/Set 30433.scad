/**
 * A recreation of LEGO Technic set 30433, a wheel loader.
 * It's not strictly identical, but it should be physically compatible.
 *
 * @see https://www.lego.com/en-us/service/buildinginstructions/30433
 *
 * LEGO and Technic are trademarks of the LEGO Group.
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

// Step 1.
color( "gray" ) {
	translate( [ 0, technic_height_in_mm, 0 ] ) {
		rotate( [ 90, 0, 0 ] ) {
			technic_beam( length = 5 );
		}
	}
}

color( "blue" ) {
	translate( [ 0, 2 * technic_height_in_mm, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1 );
	translate( [ technic_beam_hole_spacing * 1, 2 * technic_height_in_mm, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );
	translate( [ technic_beam_hole_spacing * 4, 2 * technic_height_in_mm, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );
}

// Step 2.
color( "#333" ) {
	translate( [ technic_beam_hole_spacing * 2, 0, technic_beam_hole_spacing * 2 ] ) rotate( [ 90, 90, 0 ] ) technic_beam( length = 7, angles = [ 90 ], vertices = [ 3 ] );
}

color( "gray" ) {
	translate( [ technic_beam_hole_spacing * 2, -technic_height_in_mm, 0 ] ) {
		rotate( [ -90, 0, 0 ] ) {
			translate( [ 0, 0, -technic_axle_stud_height ] ) {
				technic_pin( bottom_type = "stud", top_friction = false );
			}
		}
	}

	translate( [ technic_beam_hole_spacing * 2, -technic_height_in_mm, technic_beam_hole_spacing ] ) {
		rotate( [ -90, 0, 0 ] ) {
			translate( [ 0, 0, -technic_axle_stud_height ] ) {
				technic_pin( bottom_type = "stud", top_friction = false );
			}
		}
	}
}

// Step 3.
color( "gray" ) {
	translate( [ -technic_beam_hole_spacing * 3, 0, 0 ] ) {
		rotate( [ 90, 0, 0 ] ) {
			technic_beam( length = 5 );
		}
	}
}

color( "blue" ) {
	translate( [ -technic_beam_hole_spacing * 3, 2 * technic_height_in_mm, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );
	translate( [ technic_beam_hole_spacing * 1, 2 * technic_height_in_mm, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );
	translate( [ technic_beam_hole_spacing * 4, 2 * technic_height_in_mm, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );
}


color( "tan" ) {
	translate( [ -technic_beam_hole_spacing * 1, 0, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 1, top_length = 2, top_friction = false, bottom_friction = false );
}

// @todo Orange triangular thing. 61409

// Step 4
color( "green" ) {
	translate( [technic_beam_hole_spacing * 2, technic_height_in_mm, technic_beam_hole_spacing * 2] ) rotate( [ 90, 180, 0 ] ) technic_beam( length = 7, angles = [ 90 ], vertices = [ 5 ] );
}

color( "blue" ) {
	translate( [ -technic_beam_hole_spacing * 2, 2 * technic_height_in_mm, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );
	translate( [ technic_beam_hole_spacing, 2 * technic_height_in_mm, technic_beam_hole_spacing * 2 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );
	translate( [ technic_beam_hole_spacing * 2, 2 * technic_height_in_mm, technic_beam_hole_spacing * 2 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 2, top_length = 1, top_friction = false, bottom_friction = false );

}

// Step 5
color( "yellow" ) {
	translate( [ technic_beam_hole_spacing, 0, 0 ] ) translate( [0, 0,technic_beam_hole_spacing ] ) rotate( [ 90, -90, 0 ] ) technic_beam( height = 1/2, length = 3, axle_holes = [ 1, 3 ] );
	translate( [ technic_beam_hole_spacing, -technic_beam_hole_spacing / 2, 0 ] ) translate( [0, 0,technic_beam_hole_spacing ] ) rotate( [ 90, -90, 0 ] ) technic_beam( height = 1/2, length = 5, axle_holes = [ 1, 3, 5 ] );
}

color( "gray" ) {
	translate( [ technic_beam_hole_spacing, -technic_height_in_mm, technic_beam_hole_spacing ] ) rotate( [ -90, 0, 0 ] ) technic_axle( length = 3 );
	translate( [ technic_beam_hole_spacing, -technic_height_in_mm, technic_beam_hole_spacing * 3 ] ) rotate( [ -90, 0, 0 ] ) technic_axle( length = 3 );
}

// Step 6.
// A custom excavator hood is added.

// Step 7
color( "#333" ) {
	translate( [ technic_beam_hole_spacing * 2, technic_height_in_mm * 2, technic_beam_hole_spacing * 2 ] ) rotate( [ 90, 90, 0 ] ) technic_beam( length = 7, angles = [ 90 ], vertices = [ 3 ] );
}

color( "gray" ) {
	translate( [ technic_beam_hole_spacing * 2, technic_height_in_mm * 2, 0 ] ) {
		rotate( [ 90, 0, 0 ] ) {
			translate( [ 0, 0, -technic_axle_stud_height ] ) {
				technic_pin( bottom_type = "stud", top_friction = false );
			}
		}
	}

	translate( [ technic_beam_hole_spacing * 2, technic_height_in_mm * 2, technic_beam_hole_spacing ] ) {
		rotate( [ 90, 0, 0 ] ) {
			translate( [ 0, 0, -technic_axle_stud_height ] ) {
				technic_pin( bottom_type = "stud", top_friction = false );
			}
		}
	}
}

// Step 8
color( "gray" ) {
	translate( [ -technic_height_in_mm * 3, technic_height_in_mm, 0 ] ) {
		rotate( [ -90, 0, 0 ] ) {
			technic_beam( length = 5 );
		}
	}
}

// Step 9
color( "yellow" ) {
	translate( [ technic_beam_hole_spacing, technic_height_in_mm * 1.5, 0 ] ) translate( [0, 0,technic_beam_hole_spacing ] ) rotate( [ 90, -90, 0 ] ) technic_beam( height = 1/2, length = 3, axle_holes = [ 1, 3 ] );
}

translate( [ technic_beam_hole_spacing * 3,  technic_height_in_mm / 2, technic_beam_hole_spacing * 2.5 ]) rotate([0,0,90]) union() {
	translate( [ 0, 0, -technic_height_in_mm ] ) union() {
	// Step 10.1
	color( "brown" ) {
		technic_axle( length = 5, stop = true );
	}

	// Step 10.2
	color( "gray" ) technic_connector_hub();

	color( "gray" ) translate( [ 0, 0, 1 * technic_height_in_mm ] ) technic_worm_gear( height = 2 );

	color( "yellow" ) {
		translate( [ technic_height_in_mm * .75, 0, technic_height_in_mm * .5 ] ) {
			rotate( [ 0, 90, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm * .25 ] ) {
					technic_bush();
				}
			}
		}
	}

	color( "yellow" ) {
		translate( [ -technic_height_in_mm * .75, 0, technic_height_in_mm * .5 ] ) {
			rotate( [ 0, 90, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm * .25 ] ) {
					technic_bush();
				}
			}
		}
	}
}
	// Step 10.3

	translate( [ 0, 0, technic_height_in_mm * 2 ] ) {
		color( "gray" ) {
			technic_connector_hub();
		}

		color( "yellow" ) {
			translate( [ technic_beam_hole_spacing - ( technic_height_in_mm / 4 ), 0, technic_height_in_mm / 2 ] ) {
				rotate( [ 0, 90, 0 ] ) {
					translate( [ 0, 0, -technic_height_in_mm / 4 ] ) {
						rotate( [ 0, 0, 90 ] ) {
							technic_beam( height = 1/2, length = 3, axle_holes = [ 1, 3 ] );
						}
					}
				}
			}
		}

		color( "yellow" ) {
			translate( [ - technic_beam_hole_spacing + ( technic_height_in_mm / 4 ), 0, technic_height_in_mm / 2 ] ) {
				rotate( [ 0, 90, 0 ] ) {
					translate( [ 0, 0, -technic_height_in_mm / 4 ] ) {
						rotate( [ 0, 0, 90 ] ) {
							technic_beam( height = 1/2, length = 3, axle_holes = [ 1, 3 ] );
						}
					}
				}
			}
		}

		color( "gray" ) {
			let ( axle_length = 3 ) {
				translate( [ -technic_height_in_mm * axle_length / 2, 2 * technic_beam_hole_spacing, technic_beam_hole_spacing / 2 ] ) {
					rotate( [ 0, 90, 0 ] ) technic_axle( length = axle_length );
				}
			}
		}

		color( "yellow" ) {
			translate( [ -technic_height_in_mm * .25, technic_beam_hole_spacing * 2, technic_height_in_mm / 2] ) {
				rotate( [ 90, 0, 90 ] ) {
					translate( [ 0, 0, -technic_height_in_mm * .25 ] ) {
						technic_bush();
					}
				}
			}
		}

		color( "yellow" ) {
			translate( [ technic_height_in_mm * .25, technic_beam_hole_spacing * 2, technic_height_in_mm / 2] ) {
					rotate( [ 90, 0, 90 ] ) {
					translate( [ 0, 0, -technic_height_in_mm * .25 ] ) {
						technic_bush();
					}
				}
			}
		}

		color( "gray" ) {
			translate( [ 0, 0, technic_height_in_mm + ( technic_height_in_mm * .5 )] ) {
				rotate( [ 0, 0, 45 ] ) technic_gear_double_sided( teeth = 8, width = 1.5 );
			}
		}
	}

	// Step 10.4
	color( "#333" ) {
		translate( [ -technic_height_in_mm * 1.5 , 0, - technic_beam_hole_spacing - ( technic_beam_hole_spacing / 2 ) ] ) {
			rotate( [ 0, -90, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_beam( length = 5, axle_holes = [ 1, 5 ], height = 1/2 );
				}
			}
		}
	}

	color( "#333" ) {
		translate( [ technic_height_in_mm * 1 , 0, - technic_beam_hole_spacing - ( technic_beam_hole_spacing / 2 ) ] ) {
			rotate( [ 0, -90, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_beam( length = 5, axle_holes = [ 1, 5 ], height = 1/2 );
				}
			}
		}
	}

	color( "yellow" ) {
		let ( axle_length = 5 ) {
			translate( [ 0, 0, -technic_beam_hole_spacing * 1.5 ] ) {
				rotate( [ 0, 90, 0 ] ) {
					translate( [ 0, 0, - ( axle_length * technic_height_in_mm ) / 2 ] ) {
						technic_axle( length = axle_length );
					}
				}
			}
		}
	}

	color( "#333" ) {
		let ( connector_length = 2 ) {
			translate( [ 0, 0, -technic_beam_hole_spacing * 1.5 ] ) {
				rotate( [ 0, 90, 0 ] ) {
					translate( [ 0, 0, - ( connector_length * technic_height_in_mm ) / 2 ] ) {
						technic_pin_connector( length = connector_length );
					}
				}
			}
		}
	}

	// Step 10.5
	color( "yellow" ) {
		translate( [ technic_height_in_mm * 1 , 2 * technic_beam_hole_spacing, - technic_beam_hole_spacing - ( technic_beam_hole_spacing / 2 ) ] ) {
			rotate( [ 0, -90, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_beam( length = 5, axle_holes = [ 1, 5 ], height = 1/2 );
				}
			}
		}
	}

	color( "yellow" ) {
		translate( [ -technic_height_in_mm * 1.5 , 2 * technic_beam_hole_spacing, - technic_beam_hole_spacing - ( technic_beam_hole_spacing / 2 ) ] ) {
			rotate( [ 0, -90, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_beam( length = 5, axle_holes = [ 1, 5 ], height = 1/2 );
				}
			}
		}
	}

}

// End of step 10
// @todo Missing orange stairs 61409
color( "tan" ) {
	translate([0, technic_height_in_mm, 0] ) rotate( [180, 0, 0] ) translate( [ -technic_beam_hole_spacing * 1, 0, 0 ] ) rotate( [ 90, 0, 0 ] ) technic_pin( bottom_length = 1, top_length = 2, top_friction = false, bottom_friction = false );
}

// Step 11
color( "yellow" ) {
	translate( [ technic_beam_hole_spacing * 3,  technic_height_in_mm / 2, -technic_beam_hole_spacing * .5 ]) {
		rotate( [ 0, 0, 90 ] ) {
			translate( [ 0, 0, technic_beam_hole_spacing * 2 ] ) {
				let ( axle_length = 5 ) {
					translate( [ 0, 0, -technic_beam_hole_spacing * 1.5 ] ) {
						rotate( [ 0, 90, 0 ] ) {
							translate( [ 0, 0, - ( axle_length * technic_height_in_mm ) / 2 ] ) {
								technic_axle( length = axle_length );
							}
						}
					}
				}
			}
		}
	}
}

translate( [ technic_beam_hole_spacing * 4, -technic_height_in_mm, technic_beam_hole_spacing * 3 ] ) {
	rotate( [ 90, 180, 0 ] ) {
		color( "yellow" ) {
			technic_beam( length = 5, vertices = [ 2 ], angles = [ 90 ], axle_holes = [ 5 ] );
		}

		color( "tan" ) {
			translate( [ technic_beam_hole_spacing, 0, -technic_axle_stud_height ]) {
				technic_pin( bottom_type = "stud", top_friction = false );
			}
		}
	}
}

// Step 12.
color( "tan" ) {
	translate( [ 6 * technic_beam_hole_spacing,0,0] ) rotate([ 90, 0, 0]) technic_pin( top_length = 2, top_friction = false, bottom_friction = false );
	translate( [ 6 * technic_beam_hole_spacing,technic_height_in_mm,0] ) rotate([ -90, 0, 0]) technic_pin( top_length = 2, top_friction = false, bottom_friction = false );
}

// Step 13
translate( [ technic_beam_hole_spacing * 7, technic_height_in_mm / 2, technic_beam_hole_spacing * 3 ] ) {
	rotate( [ 0, 45, 0 ] ) {
		translate( [ technic_height_in_mm, 0, 0 ] ) {
			// Step 13.1
			color( "gray" ) {
				rotate( [ 90, 0, 0 ] ) translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_connector_hub();
				}
			}

			color( "blue" ) {
				rotate( [ -90, 0, 0 ] ) {
					translate( [ 0, 0, -technic_height_in_mm * 1.5 ] ) {
						technic_pin( top_length = 2 );
					}
				}
			}

			// Step 13.2
			color( "gray" ) {
				translate( [ -technic_height_in_mm, 0, 0 ] ) rotate( [90,0,90 ] ) translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_connector_hub();
				}
			}

			// @todo missing connector 53923
		}
	}

	// Step 13.3
	color( "#333" ) {
		translate( [ -technic_beam_hole_spacing * 3, technic_height_in_mm, 0 ] ) {
			rotate( [ -90, 0, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_beam( length = 7, vertices = [ 4 ], angles = [ 45 ], axle_holes = [ 1, 7 ] );
				}
			}
		}
	}

	// Step 13.4
	color( "yellow" ) {
		let ( axle_length = 5 ) {
			translate( [ -technic_beam_hole_spacing * 3, 0, 0 ] ) rotate( [ 90, 0, 0 ] ) translate( [ 0, 0, -axle_length * technic_height_in_mm / 2 ] ) technic_axle( length = axle_length );
		}
	}

	color( "gray" ) translate( [ -technic_beam_hole_spacing * 3, 0, 0 ] ) rotate( [ 90, 45, 0 ] ) technic_gear_double_sided( teeth = 8, width = 1.5 );

	// Step 13.5
	color( "#333" ) {
		translate( [ -technic_beam_hole_spacing * 3, -technic_height_in_mm, 0 ] ) {
			rotate( [ -90, 0, 0 ] ) {
				translate( [ 0, 0, -technic_height_in_mm / 2 ] ) {
					technic_beam( length = 7, vertices = [ 4 ], angles = [ 45 ], axle_holes = [ 1, 7 ] );
				}
			}
		}
	}
}

// Step 14.
translate( [ technic_beam_hole_spacing * 4, technic_height_in_mm * 3, technic_beam_hole_spacing * 3] ) {
	rotate( [ 90, 180, 0 ] ) {
		color( "yellow" ) {
			technic_beam( length = 5, vertices = [ 2 ], angles = [ 90 ], axle_holes = [ 5 ] );
		}

		color( "tan" ) {
			translate( [0,0,technic_height_in_mm + technic_axle_stud_height ] ) rotate([180,0,0])
			translate( [ technic_beam_hole_spacing, 0, 0 ]) {
				technic_pin( bottom_type = "stud", top_friction = false );
			}
		}
	}
}

// Step 15
translate( [ -technic_beam_hole_spacing, -technic_height_in_mm, 0 ] ) {
	rotate( [ 90, 0, 0 ] ) {
		color( "yellow" ) rotate( [ 180, 0, 0 ] ) translate( [ 0, 0, -14 ] ) technic_wheel( diameter = 18, width = 14, hole_type = "pin" );
		color( "#333" ) technic_tire( diameter = 24, tread_thickness = 3, tread_width = 14 );
	}
}

translate( [ technic_beam_hole_spacing* 6, -technic_height_in_mm, 0 ] ) {
	rotate( [ 90, 0, 0 ] ) {
		color( "yellow" ) rotate( [ 180, 0, 0 ] ) translate( [ 0, 0, -14 ] ) technic_wheel( diameter = 18, width = 14, hole_type = "pin" );
		color( "#333" ) technic_tire( diameter = 24, tread_thickness = 3, tread_width = 14 );
	}
}

translate( [ technic_beam_hole_spacing * 6, technic_height_in_mm * 2, 0 ] ) {
	rotate( [ -90, 0, 0 ] ) {
		color( "yellow" ) rotate( [ 180, 0, 0 ] ) translate( [ 0, 0, -14 ] ) technic_wheel( diameter = 18, width = 14, hole_type = "pin" );
		color( "#333" ) technic_tire( diameter = 24, tread_thickness = 3, tread_width = 14 );
	}
}

translate( [ -technic_beam_hole_spacing, technic_height_in_mm * 2, 0 ] ) {
	rotate( [ -90, 0, 0 ] ) {
		color( "yellow" ) rotate( [ 180, 0, 0 ] ) translate( [ 0, 0, -14 ] ) technic_wheel( diameter = 18, width = 14, hole_type = "pin" );
		color( "#333" ) technic_tire( diameter = 24, tread_thickness = 3, tread_width = 14 );
	}
}
