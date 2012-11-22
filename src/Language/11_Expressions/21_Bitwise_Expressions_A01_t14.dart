/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Bitwise expressions invoke the bitwise operators on objects.
 * bitwiseOrExpression:
 *   bitwiseXorExpression ('|' bitwiseXorExpression)* |
 *   super ('|' bitwiseXorExpression)+
 * ;
 * bitwiseXorExpression:
 *   bitwiseAndExpression ('^' bitwiseAndExpression)* |
 *   super ('^' bitwiseAndExpression)+
 * ;
 * bitwiseAndExpression:
 *   equalityExpression ('&' equalityExpression)* |
 *   super ('&' equalityExpression)+
 * ;
 * bitwiseOperator:
 * '&' |
 * '^' |
 * '|'
 * ;
 * A bitwise expression is either an equality expression, or an invocation
 * of a bitwise operator on either super or an expression e1, with argument e2.
 * @description Checks that a reference to a type alias declaration can be used
 * as the first operand of a bitwise expression without a compile error.
 * @author kaigorodov
 * @reviewer rodionov
 */

typedef String fun();

main() {
  try {
    fun | 1;
    throw "NoSuchMethodError expected.";
  } on NoSuchMethodError catch(e) {}
}