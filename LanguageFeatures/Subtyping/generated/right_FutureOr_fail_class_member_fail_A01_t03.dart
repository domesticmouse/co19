/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is FutureOr<S1> and a type T0 is not
 * a subtype of types Future<S1> or S1, then a type T0 is not a subtype of a
 * type T1.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../utils/common.dart";
import "../../../Utils/expect.dart";

class S1 {}
class T0 {}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());




class ClassMemberSuper1_t03 {
  FutureOr<S1> m;

  void set superSetter(FutureOr<S1> val) {}
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t03<X> {
  X m;

  void set superSetter(X val) {}
}

class ClassMember2_t03<X> extends ClassMemberSuper2_t03<X> {

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {
    new ClassMember1_t03().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().test2();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMember2_t03<FutureOr<S1>>().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<FutureOr<S1>>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<FutureOr<S1>>().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<FutureOr<S1>>().test2();
  }, (e) => e is TypeError);
}