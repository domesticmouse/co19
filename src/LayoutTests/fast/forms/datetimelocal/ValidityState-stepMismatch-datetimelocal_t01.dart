/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check stepMismatch results for type=datetime-local.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  document.body.append(input);

  stepMismatchFor(value, step, min, [disabled=false]) {
    input.min = min;
    input.step = step;
    input.value = value;
    input.disabled = disabled;
    return input.validity.stepMismatch;
  }

  input.type = 'datetime-local';
  debug('Empty values');
  //shouldBeFalse(stepMismatchFor("", null, null));
  shouldBeFalse(stepMismatchFor("", "2", "1969-12-31T12:34:56"));
  debug('Normal step values');
  shouldBeFalse(stepMismatchFor("2010-02-09T12:34:55", "1", "2010-02-09T12:34:56"));
  shouldBeTrue(stepMismatchFor("2010-02-09T12:34:55.001", "1", "2010-02-09T12:34:56"));
  shouldBeFalse(stepMismatchFor("2010-02-09T12:34:56.001", "0.001", "2010-02-09T12:34:56"));
  shouldBeTrue(stepMismatchFor("2010-02-09T12:34:55", "0.333", "2010-02-09T12:34:56"));
  shouldBeFalse(stepMismatchFor("2010-02-09T12:34:55.001", "0.333", "2010-02-09T12:34:56"));
  shouldBeFalse(stepMismatchFor("2010-02-09T12:34", "86400", "2010-02-08T12:34"));
  shouldBeTrue(stepMismatchFor("2010-02-09T12:34:56", "86400", "2010-02-08T12:34"));
  shouldBeTrue(stepMismatchFor("275760-09-13T00:00", "3", "275760-09-12T23:59:50"));
  shouldBeFalse(stepMismatchFor("275760-09-13T00:00", "2", "275760-09-12T23:59:50"));
  shouldBeTrue(stepMismatchFor("0001-01-01T00:00", "3", "0001-01-11T00:00:02"));
  shouldBeFalse(stepMismatchFor("0001-01-01T00:00", "2", "0001-01-11T00:00:02"));
  debug('Implicit step base');
  //shouldBeFalse(stepMismatchFor("1970-01-01T12:34", "120", null));
  //shouldBeTrue(stepMismatchFor("1970-01-01T12:35", "120", null));
  debug('Small step values');
  shouldBeFalse(stepMismatchFor("2010-02-10T12:34:56.000", "0.0003", "2010-02-10T12:34.55.000"));
  shouldBeTrue(stepMismatchFor("2010-02-10T12:34:55.001", "0.0019", "2010-02-10T12:34.55.000"));
  debug('Invalid or no step values');
  //shouldBeFalse(stepMismatchFor("2010-02-10T12:34", null, "2010-02-09T12:34"));
  //shouldBeTrue(stepMismatchFor("2010-02-10T12:34:56", null, "2010-02-09T12:34"));
  shouldBeFalse(stepMismatchFor("2010-02-10T12:34", "-1", "2010-02-09T12:34"));
  shouldBeFalse(stepMismatchFor("2010-02-10T12:34", "foo", "2010-02-09T12:34"));
  debug('Special step value');
  shouldBeFalse(stepMismatchFor("2010-02-09T12:34", "any", "2010-02-09T12:34"));
  debug('Disabled');
  shouldBeFalse(stepMismatchFor("2010-02-09T12:34:55.001", "1", "2010-02-09T12:34:56", true));
}
