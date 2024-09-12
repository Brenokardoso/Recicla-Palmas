import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/assets/fonts/fonts_implementation/eyes_icons.dart';
import 'package:recicla_palmas/app/core/utils/border_styles.dart';
import 'package:recicla_palmas/app/core/widgets/text_form_validate.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField._();

  static Widget user(
          {required TextEditingController controller,
          required String placeholder}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          decoration: CustomBorderStyles.completeDecoration(label: placeholder),
          validator: (text) => TextValidate.userValidator(text),
          controller: controller,
        ),
      );

  static Widget email(
          {required TextEditingController controller,
          required String placeholder}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          decoration: CustomBorderStyles.completeDecoration(label: placeholder),
          validator: (text) => TextValidate.emailValidator(text),
          controller: controller,
        ),
      );

  static Widget password(
          {required TextEditingController controller,
          required String placeholder,
          required ValueNotifier<bool> visible}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ValueListenableBuilder(
          valueListenable: visible,
          builder: (_, value, __) => TextFormField(
            decoration: CustomBorderStyles.completeDecoration(
              label: placeholder,
              icon: value
                  ? IconButton(
                      padding: const EdgeInsets.all(8.0),
                      onPressed: () {
                        visible.value = !visible.value;
                      },
                      icon: const Icon(
                        EyesIcon.eye_off,
                        size: 20,
                      ),
                    )
                  : IconButton(
                      padding: const EdgeInsets.all(8.0),
                      onPressed: () {
                        visible.value = !visible.value;
                      },
                      icon: const Icon(
                        EyesIcon.eye,
                        size: 20,
                      ),
                    ),
            ),
            obscureText: value ? false : true,
            validator: (text) => TextValidate.passwordValidator(text),
            controller: controller,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
