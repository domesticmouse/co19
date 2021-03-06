/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
div {
    position: relative;
    width: 600px;
}
table {
    margin-left: 10px;
    margin-right: 20px;
    width: 200px;
    border: 1px solid black;
}
</style>
''';

const String htmlEL2 = r'''
<div style="-webkit-writing-mode: horizontal-tb">
<table data-offset-x=10 style="-webkit-writing-mode: vertical-rl">
    <tr><td>Hello</td></tr>
</table>
<table data-offset-x=10 style="-webkit-writing-mode: vertical-lr">
    <tr><td>Hello</td></tr>
</table>
</div>

<div style="-webkit-writing-mode: horizontal-bt">
<table data-offset-x=10 style="-webkit-writing-mode: vertical-rl">
    <tr><td>Hello</td></tr>
</table>
<table data-offset-x=10 style="-webkit-writing-mode: vertical-lr">
    <tr><td>Hello</td></tr>
</table>
</div>

<div style="-webkit-writing-mode: vertical-rl">
<table data-offset-y=10 style="-webkit-writing-mode: horizontal-tb">
    <tr><td>Hello</td></tr>
</table>
<table data-offset-y=10 style="-webkit-writing-mode: horizontal-bt">
    <tr><td>Hello</td></tr>
</table>
</div>

<div style="-webkit-writing-mode: vertical-lr">
<table data-offset-y=10 style="-webkit-writing-mode: horizontal-tb">
    <tr><td>Hello</td></tr>
</table>
<table data-offset-y=10 style="-webkit-writing-mode: horizontal-bt">
    <tr><td>Hello</td></tr>
</table>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener((_) {
      checkLayout('div');
    });
}
