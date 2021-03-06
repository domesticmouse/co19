/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that intrinsic width values on blocks work.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/check-layout.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      .container {
          border: 5px solid blue;
          width: 250px;
          height: 250px;
      }
      .child {
          border: 5px solid pink;
      }
      .content {
          display: inline-block;
          width: 100px;
          height: 100px;
          background-color: salmon;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <!-- width tests -->
      <div class="container">
          <div class="child" style="width: -webkit-max-content;" data-expected-width="210">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="width: -webkit-min-content;" data-expected-width="110">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="width: -webkit-fit-content;" data-expected-width="210">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container" style="width: 50px">
          <div class="child" style="width: -webkit-fit-content;" data-expected-width="110">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="width: -webkit-fill-available;" data-expected-width="250">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <!-- min-width tests -->
      <div class="container">
          <div class="child" style="min-width: -webkit-max-content; width: 10px;" data-expected-width="210">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="min-width: -webkit-min-content; width: 10px;" data-expected-width="110">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="min-width: -webkit-fit-content; width: 10px;" data-expected-width="210">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container" style="width: 50px">
          <div class="child" style="min-width: -webkit-fit-content; width: 10px;" data-expected-width="110">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="min-width: -webkit-fill-available; width: 10px;" data-expected-width="250">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <!-- max-width tests -->
      <div class="container">
          <div class="child" style="max-width: -webkit-max-content; width: 1000px;" data-expected-width="210">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="max-width: -webkit-min-content; width: 1000px;" data-expected-width="110">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="max-width: -webkit-fit-content; width: 1000px;" data-expected-width="210">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container" style="width: 50px">
          <div class="child" style="max-width: -webkit-fit-content; width: 1000px;" data-expected-width="110">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>

      <div class="container">
          <div class="child" style="max-width: -webkit-fill-available; width: 1000px;" data-expected-width="250">
              <div class="content"></div><div class="content"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  addOnLoadListener((_) {
    checkLayout('.container');
    asyncEnd();
  });
}
