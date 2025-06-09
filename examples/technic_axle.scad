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

axle_types = rands(0, 4, 13);

translate( [ -7 * 7, 0, 0 ] ) {
    for ( i = [ 2 : 13 ]) {
		axle_type = floor(axle_types[i - 2]);
        translate([ i * 7, 0, 0] ) {
			if (axle_type == 0) {
				color( c = (i%2 == 1) ? [ 156/255, 156/255, 156/255, 1.0 ] : [ 33/255, 33/255, 33/255, 1.0 ] ) technic_axle( length = i );
			} else if (axle_type == 1) {
				color( c = [ 130/255, 66/255, 42/255, 1.0 ] ) technic_axle( length = i, stop = true );
			} else if (axle_type == 2) {
				color( c = [ 83/255, 93/255, 96/255, 1.0 ] ) technic_axle( length = i, stud = true );
			} else if (axle_type == 3) {
				color( c = [ 197/255, 0, 6/255, 1.0 ] ) technic_axle( length = i, notch = true );
			}
		}
    }
}
