/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Type Variable Bound: T0 is a type variable X0 with bound B0
 *   and B0 <: T1
 * @description Check that if T0 is a type variable X0 with bound B0 and
 * B0 is not a subtype of T1 then T0 is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Global function required argument is
 * tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_type_variable_bound_fail_A01.dart and 
 * arguments_binding_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class T1 {}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();




namedArgumentsFunc1(T1 t1, {T1 t2}) {}
positionalArgumentsFunc1(T1 t1, [T1 t2]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(T1 t1) {}

    ArgumentsBindingClass.named(T1 t1, {T1 t2}) {}
    ArgumentsBindingClass.positional(T1 t1, [T1 t2]) {}

    factory ArgumentsBindingClass.fNamed(T1 t1, {T1 t2}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(T1 t1, [T1 t2]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(T1 t1, {T1 t2}) {}
    static positionalArgumentsStaticMethod(T1 t1, [T1 t2]) {}

    namedArgumentsMethod(T1 t1, {T1 t2}) {}
    positionalArgumentsMethod(T1 t1, [T1 t2]) {}

    set testSetter(T1 val) {}
}

class ArgumentsBindingClassSuper {          //# 23: compile-time error
  ArgumentsBindingClassSuper(T1 t1) {}     //# 23: compile-time error
}                                           //# 23: compile-time error

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper { //# 23: compile-time error
  ArgumentsBindingDesc(X0 t0) : super (t0) {}                  //# 23: compile-time error
}                                                               //# 23: compile-time error

main() {
  namedArgumentsFunc1(t0Instance); //# 01: compile-time error
  namedArgumentsFunc1(t1Instance, t2: t0Instance); //# 02: compile-time error
  positionalArgumentsFunc1(t0Instance); //# 03: compile-time error
  positionalArgumentsFunc1(t1Instance, t0Instance); //# 04: compile-time error
  new ArgumentsBindingClass(t0Instance); //# 05: compile-time error
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t0Instance); //# 06: compile-time error
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance, t2: t0Instance); //# 07: compile-time error
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t0Instance); //# 08: compile-time error
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance, t0Instance); //# 09: compile-time error
  new ArgumentsBindingClass(t1Instance).testSetter = t0Instance; //# 10: compile-time error
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance); //# 11: compile-time error
  ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance, t2: t0Instance); //# 12: compile-time error
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance); //# 13: compile-time error
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance, t0Instance); //# 14: compile-time error
  new ArgumentsBindingClass.named(t0Instance); //# 15: compile-time error
  new ArgumentsBindingClass.named(t1Instance, t2: t0Instance); //# 16: compile-time error
  new ArgumentsBindingClass.positional(t0Instance); //# 17: compile-time error
  new ArgumentsBindingClass.positional(t1Instance, t0Instance); //# 18: compile-time error
  new ArgumentsBindingClass.fNamed(t0Instance); //# 19: compile-time error
  new ArgumentsBindingClass.fNamed(t1Instance, t2: t0Instance); //# 20: compile-time error
  new ArgumentsBindingClass.fPositional(t0Instance); //# 21: compile-time error
  new ArgumentsBindingClass.fPositional(t1Instance, t0Instance); //# 22: compile-time error
  new ArgumentsBindingDesc(t0Instance); //# 23: compile-time error
}
