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

translate( [ -3 * technic_pin_multiple_offset, 0, 0 ] ) {
	color( "orange" ) translate( [ -technic_pin_multiple_offset, 0, 0 ] ) technic_pin( bottom_type = "stud" );
	color( "yellow" ) translate( [ 0, 0, 0 ] ) technic_pin();
	color( "white" ) translate( [ technic_pin_multiple_offset, 0, 0 ] ) technic_pin( top_length = 2, bottom_friction = false );
	color( "red" ) translate( [ technic_pin_multiple_offset * 2, 0, 0 ] ) technic_pin( top_friction = false, multiplier = 2 );
	color( "gray" ) translate( [ technic_pin_multiple_offset * 4, 0, 0 ] ) technic_pin( top_length = 2, top_friction = false, multiplier = 3, squared_pin_holes = true);
	color( "cornflowerblue" ) translate( [ technic_pin_multiple_offset * 7, 0, 0 ] ) technic_pin( bottom_type = "tow ball" );
	color( "thistle" ) translate( [ technic_pin_multiple_offset * 8, 0, 0 ] ) technic_pin( bottom_length = 2, bottom_type = "tow ball" );
	color( "blue" ) translate( [ technic_pin_multiple_offset * 9, 0, 0 ] ) technic_pin( top_length = 2, bottom_length = 1, bottom_type = "bush" );
}