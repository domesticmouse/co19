/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void lockSync([
 *     FileLock mode = FileLock.EXCLUSIVE,
 *     int start = 0,
 *     int end = -1
 *     ])
 * Synchronously locks the file or part of the file.
 *
 * By default an exclusive lock will be obtained, but that can be overridden by
 * the mode argument.
 *
 * @description Checks that method lockSync synchronously locks the whole file
 * (by default in an exclusive mode).
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

// Check whether the file is locked or not.
checkLock(String path, int start, int end, FileLock mode, {bool locked}) {
  // Client process returns either 'LOCK FAILED' or 'LOCK SUCCEEDED'.
  var expected = locked ? 'LOCK FAILED' : 'LOCK SUCCEEDED';
  var arguments = []
    ..addAll(Platform.executableArguments)
    ..add(Platform.script.resolve('lock_A01_t01_lib.dart').toFilePath())
    ..add(path)
    ..add(mode == FileLock.EXCLUSIVE ? 'EXCLUSIVE' : 'SHARED')
    ..add('$start')
    ..add('$end');
  return Process
      .run(Platform.executable, arguments)
      .then((ProcessResult result) {
    if (result.exitCode != 0 || !result.stdout.contains(expected)) {
      print("Client failed, exit code ${result.exitCode}");
      print("  stdout:");
      print(result.stdout);
      print("  stderr:");
      print(result.stderr);
      print("  arguments:");
      print(arguments);
      Expect.fail('Client subprocess exit code: ${result.exitCode}');
    }
  });
}

checkLocked(String path,
        [int start = 0, int end = -1, FileLock mode = FileLock.EXCLUSIVE]) =>
    checkLock(path, start, end, mode, locked: true);

checkUnlocked(String path,
        [int start = 0, int end = -1, FileLock mode = FileLock.EXCLUSIVE]) =>
    checkLock(path, start, end, mode, locked: false);

void check(int fLen) {
  File file = getTempFileSync();
  asyncStart();
  var rf = file.openSync(mode: FileMode.WRITE);
  rf.writeFromSync(new List.filled(fLen, 1));
  rf.lockSync(FileLock.EXCLUSIVE);
  Expect.isTrue(fLen == rf.lengthSync());

  var tests = [
    () => checkLocked(rf.path),
    () => checkLocked(rf.path, 0, fLen, FileLock.SHARED)
  ];
  Future.forEach(tests, (f) => f()).whenComplete(() {
    rf.unlockSync();
    rf.closeSync();
    file.deleteSync();
    asyncEnd();
  });
}

main() {
  check(10);
  check(100);
  check(1000);
}
