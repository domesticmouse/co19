/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is a dynamic then T0 is a subtype of a
 * type T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1. Test mixin members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_top_A02.dart and 
 * arguments_binding_x03.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class T0 {}

T0 t0Instance = new T0();
dynamic t1Instance = 3.14;




class ArgumentsBindingMixin1_t03 {
  dynamic m;

  void superTest(dynamic val) {}
  void superTestPositioned(dynamic val, [dynamic val2]) {}
  void superTestNamed(dynamic val, {dynamic val2}) {}
  dynamic get superGetter => m;
  void set superSetter(dynamic val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingMixin1_t03 {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

class ArgumentsBindingMixin2_t03<X> {
  X m;

  void superTest(X val) {}
  void superTestPositioned(X val, [X val2]) {}
  void superTestNamed(X val, {X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t03<X> extends Object with ArgumentsBindingMixin2_t03<X> {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

main() {
  ArgumentsBinding1_t03 c1 = new ArgumentsBinding1_t03();

  c1.test(t0Instance, t1Instance);
  c1.superTest(t0Instance);
  c1.superTestPositioned(t0Instance);
  c1.superTestPositioned(t1Instance, t0Instance);
  c1.superTestNamed(t0Instance);
  c1.superTestNamed(t1Instance, val2: t0Instance);
  c1.superSetter = t0Instance;
  c1.superGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  ArgumentsBinding2_t03<dynamic> c2 = new ArgumentsBinding2_t03<dynamic>();
  c2.test(t0Instance, t1Instance);
  c2.superTest(t0Instance);
  c2.superTestPositioned(t0Instance);
  c2.superTestPositioned(t1Instance, t0Instance);
  c2.superTestNamed(t0Instance);
  c2.superTestNamed(t1Instance, val2: t0Instance);
  c2.superSetter = t0Instance;
  c2.superGetter;
  //# -->
}
