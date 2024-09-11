import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/buttons.dart';
import 'package:recicla_palmas/app/core/widgets/text_field.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController standartController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> changeForms = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    standartController;
    passwordController;
    formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Recicla Palmas"),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraits) {
            return Container(
              width: constraits.maxWidth / 1.5,
              height: constraits.maxHeight / 2,
              constraints: constraits,
              color: CustomColors.cardColor,
              child: ValueListenableBuilder(
                valueListenable: changeForms,
                builder: (_, value, __) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: value
                          ? Container(
                              width: 10,
                              height: 200,
                              color: Colors.red,
                            )
                          : login(
                              maxWidth: constraits.maxWidth,
                              maxHeight: constraits.maxHeight,
                            ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButtons.buttonPrimary(
                          label: "Cadastre-se",
                          fontSize: 10,
                          width: constraits.maxWidth / 20,
                          height: constraits.maxHeight / 20,
                          // color: CustomColors.inputBorderFocusColor,
                          function: () {
                            changeForms.value = !changeForms.value;
                          },
                        ),
                        CustomButtons.buttonPrimary(
                          label: "Enviar",
                          fontSize: 10,
                          width: constraits.maxWidth / 20,
                          height: constraits.maxHeight / 20,
                          function: () {
                            var currentStateFormKey =
                                formKey.currentState?.validate();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget login({required double? maxWidth, required double? maxHeight}) {
    SizedBox space = const SizedBox(height: 40);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: maxWidth,
              height: maxHeight! / 13,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: CustomColors.colorGradientHeader,
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        space,
        Flexible(
          child: CustomTextFormField.standart(
            controller: standartController,
          ),
        ),
        space,
        Flexible(
          child: CustomTextFormField.password(
            controller: passwordController,
          ),
        ),
        space,
      ],
    );
  }
}
