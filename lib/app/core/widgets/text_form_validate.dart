import 'package:validatorless/validatorless.dart';

class TextValidate {
  static Function(String? value) userValidator = Validatorless.multiple(
    [
      Validatorless.required("O campo não pode estar vazio"),
    ],
  );

  static Function(String? value) emailValidator = Validatorless.multiple(
    [
      Validatorless.required("O campo não pode estar vazio"),
      Validatorless.email("Digite um email válido"),
    ],
  );

  static Function(String? value) passwordValidator = Validatorless.multiple(
    [
      Validatorless.required("O campo não pode estar vazio"),
      Validatorless.min(8, "Sua senha precisa de no mínimo 8 digitos")
    ],
  );
}
