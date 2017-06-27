/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A list literal denotes a list, which is an integer indexed
 * collection of objects.
 * listLiteral:
 *   const? typeArguments? '[' (expressionList ','?)? ']'
 * ;
 * @description Checks that a list literal can't start with empty element.
 * @author msyabro
 * @compile-error
 * @reviewer kaigorodov
 */

main() {
  [, 1, 2, 3];
}
