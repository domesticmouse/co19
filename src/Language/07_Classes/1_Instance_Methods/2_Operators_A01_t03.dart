/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * operatorSignature: 
 *   returnType? operator operator formalParameterList 
 * ;
 * operator: 
 *   unaryOperator | 
 *   binaryOperator | 
 *   '[]' | 
 *   '[]=' | 
 * ;
 * unaryOperator: 
 *   negateOperator 
 * ;
 * binaryOperator: 
 *   multiplicativeOperator | 
 *   additiveOperator | 
 *   shiftOperator |
 *   relationalOperator | 
 *   equalityOperator | 
 *   bitwiseOperator 
 * ;
 * prefixOperator: 
 *   '-' | 
 *   negateOperator 
 * ;
 * negateOperator: 
 *   '!' |
 *   '~'
 * ;
 * @description Checks that it is not a compile-time error if a class attempts to define
 * an operator without a name because an instance method named 'operator' is allowed by the spec.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class C {
  int operator(var v) {}
}

main() {
  try {
    C c = new C();
  } catch (x) {}
}
