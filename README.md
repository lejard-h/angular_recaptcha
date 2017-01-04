# Angular Recaptcha (Dart)

## How to use

### Add to pubspec.yaml
`angular_recaptcha: 0.0.2`

then

`pub get`

### Add to index.html

`<script async defer src="https://www.google.com/recaptcha/api.js?render=explicit"></script>`

### Use it

`<angular-recaptcha [(ngModel)]="value" key="YOUR_KEY" auto-render></angular-recaptcha>`


### More

```dart
import 'package:angular2/core.dart';
import 'package:angular_recaptcha/angular_recaptcha.dart';

@Component(
    selector: 'app',
    template: '''
        <angular-recaptcha #recaptcha key="YOUR_KEY" [(ngModel)]="value"></angular-recaptcha>
        ''',
    directives: const [AngularRecaptcha])
class App implements OnInit {
  @ViewChild("recaptcha")
  AngularRecaptcha ref;

  dynamic _value;

  dynamic get value => _value;

  void set value(v) {
    print(v);
    _value = v;
  }

  @override
  ngOnInit() {
    ref.render();
  }
}
```