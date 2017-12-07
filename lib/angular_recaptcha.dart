// Copyright (c) 2016, lejard_h. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

@JS()
library angular_recaptcha;

import 'dart:html';
import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:js/js.dart';

@JS('grecaptcha.render')
external num _render(
    HtmlElement container, AngularRecaptchaParameters parameters);
@JS('grecaptcha.reset')
external void _reset(num id);
@JS('grecaptcha.getResponse')
external _getResponse(num id);
@JS('grecaptcha')
external dynamic get _grecaptcha;

@JS()
@anonymous
class AngularRecaptchaParameters {
  external String get sitekey;
  external String get theme;
  external Function get callback;
  external String get type;
  external String get size;
  external String get tabindex;
  @JS("expired-callback")
  external Function get expiredCallback;
  external factory AngularRecaptchaParameters(
      {String sitekey,
      String theme,
      Function callback,
      String type,
      Function expiredCallback,
      String size,
      String tabindex});
}

@Component(
    selector: 'angular-recaptcha',
    styleUrls: const ['angular_recaptcha.css'],
    template: '',
    inputs: const ["value"])
class AngularRecaptcha extends DefaultValueAccessor implements AfterViewInit, OnDestroy {
  final _onExpireCtrl = new StreamController<Null>();

  @Output()
  Stream<Null> get expire => _onExpireCtrl.stream;

  NgModel _ngModel;
  var value;
  ElementRef _ref;
  num _id;

  num get id => _id;
  bool get _autoRender => _parseBool(autoRender);

  @Input('tabindex')
  String tabindex = "0";

  @Input("size")
  String size = "normal";

  @Input("key")
  String key;

  @Input("theme")
  String theme = 'light';

  @Input("type")
  String type = "image";

  @Input("auto-render")
  var autoRender;

  AngularRecaptcha(this._ref, this._ngModel) : super(_ref.nativeElement) {
    _ngModel.valueAccessor = this;
  }

  void _callbackResponse(response) {
    writeValue(response);
  }

  void _expireCallback() {
    writeValue(null);
    _onExpireCtrl.add(null);
  }

  @override
  void ngAfterViewInit() {
    if (_autoRender != false && _grecaptcha != null) {
      render();
    }
  }

  num render() {
    if (_grecaptcha != null) {
      _id = _render(
          _ref.nativeElement,
          new AngularRecaptchaParameters(
              sitekey: key,
              theme: theme,
              callback: allowInterop(_callbackResponse),
              expiredCallback: allowInterop(_expireCallback),
              type: type,
              size: size,
              tabindex: tabindex));
      return _id;
    }
    return null;
  }

  void reset() {
    if (_grecaptcha != null) {
      _reset(id);
    }
  }

  @override
  void writeValue(dynamic v) {
    if (v != null && value != v) {
      value = v;
      _ngModel.viewToModelUpdate(value);
    }
  }

  void ngOnDestroy() {
    _onExpireCtrl.close();
  }
}

bool _parseBool(dynamic value) {
  if (value is bool) {
    return value;
  }
  switch (value) {
    case '':
      return true;
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      return false;
  }
}
