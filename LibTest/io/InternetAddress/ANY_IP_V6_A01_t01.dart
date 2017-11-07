/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  InternetAddress ANY_IP_V6
 * IP version 6 any address. Use this address when listening on all adapters IP
 * addresses using IP version 6 (IPv6).
 * read-only
 * @description Checks that [ANY_IP_V6] is read-only
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("192.168.16.23");;
  Expect.throws(() { address.ANY_IP_V6  = 1; }, (e) => e is NoSuchMethodError);
}