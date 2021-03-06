/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Table rowspan
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
    <style>
    td { font: 15px/1 Ahem }
    #div-table { display: table; border-spacing: 2px }
    #div-row, #span-row { display: table-row }
    #div-cell, #span-cell { display: table-cell }
    #div-table, #div-row, #span-row, #div-cell, #span-cell{ border: 1px solid black }
    </style>
''';

const String htmlEL2 = r'''
<h3>Test for chromium bug : <a href="https://code.google.com/p/chromium/issues/detail?id=252120">252120</a>. Content of the row spanning cell is flowing out of the cell boundries.</h3>
<h4>Row spanning cell height is not set as per its content height or given height to this cells.</h4>
<h5>Test 1 - One row spanning cell present under the boundries of other row spanning cell and inner row spanning cell have lots of content.</h5>
<table border="1">
  <tbody>
    <tr  data-expected-height="19">
      <td rowspan="6" style="height:400px">row0 col0 rowspan=6 height=400px</td>
      <td>row0 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row1 col1</td>
    </tr>
    <tr data-expected-height="0">
      <td rowspan="3" style="height:200px">row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/>row2 col1 rowspan=3 height=200px<br/></td>
    </tr>
    <tr data-expected-height="165">
      <td>row3 col2</td>
    </tr>
    <tr data-expected-height="168">
      <td>row4 col2</td>
    </tr>
    <tr data-expected-height="20">
      <td>row5 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row6 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 2 - One row spanning cell present under the boundries of other row spanning cell and inner row spanning cell have its own height.</h5>
<table border="1" width="607">
  <tbody>
    <tr  data-expected-height="23">
      <td rowspan="6" style="height:600px">row0 col0 rowspan=6 height=600px</td>
      <td>row0 col1</td>
    </tr>
    <tr data-expected-height="24">
      <td>row1 col1</td>
    </tr>
    <tr data-expected-height="0">
      <td rowspan="3" style="height:400px">row2 col1 rowspan=3 height=400px</td>
    </tr>
    <tr data-expected-height="247">
      <td>row3 col2</td>
    </tr>
    <tr data-expected-height="260">
      <td>row4 col2</td>
    </tr>
    <tr data-expected-height="25">
      <td>row5 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row6 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 3 - 2 same row spanning cells with diffrent heights.</h5>
<table border="1">
  <tbody>
    <tr  data-expected-height="0">
      <td rowspan="6" style="height:300px">row0 col0 rowspan=6 height=300px</td>
      <td rowspan="6" style="height:500px">row0 col1 rowspan=6 height=500px</td>
    </tr>
    <tr data-expected-height="90">
      <td>row1 col1</td>
    </tr>
    <tr data-expected-height="94">
      <td>row2 col1</td>
    </tr>
    <tr data-expected-height="95">
      <td>row3 col1</td>
    </tr>
    <tr data-expected-height="99">
      <td>row4 col1</td>
    </tr>
    <tr data-expected-height="99">
      <td>row5 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row6 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 4 - some rows are common between 2 row spanning cells.</h5>
<table border="1">
  <tbody>
    <tr data-expected-height="43">
        <td rowspan="6" style="height:400px">row0 col0 rowspan=6 height=400px</td>
        <td>row0 col1</td>
    </tr>
    <tr data-expected-height="0">
        <td rowspan="6" style="height:800px">row1 col1 rowspan=6 height=800px</td>
    </tr>
    <tr data-expected-height="168">
        <td>row2 col2</td>
    </tr>
    <tr data-expected-height="177">
        <td>row3 col2</td>
    </tr>
    <tr data-expected-height="176">
        <td>row4 col2</td>
    </tr>
    <tr data-expected-height="189">
        <td>row5 col2</td>
    </tr>
    <tr data-expected-height="42">
        <td>row6 col2</td>
    </tr>
    <tr data-expected-height="19">
        <td>row7 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 5 - 2 spanning cells starts at diffrent row index but end at same row index.</h5>
<table border="1">
  <tbody>
    <tr data-expected-height="35">
        <td rowspan="6" style="height:600px">row0 col0 rowspan=6 height=400px</td>
        <td>row0 col1</td>
    </tr>
    <tr data-expected-height="0">
        <td rowspan="5" style="height:300px">row1 col1 rowspan=6 height=800px</td>
    </tr>
    <tr data-expected-height="130">
        <td>row2 col2</td>
    </tr>
    <tr data-expected-height="132">
        <td>row3 col2</td>
    </tr>
    <tr data-expected-height="140">
        <td>row4 col2</td>
    </tr>
    <tr data-expected-height="140">
        <td>row5 col2</td>
    </tr>
    <tr data-expected-height="19">
        <td>row6 col2</td>
    </tr>
    <tr data-expected-height="19">
        <td>row7 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 6 - RowSpan and ColSpan. </h5>
