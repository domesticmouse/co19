library dynamic_check;
import "expect.dart";

checkTypeError(f()) {
  Expect.throws(f, (e) => e is TypeError, "Type error should be thrown");
}

checkAssertionError(f(), [message]) {
  Expect.throws(f, (e) {
    if (e is AssertionError) {
      Expect.equals(message, e.message);
      return true;
    }
    return false;
  }, "Assertion error should be thrown");
}

/**
 * Check that dynamic error occurs. Dart specification (3rd Edition/June 12015)
 * does not specify what is 'dynamic erros'
 * (see https://github.com/dart-lang/sdk/issues/24394 ). So, for now,
 * this is a stub that checks that Error is thrown
 */
checkDynamicError(f()) {
  Expect.throws(f, (e) => e is Error, "Dynamic Error should be thrown");
}
