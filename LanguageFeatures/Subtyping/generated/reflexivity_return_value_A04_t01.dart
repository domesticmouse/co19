/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both Null then T0 is a subtype
 * of a type T1
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

Null t0Instance = null;
Null t1Instance = null;




Null returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static Null staticTestMethod() => forgetType(t0Instance);

  Null testMethod() => forgetType(t0Instance);

  Null get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  Null returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  new ReturnValueGen<Null>().testMethod();
  new ReturnValueGen<Null>().testGetter;
}
