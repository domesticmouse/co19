/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, [Tx1 x1, ..., Txk xk]) -> T is a subtype of the function
 * type (S1, ..., Sn, [Sy1 y1, ..., Sym ym ]) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. k >= m and for all i, 1 <= i <= n+m, Ti <=> Si.
 * @description Checks that function type t1 is not a subtype of function type t2 
 * even if just one of t1's optional positional parameters has a type that is not mutually assignable with
 * the type of t2's corresponding positional optional parameter.
 * @author iefremov
 * @reviewer rodionov
 */

class B {}

typedef B func(Object o);
typedef B t1(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]);

B f1(int i, B b, Map<int, num> m, var x, [var ox, func ob, List<num> ol, bool obool]) {}
//                                                ^^^ func <=/=> B
B f2(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<B> ol, bool obool]) {}
//                                                          ^^^ B <=/=> num
B f3(num i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, int obool]) {}
//                                                                    ^^^ int <=/=> bool

main() {
  Expect.isFalse(f1 is t1);
  Expect.isFalse(f2 is t1);
  Expect.isFalse(f3 is t1);
}