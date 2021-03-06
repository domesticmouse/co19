/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This is true even if the object being spread is a user-defined
 * class that implements [Iterable] but isn't even a subtype of List.
 * @description Checks that [Iterable] object can be spread into the spreadable
 * list.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "dart:collection";
import "../../Utils/expect.dart";

class MyIterable extends IterableBase {
  MyIterator iterator;

  MyIterable() {
    iterator = new MyIterator();
  }

  Iterator getIterator() {
    return iterator;
  }
}

class MyIterator extends Iterator<int> {
  int i = 0;

  @override
  bool moveNext() {
    if (i < 10) {
      i++;
      return true;
    } else {
      return false;
    }
  }

  @override
  int get current {
    return i;
  }
}

main() {
  Iterable iterable = new MyIterable();
  Expect.listEquals(iterable.toList(), [...iterable]);
}
