/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void appendHtml(String text)
 * Parses the specified text as HTML and adds the resulting node after the
 * last child of this element.
 * @description Checks that new node will be added after the
 * last child of this element.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x=new IFrameElement();
  x.appendHtml('text');
  Expect.isTrue(x.firstChild is Text, 'append to empty children list');

  x=new IFrameElement();
  x.appendHtml('<div><div>');
  x.appendHtml('<!--comment-->text');
  document.body.append(x);
  Expect.isTrue(x.firstChild is DivElement, 'div');
  Expect.isTrue(x.firstChild.nextNode is Comment, 'comment');
  Expect.isTrue(x.lastChild is Text, 'text');
/*
  x.appendHtml('<div></div>');
  Node y=x.lastChild;
  Expect.equals(null, y.nextNode);
  
  x.appendHtml('<span><div></div><button></button></span>');
  var z = x.lastChild;
  print("lastChild=${z.runtimeType} $z");
  Expect.equals(z, y.nextNode);
  Expect.equals(z, x.lastChild);


  var x = new Element.html('<span></span>');
  x.appendHtml('text');
  Expect.isTrue(x.firstChild is Text, 'append to empty children list');

  x = new Element.html('<span><div><div></span>');
  x.appendHtml('<!--comment-->text');

  Expect.isTrue(x.firstChild is DivElement, 'div');
  Expect.isTrue(x.firstChild.nextNode is Comment, 'comment');
  Expect.isTrue(x.lastChild is Text, 'text');
*/
}