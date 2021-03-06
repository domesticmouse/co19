/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator <(num other)
 * Relational operator <.
 * @description Checks that this operator returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";
import "dart:math" as Math;

main() {
  Expect.isTrue(1 < 2);
  Expect.isFalse(1 < 0);
  Expect.isFalse(9 < -10);

  Expect.isTrue(2147483647 < 2147483648);
  Expect.isFalse(-2147483648 < -2147483648);
  Expect.isTrue(4294967295 < 4294967296);
  Expect.isTrue(-4294967296 < -4294967295);
  Expect.isTrue(9223372036854775806 < 9223372036854775807);
  Expect.isFalse(-9223372036854775808 < -9223372036854775808);

  // non-int argument
  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  Expect.isFalse(0 < 0.0);
  Expect.isFalse(0 < -0.0);
  Expect.isTrue(0 < MIN_DOUBLE);
  Expect.isTrue(0 < double.infinity);
  Expect.isTrue(0x8000000000000000 < double.infinity);
  Expect.isFalse(0 < double.negativeInfinity);
  Expect.isFalse((-0x800000000000000) < double.negativeInfinity);
  Expect.isFalse(0 < NEG_MIN_DOUBLE);
  Expect.isFalse(0 < double.nan);
}
