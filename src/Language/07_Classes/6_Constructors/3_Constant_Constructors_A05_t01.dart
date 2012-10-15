/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When invoked from a constant object expression, a constant constructor
 * must throw an exception if any of its actual parameters would be a value that
 * prevent one of the potentially constant expressions within it from being a valid
 * compile-time constant.
 * @description Checks that compile-time error is produced if actual parameters passed to the constructor
 * make the constant initializer invalid. Note: this mechanism is described in 11.11.2
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 * @issue 811
 */

class A {
  final x;
  const A(var p) : x = p + 42;
}

main() {
  try {
    var a = const A(1.1); // parameter does not evaluate to int/bool/String
  } catch(x) {}
}
