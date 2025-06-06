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

color( "gray" ) technic_connector_hub( spoke_lengths = [ 1, 1 ], spoke_angles = [ 0, 180 ] );
color( "white" ) translate( [ 0, 20, 0 ] ) technic_connector_hub( spoke_angles = [ 0, 90 ] );
color( "orange" ) translate( [ 0, 40, 0 ] ) technic_connector_hub( spoke_angles = [ 0 ], spoke_lengths = [ 1 ], spoke_heights = [ 1 ], spoke_types = [ "axle connector" ] );
color( "cornflowerblue" ) translate( [ 0, 60, 0 ] ) technic_connector_hub( spoke_angles = [ 0 ], spoke_heights = [ 1 ], spoke_types = [ "axle" ], spoke_lengths = [ 3 ] );
color( "yellow" ) translate( [ 0, 80, 0 ] ) technic_connector_hub( hub_type = "axle", spoke_lengths = [ 1, 1, 1 ], spoke_angles = [ 0, 120, 240 ], spoke_heights = [ 1, 1, 1 ], spoke_types = [ "axle", "axle", "axle" ] );
color( "silver" ) translate( [ 0, 100, 0 ] ) render() technic_connector_hub( hub_type = "axle", spoke_types = [ "bar connector", "bar connector" ] );
color( "green" ) translate( [ 0, 120, 0 ] ) technic_connector_hub( hub_type = "axle", spoke_lengths = [ 1, 1 ], spoke_angles = [ 0, 90 ], spoke_heights = [ 1, 1 ], spoke_types = [ "pin", "pin" ] );
color( "red" ) translate( [ 0, 150, 0 ] ) technic_connector_hub( hub_type = "pin", spoke_lengths = [ 1, 1, 1, 1 ], spoke_angles = [ 0, 90, 180, 270 ], spoke_heights = [ 1, 1, 1, 1 ], spoke_types = [ "tow ball", "tow ball", "tow ball", "tow ball" ] );
