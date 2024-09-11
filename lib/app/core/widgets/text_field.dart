import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/utils/border_styles.dart';
import 'package:recicla_palmas/app/core/widgets/text_form_validate.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField._();

  static Widget standart({required TextEditingController controller}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          decoration: CustomBorderStyles.completeDecoration(label: "Email"),
          validator: (text) => TextValidate.emailValidator(text),
          controller: controller,
        ),
      );

  static Widget password({required TextEditingController controller}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          decoration: CustomBorderStyles.completeDecoration(label: "Senha"),
          obscureText: true,
          validator: (text) => TextValidate.passwordValidator(text),
          controller: controller,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
