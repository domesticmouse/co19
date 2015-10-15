/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of setter f on object o is defined to be
 * equivalent to (a){return u.m = a;} if f is named m =, except that iff
 * identical(o1, o2) then o1#m= == o2#m=.
 *
 * @description Check that closurization of setter that declared is not void
 * is equivalent to (a){return u.m = a;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int mValue = 0;
  int set m(int val) {
    return this.mValue = val;
  }
}

main() {
  C o = new C();
  var f = o#m=;
  var f1 = (a) {return o.m = a;};

  Expect.equals(f(1), f1(1));
  Expect.equals(1, o.mValue);
}
