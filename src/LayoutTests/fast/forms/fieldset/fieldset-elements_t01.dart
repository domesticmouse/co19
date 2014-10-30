/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test the elements attibute of HTMLFieldSet element.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var container = document.createElement('div');
  document.body.append(container);

  container.setInnerHtml('<form id=formElement> <fieldset id="fs">' +
      '<button id=button1></button>' +
      '<fieldset id=fieldset1><legend id=legend1></legend></fieldset>' +
      '<div> <input id=inputhidden type=hidden> </div>' +
      '<input id=inputtext type=text>' +
      '<input id=inputsearch type=search>' +
      '<input id=inputurl type=url>' +
      '<input id=inputemail type=email>' +
      '<input id=inputpassword type=password>' +
      '<input id=inputdate type=date>' +
      '<input id=inputnumber type=number>' +
      '<input id=inputrange type=range>' +
      '<input id=inputcolor type=color>' +
      '<input id=inputcheckbox type=checkbox>' +
      '<input id=inputradio type=radio>' +
      '<input id=inputfile type=file>' +
      '<input id=inputsubmit type=submit>' +
      '<input id=inputimage type=image>' +
      '<input id=inputreset type=reset>' +
      '<input id=inputbutton type=button>' +
      '<keygen id=keygen1></keygen>' +
      '<label id=label1></label>' +
      '<meter id=meter1></meter>' +
      '<object id=object1></object>' +
      '<output id=output1></output>' +
      '<progress id=progress1></progress>' +
      '<select id=select1>' +
      '    <optgroup id=optgroup1>group1</optgroup>' +
      '    <option id=option1>option1</option>' +
      '</select>' +
      '<textarea id=textarea1></textarea>' +
      '</fieldset> </form>',
  treeSanitizer: new NullTreeSanitizer());

  var owner = document.getElementById('fs');

  shouldBe(owner.elements.length, 23);
  shouldBe(owner.elements[0].id, "button1");
  shouldBe(owner.elements[1].id, "fieldset1");
  shouldBe(owner.elements[2].id, "inputhidden");
  shouldBe(owner.elements[3].id, "inputtext");
  shouldBe(owner.elements[4].id, "inputsearch");
  shouldBe(owner.elements[5].id, "inputurl");
  shouldBe(owner.elements[6].id, "inputemail");
  shouldBe(owner.elements[7].id, "inputpassword");
  shouldBe(owner.elements[8].id, "inputdate");
  shouldBe(owner.elements[9].id, "inputnumber");
  shouldBe(owner.elements[10].id, "inputrange");
  shouldBe(owner.elements[11].id, "inputcolor");
  shouldBe(owner.elements[12].id, "inputcheckbox");
  shouldBe(owner.elements[13].id, "inputradio");
  shouldBe(owner.elements[14].id, "inputfile");
  shouldBe(owner.elements[15].id, "inputsubmit");
  shouldBe(owner.elements[16].id, "inputreset");
  shouldBe(owner.elements[17].id, "inputbutton");
  shouldBe(owner.elements[18].id, "keygen1");
  shouldBe(owner.elements[19].id, "object1");
  shouldBe(owner.elements[20].id, "output1");
  shouldBe(owner.elements[21].id, "select1");
  shouldBe(owner.elements[22].id, "textarea1");

  var newElement = document.createElement("input");
  newElement.setAttribute("type", "text");
  newElement.setAttribute("value", "new element");
  newElement.setAttribute("id", "inputcommon");

  debug("");
  debug("Check elements array is updated after adding a new element");
  owner.append(newElement); shouldBe(owner.elements.length, 24);

  debug("");
  debug("Check elements array is updated after remove an element");
  newElement.remove(); shouldBe(owner.elements.length, 23);

  debug("");
  debug("Check owner.elements is updated properly");
  (document.getElementById("inputfile") as InputElement).type="image";
  shouldBe(owner.elements.length, 22);

  debug("");
  debug("Check owner.elements is updated properly after removing from parent");
  owner.remove();
  var form = document.getElementById("formElement");
  form.append(newElement);
  //shouldBe(form.elements.length, 1); //no .elements getter in FormElement in dart
  newElement.remove();
  //shouldBe(form.elements.length, 0); //no .elements getter in FormElement in dart
  shouldBe(owner.elements.length, 22);
  owner.append(newElement);
  shouldBe(owner.elements.length, 23);
  newElement.remove();
  shouldBe(owner.elements.length, 22);
}