<table border="1" width="607">
  <tbody>
    <tr data-expected-height="34">
      <td>row0 col0</td>
      <td rowspan="3" colspan="2">row0 col1 - rowspan=3 colspan=2</td>
      <td>row0 col2</td>
    </tr>
    <tr data-expected-height="34">
      <td>row1 col0</td>
    </tr>
    <tr data-expected-height="34">
      <td>row2 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td colspan="3">row3 col0 - colspan=3</td>
    </tr>
    <tr data-expected-height="34">
      <td>row4 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 7 - Mix of baseline aligned and non-baseline aligned cells.</h5>
<table border="1" width="607">
  <tbody>
    <tr data-expected-height="104">
      <td style="height:100px">row0 col0</td>
      <td style="vertical-align:top">row0 col1 vertical-align=top</td>
      <td style="vertical-align:bottom">row0 col2 vertical-align=bottom</td>
    </tr>
    <tr data-expected-height="19">
      <td>row1 col0</td>
    </tr>
    <tr data-expected-height="77">
      <td rowspan="4" style="vertical-align:text-top; height:300px">row2 col0 - rowspan=4 vertical-align=text-top</td>
      <td style="vertical-align:sub">row2 col1 vertical-align=sub</td>
    </tr>
    <tr data-expected-height="77">
      <td style="vertical-align:middle">row3 col1 vertical-align=middle</td>
    </tr>
    <tr data-expected-height="69">
      <td style="vertical-align:super">row4 col1 vertical-align=super</td>
    </tr>
    <tr data-expected-height="91">
      <td style="vertical-align:text-bottom">row5 col1 vertical-align=text-bottom</td>
    </tr>
    <tr data-expected-height="19">
      <td>row6 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 8 - CSS Table.</h5>
<div id="div-table">
    <span id="span-row">
        <span id="span-cell">row0 col0</span>
        <div id="div-cell">row0 col1</div>
        <span id="span-cell">row0 col2</span>
    </span>
    <div id="div-row">
        <div id="div-cell">row1 col0</div>
        <span id="span-cell">row1 col1</span>
        <div id="div-cell">row1 col2</div>
    </div>
    <div id="div-row">
        <span id="span-cell">row2 col0</span>
    </div>
    <span id="span-row">
        <div id="div-cell">row3 col0</div>
    </span>
    <span id="span-row">
        <span id="span-cell">row4 col0</span>
        <span id="span-cell">row4 col1</span>
        <span id="span-cell">row4 col2</span>
    </span>
    <div id="div-row">
        <span id="span-cell">row5 col0</span>
        <div id="div-cell">row5 col1</div>
        <span id="span-cell">row5 col2</span>
    </div>
    <span id="span-row">
        <div id="div-cell">row6 col0</div>
        <span id="span-cell">row6 col1</span>
    </span>
    <div id="div-row">
        <div id="div-cell">row7 col0</div>
    </div>
    <span id="span-row">
        <span id="span-cell">row8 col0</span>
    </span>
    <div id="div-row">
        <div id="div-cell">row9 col0</div>
    </div>
    <div id="div-row">
        <div id="div-cell">row10 col0</div>
    </div>
</div>
<h5>Test 9 - Table Similar to CSS table with rowspan.</h5>
<table border="1px">
    <tr data-expected-height="21">
        <td rowspan=5 style="height:300px">row0 col0</td>
        <td>row0 col1</td>
        <td>row0 col2</td>
    </tr>
    <tr data-expected-height="87">
        <td rowspan=3 style="height:200px">row1 col1</td>
        <td rowspan=2 style="height:100px">row1 col2</td>
        <td>row1 col3</td>
    </tr>
    <tr data-expected-height="96">
        <td>row2 col3</td>
    </tr>
    <tr data-expected-height="40">
        <td>row3 col2</td>
    </tr>
    <tr data-expected-height="24">
        <td>row4 col1</td>
        <td>row4 col2</td>
        <td>row4 col3</td>
    </tr>
    <tr data-expected-height="19">
        <td>row5 col0</td>
        <td>row5 col1</td>
        <td>row5 col2</td>
    </tr>
    <tr data-expected-height="0">
        <td rowspan=5 style="height:200px">row6 col0</td>
        <td rowspan=5 style="height:100px">row6 col1</td>
    </tr>
    <tr data-expected-height="37">
        <td>row7 col1</td>
    </tr>
    <tr data-expected-height="38">
        <td>row8 col1</td>
    </tr>
    <tr data-expected-height="49">
        <td>row9 col1</td>
    </tr>
    <tr data-expected-height="49">
        <td>row10 col1</td>
    </tr>
</table>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener((_) {
      checkLayout('tr');
    });
}
