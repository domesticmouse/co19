/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In cases where the context type is not specific enough to
 * disambiguate, we could make it an error instead of defaulting to map.
 * However, that would be inconsistent with how empty collections are handled.
 * Those have to default to map for backwards compatibility.
 * @description Checks that empty collection is map.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

main() {
  Set res1 = {...?null}; //# 01: compile-time error
  Map res2 = {...?null};
}
