/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future firstWhere(bool test(T element), {Object defaultValue()})
 * Finds the first element of this stream matching test.
 *
 * Returns a future that is filled with the first element of this stream that
 * test returns true for.
 *
 * @description Checks that method [firstWhere] returns Future that is filled
 * with the first element of this stream that test returns true for.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(test, expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Future fValue = receiver.firstWhere(test);
      fValue.then((value) {
        Expect.equals(expected, value);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.WRITE, RawSocketEvent.WRITE);
  check((e) => e == RawSocketEvent.READ, RawSocketEvent.READ);
  check((e) => e is RawSocketEvent, RawSocketEvent.WRITE);
  check((e) => true, RawSocketEvent.WRITE);
  check((e) => e != RawSocketEvent.WRITE, RawSocketEvent.READ);
}
