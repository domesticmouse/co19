/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion stringLiteral:
 *   MULTI_LINE_STRING+ |
 *   SINGLE_LINE_STRING
 * ;
 * MULTI_LINE_STRING:
 *   '"""' STRING CONTENT TDQ* '"""' |
 *   ''''' STRING CONTENT TSQ* ''''' |
 *   '"""'  (~ '"""')* '"""' |
 *   ''''' (~ ''''')* '''''
 * ;
 * STRING CONTENT TDQ:
 *   ~( '\' | '"""' | '$') |
 *   '\' ~( NEWLINE ) |
 *   STRING_INTERPOLATION
 * ;
 * STRING CONTENT TSQ:
 *   ~( '\' | ''''' | '$') |
 *   '\' ~( NEWLINE ) |
 *   STRING_INTERPOLATION
 * ;
 * @description Checks that various valid multi-line string literals
 * don't produce a compile-time error.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Issues 2353, 4009
 */

main() {
  '''''';
  """""";
  r'''''';
  r"""""";
  ''' ''';
  """ """;
  '''"'"'"''';
  """'''"'''""";
  """
  ""
  """;
  '''
  ''
  ''';
  ''' '' ''';
  """ "" """;
  
//issue 4009, there're negative tests for these literals
//  r'''\''';
//  r"""\""";
//  r"""$""";
//  r'''$''';

  '''
  ''';
  """
  """;

  """1234567890""";
  '''1234567890''';
  r"""1234567890""";
  r'''1234567890''';
  """12
  34
  56""";
  r'''
  89
  09
  ''';

  """abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ""";
  '''abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ''';
  r"""abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ""";
  r'''abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ''';
  r"""ABC
  ABC""";
  '''
  new line
  ''';

  """!@#%^&*(){}[]<>-_=+|~?/.,;:`""";
  '''!@#%^&*(){}[]<>-_=+|~?/.,;:`''';
  r"""!@#%^&*(){}[]<>-_=+|~?/.,;:`""";
  r'''!@#%^&*(){}[]<>-_=+|~?/.,;:`''';

  """\a\b\c\d\e\1\2\3\4\!\@\#\√\ """;
  '''\a\b\c\d\e\1\2\3\4\!\@\#\√\ ''';
  r"""\+\3\12\f""";
  r'''\~\f\ \7''';

  '''
  123
  ABC
  !@#
  ''';
  r'''
  456
  DEF
  %^&
  ''';
  """
  x1
  y2
  z()
  """;
  r"""
  x1
  &a
  +*
  """;

  //arabic
  """أبجدية
  		عربية""";
  '''أبجدية عربية''';
  //cyrillic
  """кирилл
  		и
  		ца""";
  '''кирилл
  		и
  		ца''';
  //hebrew
  """עִבְרִ
  		ית""";
  '''עִבְרִ
  		ית''';
  //roman numerals
  """ⅰ ⅱ ⅲ ⅳ ⅴ ⅵ ⅶ ⅷ ⅸ ⅹ ⅺ ⅻ ⅼ ⅽ ⅾ ⅿ""";
  '''ⅰ ⅱ ⅲ ⅳ ⅴ ⅵ ⅶ ⅷ ⅸ ⅹ ⅺ ⅻ ⅼ ⅽ ⅾ ⅿ''';
  //mathematical symbols
  """∀ ∁ ∂ ∃ ∄ ∅ ∆ ∇ ∈ ∉ ∊ ∋ ∌ ∍ ∎
  		 ∏ ∐ ∑ − ∓ ∔ ∕ ∖ ∗ ∘ ∙ √ ∛ ∜ ∝ ∞ """;
  r"""≀ ≁ ≂ ≃ ≄ ≅ ≆ ≇ ≈ ≉ ≊ ≋ ≌ ≍ ≎ ≏ ≐ 
  		≑ ≒ ≓ ≔ ≕ ≖ ≗ ≘ ≙ ≚ ≛ ≜ ≝ ≞ ≟""";
  r'''∟ ∠ ∡ ∢ ∣ ∤ ∥ ∦ ∧ ∨ ∩ ∪ ∫
  ∬ ∭ ∮ ∯ ∰ ∱ ∲ ∳ ∴ ∵ ∶ ∷ ∸ ∹ ∺ ∻ ∼ ∽ ∾ ∿''';
  '''≠ ≡ ≢ ≣ ≤ ≥ ≦ ≧ ≨ ≩ ≪ ≫ ≬ ≭ ≮ 
  ≯ ≰ ≱ ≲ ≳ ≴ ≵ ≶ ≷ ≸ ≹ ≺ ≻ ≼ ≽ ≾ ≿''';
  //some random symbols from the unicode table
  """☠ ☡ ☢ ☣ ☤ ☥ ☦ ☧ ☨ ☩ ☪ ☫ ☬ ☭ ☮ 
  		☯ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷ ☸ ☹ ☺ ☻ ☼ ☽ ☾ ☿""";
  r"""♀ ♁ ♂ ♃ ♄ ♅ ♆ ♇ ♈ ♉ ♊ ♋ ♌ ♍ ♎
  		 ♏ ♐ ♑ ♒ ♓ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟""";
  '''♠ ♡ ♢ ♣ ♤ ♥ ♦ ♧ ♨ ♩ ♪ ♫ ♬ ♭ 
  		 ♮ ♯ ♰ ♱ ♲ ♳ ♴ ♵ ♶ ♷ ♸ ♹ ♺ ♻ ♼ ♽ ♾ ♿''';
  r'''☀ ☁ ☂ ☃ ☄ ★ ☆ ☇ ☈ ☉ ☊ ☋ ☌ 
  ☍ ☎ ☏ ☐ ☑ ☒ ☓ ☔ ☕ ☖ ☗ ☘ ☙ ☚ ☛ ☜ ☝ ☞ ☟''';
}