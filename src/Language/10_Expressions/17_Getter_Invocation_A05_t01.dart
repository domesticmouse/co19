/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a getter invocation i of the form C.m proceeds as follows:
 * If there is no class C in the enclosing lexical scope of i, or if C does not
 * declare, implicitly or explicitly, a getter named m, then a NoSuchMethodError
 * is thrown.
 * Otherwise, the getter function C.m is invoked. The value of i is the result returned by
 * the call to the getter function.
 * It is a static warning if there is no class C in the enclosing lexical scope
 * of i, or if C does not declare, implicitly or explicitly, a getter named m. The
 * static type of i is the declared return type of C.m.
 * @description Checks that static getter m is invoked when evaluating a getter invocation C.m.
 * @author msyabro
 * @reviewer rodionov
 */

class TestException {}

class C {
  static get m {
    throw new TestException();
  }
}

main()  {
  try {
    C.m;
    Expect.fail("TestException is expected");
  }  on TestException catch(e) {}
}