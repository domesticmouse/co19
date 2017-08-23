/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> encode(List<int> input)
 * Source
 *   T encode(S input) => encoder.convert(input);
 * @description Checks that the [encode] method encodes ZLib compressed data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var codec = new ZLibCodec();
  var decoder = codec.decoder;


  var l = [1, 2, 3];
  var l1 = codec.encode(l);
  Expect.listEquals(l, decoder.convert(l1));
}
