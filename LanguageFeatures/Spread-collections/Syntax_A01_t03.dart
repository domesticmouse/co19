/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We extend the list grammar to allow spread elements in addition to
 * regular elements:
 * listLiteral:
 *   const? typeArguments? '[' spreadableList? ']'
 *   ;
 *
 *   spreadableList:
 *   spreadableExpression ( ',' spreadableExpression )* ','?
 *   ;
 *
 *   spreadableExpression:
 *   expression |
 *   spread
 *   ;
 *
 *   spread:
 *   ( '...' | '...?' ) expression
 *   ;
 *
 * Instead of [expressionList], this uses a new [spreadableList] rule since
 * [expressionList] is used elsewhere in the grammar where spreads aren't
 * allowed. Each element in a list is either a normal expression or a spread
 * element. If the spread element starts with [...?], it's a null-aware spread
 * element.
 * @description Checks that [spreadableList] can be constant
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "../../Utils/expect.dart";

main() {
  List list1 = ["abc", "int", "hello"];
  List list3 = [1, 2, 12];
  List list4 = ["test"];

  List a = const [...list1];
  Expect.listEquals(["abc", "int", "hello"], a);

  a = const ["testme", ...list1];
  Expect.listEquals(["testme", "abc", "int", "hello"], a);

  a = const [...list1, "testme"];
  Expect.listEquals(["abc", "int", "hello", "testme"], a);

  a = const [...list1, ...list3, ...list4];
  Expect.listEquals(["abc", "int", "hello", 1, 2, 12, ""], a);
}
