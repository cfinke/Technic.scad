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

color( "red" )    translate( [ 0, 0, 0 ] )                           technic_beam( length = 2, height = 1 );
color( "white" )  translate( [ 0, -15, 0 ] )                         technic_beam( length = 3, axle_holes = [1,3] );
color( "green" )  translate( [ 0, -30, 0 ] )                         technic_beam( length = 4, height = 1/2, axle_holes = [2] );
color( "CornflowerBlue" ) translate( [ 0, 15, 0 ] )                  technic_beam( length = 5, height = 2 );
color( "gray" )   translate( [ 0, -45, 0 ] )                         technic_beam( length = 9, height = 1,   angles = [ 90 ], vertices = [ 6 ] );
color( "purple" ) translate( [ -15, 0, 0 ] ) rotate( [ 0, 0, 270 ] ) technic_beam( length = 7, height = 1,   angles = [ -30 ], vertices = [ 5 ], axle_holes = [1,5,7] );
color( "orange" ) translate( [ -60, -40, 0 ] ) technic_beam( length = 21, angles = [ 18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18 ], vertices = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20] );
