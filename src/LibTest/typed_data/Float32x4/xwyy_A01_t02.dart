/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Float32x4 xwyy
 * @description Checks that [xwyy] is final and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Float32x4(0.0, 0.0, 0.0, 0.0);
  try {
    obj.xwyy = null;
    Expect.fail("[xwyy] should be final");
  } on NoSuchMethodError catch(ok) {}
}