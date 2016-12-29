# Angular Recaptcha (Dart)

## How to use

### Add to pubspec.yaml
`angular_recaptcha: 0.0.1`

then

`pub get`

### Add to index.html

`<script async defer src="https://www.google.com/recaptcha/api.js?render=explicit"></script>`

### Use it

`<angular-recaptcha [(ngModel)]="value" key="YOUR_KEY"></angular-recaptcha>`