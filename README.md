<p align="center">
<a href="https://github.com/lejard-h/angular_recaptcha/actions?query=workflow%3ADart"><img src="https://github.com/lejard-h/angular_recaptcha/workflows/Dart/badge.svg?branch=master" alt="Build Status"></a>
<a href="https://github.com/lejard-h/angular_recaptcha"><img src="https://img.shields.io/github/stars/lejard-h/angular_recaptcha.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://www.buymeacoffee.com/lejardh" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="25px"></a>
</p>


# Angular Recaptcha (Dart)

## How to use

### Add to pubspec.yaml

```yaml
# If you are running angular `v5`
angular_recaptcha: ^0.1.1
# If you are still running angular `v4`
# angular_recaptcha: ^0.0.8
# If you are still running angular `v2` or `v3`,
# then you need to use: 
# angular_recaptcha: "0.0.6"` 
```

then

`pub get`

### Add to index.html

***Deprecated*** 
Adding the script tag is no more necessary

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
    directives: const [AngularRecaptcha, formDirectives ]
)
class AppComponent {
  String value;
}
```
