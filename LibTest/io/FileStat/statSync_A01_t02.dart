/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion FileStat statSync(String path)
 * Calls the operating system's stat() function on path. Returns a FileStat
 * object containing the data returned by stat(). If the call fails, returns a
 * FileStat object with .type set to FileSystemEntityType.NOT_FOUND and the
 * other fields invalid.
 * @description Checks that this method calls the operating system's stat()
 * function on path. Returns a FileStat object containing the data returned by
 * stat(). Test not empty file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  file.writeAsBytesSync([3, 1, 4, 1, 5, 9, 2, 6]);
  try {
    FileStat fs = FileStat.statSync(file.path);
    Expect.equals(FileSystemEntityType.FILE, fs.type);
    Expect.equals(8, fs.size);
    Expect.equals(file.statSync().mode, fs.mode);
    Expect.equals(file.statSync().accessed, fs.accessed);
    Expect.equals(file.statSync().changed, fs.changed);
    Expect.equals(file.statSync().modified, fs.modified);
  } finally {
    file.delete();
  }
}