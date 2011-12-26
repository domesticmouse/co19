/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let kI be a constructor declared in an interface I, and let kF be its 
 * corresponding constructor. Then:
 * - It is a compile-time error if kI and kF do not have identically named 
 *   optional parameters, declared in the same order.
 * @description Checks that it is a compile-time error if the default constructors kI and kF
 * do not have identically named optional parameters declared in the same order.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 * @needsreview issue 975
 */

class F {
  factory I(var v, [List c, String b, int a]) {}
}

interface I default F {
  I(var v, [List a, String b, int c]);
}

main() {
  try {
    new I(null, null, null, null);
  } catch(var e) {}
}

