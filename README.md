# Angular Recaptcha (Dart)

## How to use

### Add to pubspec.yaml

```yaml
angular_recaptcha: ^0.0.7
# If you are still running angular `v2` or `v3`,
# then you need to use: 
# angular_recaptcha: "0.0.6"` 
```

then

`pub get`

### Add to index.html

`<script src="https://www.google.com/recaptcha/api.js?render=explicit"></script>`

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
  String value;
}
```
