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
beam_length = 5; // [ 1:100 ]

// The height (or thickness) of the beam. A height of 2 is equivalent to two beams stuck side-by-side.
beam_height = 1; // [ 0.5:.5:100 ]

// Which holes should be axle holes? Numbers separated by commas. e.g., "1, 4, 7"
beam_axle_holes = "";

/* [Angles] */

// If this is an angled beam, what should be the change in angle (clockwise) at each vertex?  Numbers separated by commas. e.g., "1, 4, 7"
beam_angles = "";

// If this is an angled beam, which holes should be the vertices at which the angle changes?  Numbers separated by commas. e.g., "1, 4, 7"
beam_vertices = "";

color( "red" ) technic_beam(
	length = beam_length,
	height = beam_height,
	angles = array_of_strings_to_array_of_floats( split_str( remove_everything_thats_not_a_number_or_comma( beam_angles ), "," ) ),
	vertices = array_of_strings_to_array_of_ints( split_str( remove_everything_thats_not_a_number_or_comma( beam_vertices ), "," ) ),
	axle_holes = array_of_strings_to_array_of_ints( split_str( remove_everything_thats_not_a_number_or_comma( beam_axle_holes ), "," ) )
);

// Functions for managing the conversion of a list of numbers in a text field to an array of actual numbers.
function remove_everything_thats_not_a_number_or_comma( str ) = chr( [ for ( s = str ) if ( ( ord( s ) >= 48 && ord( s ) <= 57 ) || s == "," || s == "." ) ord( s ) ] );
function array_of_strings_to_array_of_ints( str_arr ) = [ for ( s = str_arr ) if ( s != "" && s ) int( s ) ];
function array_of_strings_to_array_of_floats( str_arr ) = [ for ( s = str_arr ) if ( s != "" && s ) float( s ) ];

// From https://github.com/openscad/openscad/issues/4568
function int(s, ret=0, i=0) =
	i >= len(s)
	? ret
	: int(s, ret*10 + ord(s[i]) - ord("0"), i+1);

// From https://github.com/openscad/openscad/issues/4568#issuecomment-1478860668
function float (s) = let(
    _f = function(s, i, x, vM, dM, ddM, m)
      i >= len(s) ? round(x*dM)/dM :
      let(
        d = ord(s[i])
      )
      (d == 32 && m == 0) || (d == 43 && (m == 0 || m == 2)) ?
        _f(s, i+1, x, vM, dM, ddM, m) :
      d == 45 && (m == 0 || m == 2) ?
        _f(s, i+1, x, vM, -dM, ddM, floor(m/2)+1) :
      d >= 48 && d <= 57 ?
        _f(s, i+1, x*vM + (d-48)/dM, vM, dM*ddM, ddM, floor(m/2)+1) :
      d == 46 && m<=1 ? _f(s, i+1, x, 1, 10*dM, 10, max(m, 1)) :
      (d == 69 || d == 101) && m==1 ? let(
          expon = _f(s, i+1, 0, 10, 1, 1, 2)
        )
        (is_undef(expon) ? undef : expon >= 0 ?
          (round(x*dM)*(10^expon/dM)) :
          (round(x*dM)/dM)/10^(-expon)) :
      undef
  )
  _f(s, 0, 0, 10, 1, 1, 0);

// from https://github.com/JustinSDK/dotSCAD/blob/master/src/util/_impl/_split_str_impl.scad

/**
* sub_str.scad
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib3x-sub_str.html
*
*/

function sub_str(t, begin, end) =
	let(
		ed = is_undef(end) ? len(t) : end,
		cum = [
			for (i = begin, s = t[i], is_continue = i < ed;
			is_continue;
			i = i + 1, is_continue = i < ed, s = is_continue ? str(s, t[i]) : undef) s
		]
	)
	cum[len(cum) - 1];

function _split_t_by(idxs, t) =
	let(leng = len(idxs))
	[sub_str(t, 0, idxs[0]), each [for (i = 0; i < leng; i = i + 1) sub_str(t, idxs[i] + 1, idxs[i + 1])]];

function split_str(t, delimiter) = len(search(delimiter, t)) == 0 ? [t] : _split_t_by(search(delimiter, t, 0)[0], t);