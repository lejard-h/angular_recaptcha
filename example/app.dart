import 'package:angular2/core.dart';
import 'package:angular_recaptcha/angular_recaptcha.dart';

@Component(
    selector: 'app',
    template: '''
        <angular-recaptcha key="6LdjEBAUAAAAAEYJEYTdnBJ7_cExHfDuqodS6oiX" [(ngModel)]="value" auto-render></angular-recaptcha>
        ''',
    directives: const [AngularRecaptcha])
class App {
  dynamic _value;

  dynamic get value => _value;

  void set value(v) {
    print(v);
    _value = v;
  }
}
