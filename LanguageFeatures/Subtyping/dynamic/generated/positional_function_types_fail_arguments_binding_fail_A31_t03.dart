/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Positional Function Types: T0 is U0 Function<X0 extends B00, ... ,
 * Xk extends B0k>(V0 x0, ..., Vn xn, [Vn+1 xn+1, ..., Vm xm])
 *
 *  and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
 *  Sp yp, [Sp+1 yp+1, ..., Sq yq])
 *  and p >= n
 *  and m >= q
 *  and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...q
 *  and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 *  and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 *  where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 *
 * @description Check that if T0 isn't a subtype of T1 if
 * B0i[Z0/X0, ..., Zk/Xk] !== B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from positional_function_types_fail_A31.dart and 
 * arguments_binding_fail_x03.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class U0 extends U1 {}

class U1 {}

class B0 {}

class B1 {}

class V0 {}

class V1 {}

class V2 {}

class V3 {}

class V4 {}

class S0 extends V0 {}

class S1 extends V1 {}

class S2 extends V2 {}

class S3 extends V3 {}

typedef T0 = U0 Function<X extends B0, Y extends B1>(V0 x0, V1 x1,
    [V2 x2, V3 x3, V4 x4]);
typedef T1 = U1 Function<X extends B0, Y extends B0>(S0 y0, S1 y1,
    [S2 x2, S3 x3]); //  Y extends B0, not B1

U0 t0Func<X extends B0, Y extends B1>(V0 x0, V1 x1, [V2 x2, V3 x3, V4 x4]) =>
    null;
U1 t1Func<X extends B0, Y extends B0>(S0 y0, S1 y1, [S2 x2, S3 x3]) => null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;



class ArgumentsBindingSuper1_t03 {
  void superTest(T1 val) {}
  void superTestPositioned(T1 val, [T1 val2]) {}
  void superTestNamed(T1 val, {T1 val2}) {}
  T1 get superGetter => forgetType(t0Instance);
  void set superSetter(T1 val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError);
  }
}

class ArgumentsBindingSuper2_t03<X> {
  void superTest(X val) {}
  void superTestPositioned(X val, [X val2]) {}
  void superTestNamed(X val, {X val2}) {}
  X get superGetter => forgetType(t0Instance);
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t03<X> extends Object with ArgumentsBindingSuper2_t03<X> {

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError);
  }
}

main() {
  // test class members
  Expect.throws(() {
    new ArgumentsBinding1_t03().superTest(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestPositioned(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestPositioned(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestNamed(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestNamed(t1Instance, val2: forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superGetter;
  }, (e) => e is TypeError);

  new ArgumentsBinding1_t03().test();

  // Test type parameters

}
