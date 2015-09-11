/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isCaseSensitive
 * Whether this regular expression is case insensitive.   
 * @description Checks that this property holds the correct value.
 * @reviewer pagolubev
 * @author rodionov
 */
import "../../../Utils/expect.dart";
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", false, false);
  check(r"^[^\n\r]+$", "pilOt\nsoviet\trobot\r\nopenoffice", true, true);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", true, true);
  check(r"(ab|cd)+|ef", "AEKFCD", false, false);
}

void check(String pattern, String str, bool multiLine, bool caseSensitive) {
  RegExp re = new RegExp(pattern, multiLine: multiLine, caseSensitive: caseSensitive);
  Expect.equals(caseSensitive, re.isCaseSensitive);
}