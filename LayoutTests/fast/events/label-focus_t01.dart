/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <label id="label">Label: <input type=text id="input"></label>
      <div id="output">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('input').onFocus.listen((_) {
    document.getElementById('output').innerHtml = 'PASS';
  });

  document.getElementById('label').focus();
}

