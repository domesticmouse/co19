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
import "../../resources/check-layout.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      table {
          border: 5px solid salmon;
          padding: 5px;
      }
      td {
          border: 5px solid orange;
      }
      .child {
          display: inline-block;
          width: 50px;
          height: 20px;
          background-color: pink;
      }
      .collapse {
          border-collapse: collapse;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <table data-expected-width=140>
          <td data-expected-width=116>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <table style="width: -webkit-min-content" data-expected-width=86>
          <td data-expected-width=62>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <table style="width: -webkit-max-content" data-expected-width=140>
          <td data-expected-width=116>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <table style="width: -webkit-fit-content" data-expected-width=140>
          <td data-expected-width=116>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <div style="width: 140px">
          <table style="width: -webkit-fit-content" data-expected-width=140>
              <td data-expected-width=116>
                  <div class="child"></div>
                  <div class="child"></div>
              </td>
          </table>
      </div>

      <div style="width: 139px">
          <table style="width: -webkit-fit-content" data-expected-width=139>
              <td data-expected-width=115>
                  <div class="child"></div>
                  <div class="child"></div>
              </td>
          </table>
      </div>

      <div style="width: 400px">
          <table style="width: -webkit-fill-available"  data-expected-width=400>
              <td data-expected-width=376>
                  <div class="child"></div>
                  <div class="child"></div>
              </td>
          </table>
      <div>

      <table class="collapse" data-expected-width=116>
          <td data-expected-width=111>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <table class="collapse" style="width: -webkit-min-content" data-expected-width=62>
          <td data-expected-width=57>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <table class="collapse" style="width: -webkit-max-content" data-expected-width=116>
          <td data-expected-width=111>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <table class="collapse" style="width: -webkit-fit-content" data-expected-width=116>
          <td data-expected-width=111>
              <div class="child"></div>
              <div class="child"></div>
          </td>
      </table>

      <div style="width: 116px">
          <table class="collapse" style="width: -webkit-fit-content" data-expected-width=116>
              <td data-expected-width=111>
                  <div class="child"></div>
                  <div class="child"></div>
              </td>
          </table>
      </div>

      <div style="width: 115px">
          <table class="collapse" style="width: -webkit-fit-content" data-expected-width=115>
              <td data-expected-width=110>
                  <div class="child"></div>
                  <div class="child"></div>
              </td>
          </table>
      </div>

      <div style="width: 400px">
          <table class="collapse" style="width: -webkit-fill-available"  data-expected-width=400>
              <td data-expected-width=395>
                  <div class="child"></div>
                  <div class="child"></div>
              </td>
          </table>
      <div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  addOnLoadListener((_) {
    checkLayout('table');
    asyncEnd();
  });
}
