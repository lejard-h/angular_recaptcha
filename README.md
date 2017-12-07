# Angular Recaptcha (Dart)

## How to use

### Add to pubspec.yaml

```yaml
angular_recaptcha: ^0.0.8
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

### Options

Support `ngModel` for Form validation.

#### @Inputs

- `String size`: Support "normal" or "compact"
- `String key`: Your sitekey
- `String theme`: Support "light" or "dark"
- `String type`: Support "image" or "audio"
- `bool autoRender`: will render the captchat automatically when ready
- `String tabindex`

#### @Outputs

- `expire`: notify when the token is expired, we also set `value` to null

#### Getter

- `value`: get the value of the captcha

#### Functions

- `render()`: manually render the captcha
- `reset()`: manually reset the captcha

[More documentations](https://developers.google.com/recaptcha/docs/display)

### More

```dart
import 'package:angular/angular.dart';
import 'package:angular_recaptcha/angular_recaptcha.dart';

@Component(
    selector: 'app',
    template: '''
        <angular-recaptcha [(ngModel)]="value" key="YOUR_KEY" [(ngModel)]="value" auto-render></angular-recaptcha>
        ''',
    directives: const [AngularRecaptcha])
class App {
  String value;
}
```
