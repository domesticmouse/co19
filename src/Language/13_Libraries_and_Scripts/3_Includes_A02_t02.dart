/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Compiling an include directive of the form #source(s); causes the Dart
 * system to attempt to compile the contents of the URI that is the value of s.
 * The top level declarations at that URI are then compiled by the Dart compiler
 * in the scope of the current library.
 * @description Checks that it is a compile-time error if URI is included twice.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#source("source.dart");
#source("source.dart");

main() {
  try {
    foo is int;
  } catch(e) {}
}