/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface can specify the signatures of constructors that are used 
 * to provide objects that conform to the interface. It is a compile-time error if an
 * interface declares a constructor without declaring a factory class.
 * @description Checks that it is a compile-time error if interface declares a factory constructor
 * that has no corresponding constructor in the factory class.
 * @compile-error
 * @author vasya
 * @reviewer kaigorodov
 */

class F {
  F() { }
  factory I() { return null; }
}

class G {
  G() { }
}

interface I default G {
  I();
}

main() {
  try{
    I i1=new I.foo(v=1);
    assert(i1!=null);
  } catch(var x) {
  }
}

