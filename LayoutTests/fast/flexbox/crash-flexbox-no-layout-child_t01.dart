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
      <span style="display: -webkit-inline-box;">
        <span style="position: fixed; visibility: collapse;">
          <span style="visibility: visible;">
            <progress></progress>
          </span>
        </span>
      </span>
      <div>Bug <a href="https://bugs.webkit.org/show_bug.cgi?id=64842">64842</a>: RenderDeprecatedFlexibleBox does not call its children's layout method</div>
      <div>This test passes if it does not CRASH.</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  boom(_) {
    setTimeout(() {
      document.querySelector("progress").setAttribute("style", "overflow: scroll; border-style: dotted;");
      asyncEnd();
    }, 10);
  }

  asyncStart();
//  window. onLoad.listen(boom);
  addOnLoadListener((_) {
    boom(_);
  });
}
