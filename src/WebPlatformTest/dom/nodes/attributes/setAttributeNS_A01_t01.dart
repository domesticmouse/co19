/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description When qualifiedName does not match the Name production,
 * an INVALID_CHARACTER_ERR exception is to be thrown.
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";
import "productions.dart";

void main() {
  var el = document.createElement("foo");
  for (var i = 0, il = invalid_names.length; i < il; ++i) {
    assert_throws("InvalidCharacterError",
                  () { el.setAttributeNS("a", invalid_names[i], "fail"); });
  }
}