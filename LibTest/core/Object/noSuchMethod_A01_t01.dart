/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic noSuchMethod(Invocation invocation)
 * Invoked when a non-existent method or property is accessed.
 * Classes can override noSuchMethod to provide custom behavior.
 * If a value is returned, it becomes the result of the original invocation.
 * The default behavior is to throw a NoSuchMethodError.
 * @description Checks that noSuchMethod() is invocked when a non-existent
 * method or property is accessed and by default throws NoSuchMethodError
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  dynamic o = new Object();

  Expect.throws(() {o.m;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {o.m();}, (e) => e is NoSuchMethodError);
  Expect.throws(() {o.m = 1;}, (e) => e is NoSuchMethodError);
}
