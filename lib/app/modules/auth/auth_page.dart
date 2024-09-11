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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> changeForms = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    emailController;
    userController;
    passwordController;
    formKey;
    changeForms;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Recicla Palmas"),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraits) {
            return ValueListenableBuilder(
              valueListenable: changeForms,
              builder: (_, value, __) => Container(
                width: constraits.maxWidth / 1.5,
                height: value
                    ? constraits.maxHeight / 1.4
                    : constraits.maxHeight / 1.8,
                constraints: constraits,
                color: CustomColors.cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: value
                          ? cadastro(
                              maxWidth: constraits.maxWidth,
                              maxHeight: constraits.maxHeight,
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
                          label: value ? "Login" : "Cadastre-se",
                          fontSize: 10,
                          width: constraits.maxWidth / 12,
                          height: constraits.maxHeight / 16,
                          // color: CustomColors.inputBorderFocusColor,
                          function: () {
                            changeForms.value = !changeForms.value;
                          },
                        ),
                        CustomButtons.buttonPrimary(
                          label: "Enviar",
                          fontSize: 10,
                          width: constraits.maxWidth / 12,
                          height: constraits.maxHeight / 16,
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
          child: CustomTextFormField.user(
            controller: emailController,
            placeholder: "Email",
          ),
        ),
        space,
        Flexible(
          child: CustomTextFormField.password(
            controller: passwordController,
            placeholder: "Senha",
          ),
        ),
        space,
      ],
    );
  }

  Widget cadastro({required double? maxWidth, required double? maxHeight}) {
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
                "Cadastro",
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
          child: CustomTextFormField.user(
            controller: userController,
            placeholder: "Usuário",
          ),
        ),
        space,
        Flexible(
          child: CustomTextFormField.email(
            controller: emailController,
            placeholder: "Email",
          ),
        ),
        space,
        Flexible(
          child: CustomTextFormField.password(
            controller: passwordController,
            placeholder: "Senha",
          ),
        ),
        space,
      ],
    );
  }
}
