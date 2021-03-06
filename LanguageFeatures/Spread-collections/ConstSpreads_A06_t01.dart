/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This enables in-place literals (which aren't very useful):
 *
 *   const list = [...["why"]];
 * @description Checks that in-place literals are enabled for lists
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "../../Utils/expect.dart";

main() {
  const res1 = [...["why"]];
  Expect.listEquals(["why"], res1);
  const res2 = [...?["not"]];
  Expect.listEquals(["not"], res2);

  const res3 = [...{"why"}];
  Expect.listEquals(["why"], res3);
  const res4 = [...?{"not"}];
  Expect.listEquals(["not"], res4);

  const res5 = [1, 2, ...[1, 2, 3], 4, 15, 1, ...[null], ...{12345}, [1, 2, 3]];
  Expect.listEquals([1, 2, 1, 2, 3, 4, 15, 1, null, 12345, [1, 2, 3]], res5);
  const res6 = [1, 2, 3, ...[4, 5, 6], ...?[7, 8, 9], [1, 2, 3]];
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, [1, 2, 3]], res6);

  const res7 = [[1, 2, 3, ...[4, 5, 6], ...?{7, 8, 9}, {1, 2, 3}]];
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, {1, 2, 3}], res7);
}
