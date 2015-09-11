/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isGetter
 * Whether the invocation was a getter call. If so, both types of arguments is empty.
 * @description Checks that isGetter returns false for setters and instance method
 * invocations.
 * @static-warning
 * @author ilya
 */
import "../../../Utils/expect.dart";

class D {
  method(x, y, z) {}
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isGetter);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isGetter);
  }
  test() {
    foo();
    method();
    bar = 1;
    getOnly = 1;
    super.foo();
    super.method();
    super.bar = 1;
    super.getOnly = 1;
  }
  var d;
  C() : d = new D();
}

main() {
  var x = new C();
  var y = new C();
  x+y;
  -x;
  x.foo();
  x.method();
  x.bar = 1;
  x.getOnly = 1;
  x.test();
  x.d();
}