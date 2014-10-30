/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test if an input field matches to various pseudo classes
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "../resources/common-pseudo-classes.dart";

main() {
  document.body.setInnerHtml('''
      <div id="container">
      <input type="datetime-local" value="1234-12-11T12:34" id="enabled">
      <input type="datetime-local" value="12340-10-01T12:34" id="disabled" disabled>
      <input type="datetime-local" value="123456-12-11T12:34" min="123456-12-11T00:00" step="1800" id="invalid">
      <input type="datetime-local" value="123456-12-11T12:34" min="123456-12-01T00:00" max="123456-12-31T00:00" id="inrange">
      <input type="datetime-local" value="ABC" min="123456-12-01T00:00" max="123456-12-31T00:00" id="badvalue">
      <input type="datetime-local" value="0710-03-10T00:00" min="1000-01-01T00:00" max="1999-12-31T23:59" id="outofrange">
      <input type="datetime-local" value="1999-12-31T12:34" readonly id="readonly">
      <input type="datetime-local" value="1999-12-31T12:34" required id="required">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var container = document.getElementById('container');
  shouldBeTrue(matchedNodesContainId(container, ":enabled", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":valid", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":optional", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":read-write", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":disabled", "disabled"));
  shouldBeTrue(matchedNodesContainId(container, ":invalid", "invalid"));
  shouldBeTrue(matchedNodesContainId(container, ":in-range", "inrange"));
  shouldBeTrue(matchedNodesContainId(container, ":in-range", "badvalue"));
  shouldBeTrue(matchedNodesContainId(container, ":out-of-range", "outofrange"));
  shouldBeTrue(matchedNodesContainId(container, ":read-only", "readonly"));
  shouldBeTrue(matchedNodesContainId(container, ":required", "required"));
  // Make the id=outofrange element in-range state.
  (document.getElementById('outofrange') as InputElement).value = '1500-01-01T00:00';
  shouldBeFalse(matchedNodesContainId(container, ":out-of-range", "outofrange"));
  shouldBeTrue(matchedNodesContainId(container, ":in-range", "outofrange"));
  // Make the id=inrange element out-of-range state.
  (document.getElementById('inrange') as InputElement).value = '1500-01-01T00:00';
  shouldBeFalse(matchedNodesContainId(container, ":in-range", "inrange"));
  shouldBeTrue(matchedNodesContainId(container, ":out-of-range", "inrange"));
  container.remove();
}
