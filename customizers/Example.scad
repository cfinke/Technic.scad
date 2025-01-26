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

use <../Technic.scad>;

$fa = 1; $fs = 0.05;

translate( [ 0, 30, 0 ] ) technic_beam();
translate( [ 0, 0, 0 ] ) technic_pin_connector();
translate( [ 0, -30, 0 ] ) technic_axle_pin();

translate( [ 30, 0, 0 ] ) technic_axle();

translate( [ 60, 30, 0 ] ) technic_elbow();
translate( [ 60, 0, 0 ] ) technic_24_tooth_gear();
translate( [ 30, -30, 0 ] ) technic_pin();
