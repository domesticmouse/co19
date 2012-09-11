/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * getterSignature:
 *   static? returnType? get identifier
 * ;
 * @description Checks that a compile-time error is produced
 * if non-empty formal parameter list is present.
 * @compile-error
 * @author kaigorodov
 */

class C {
  get getter([var value = null]) { throw new C(); }
}

main() {
  try {
    var x = new C().getter;
  } catch (e) {}
}