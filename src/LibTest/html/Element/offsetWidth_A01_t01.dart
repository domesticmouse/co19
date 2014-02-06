/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final offsetWidth
 * @description Checks that it should be equal to the width of client
 * rectangle.  
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() {
  var x = new Element.html('<div>First div</div>');
  document.body.append(x);

  x = new Element.html('<div>Second div</div>');
  x.style.margin = '10px';
  x.style.border = '10px solid';
  x.style.overflow = 'scroll';
  document.body.append(x);

  var r = x.getBoundingClientRect();

  Expect.approxEquals(x.offsetWidth, r.width, 1);
}
