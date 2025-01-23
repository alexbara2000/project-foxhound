/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * For more information see nsIPointerEvent.idl.
 *
 * Portions Copyright 2013 Microsoft Open Technologies, Inc. */

interface WindowProxy;

[Exposed=Window]
interface PointerEvent : MouseEvent
{
  constructor(DOMString type, optional PointerEventInit eventInitDict = {});

  [TaintSource]
  readonly attribute long pointerId;

  [TaintSource]
  readonly attribute long width;
  [TaintSource]
  readonly attribute long height;
  [TaintSource]
  readonly attribute float pressure;
  [TaintSource]
  readonly attribute float tangentialPressure;
  [TaintSource]
  readonly attribute long tiltX;
  [TaintSource]
  readonly attribute long tiltY;
  [TaintSource]
  readonly attribute long twist;

  readonly attribute DOMString pointerType;
  [TaintSource]
  readonly attribute boolean isPrimary;

  [Func="mozilla::dom::PointerEvent::EnableGetCoalescedEvents"]
  sequence<PointerEvent> getCoalescedEvents();
  sequence<PointerEvent> getPredictedEvents();
};

dictionary PointerEventInit : MouseEventInit
{
  long pointerId = 0;
  long width = 1;
  long height = 1;
  float pressure = 0;
  float tangentialPressure = 0;
  long tiltX = 0;
  long tiltY = 0;
  long twist = 0;
  DOMString pointerType = "";
  boolean isPrimary = false;
  sequence<PointerEvent> coalescedEvents = [];
  sequence<PointerEvent> predictedEvents = [];
};
