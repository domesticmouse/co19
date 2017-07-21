/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionList<String> readAsLinesSync({Encoding encoding: UTF8})
 * Synchronously read the entire file contents as lines of text using the given
 * Encoding.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method synchronously read the entire file
 * contents as lines of text using the given Encoding. Test not empty file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsStringSync("File content");
  try {
    Expect.listEquals(["File content"], file.readAsLinesSync());
  } finally {
    file.delete();
  }
}