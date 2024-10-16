import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_auth.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/buttons.dart';
import 'package:recicla_palmas/app/core/widgets/text_form_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> changeForms = ValueNotifier<bool>(false);
  final ValueNotifier<bool> changePassword = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    emailController;
    userController;
    passwordController;
    formKey;
    changeForms;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        SupabaseDb.supabase.auth.onAuthStateChange.listen(
          (authState) {
            if (authState.session != null && mounted) {
              Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext scaffoldContext) {
    return Scaffold(
      appBar: customAppBar("Recicla Palmas"),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            filterQuality: FilterQuality.high,
            image: AssetImage("lib/app/core/assets/img/lake.jpg"),
          ),
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraits) {
              return ValueListenableBuilder(
                valueListenable: changeForms,
                builder: (_, value, __) => Container(
                  width: constraits.maxWidth / 1.5,
                  height: constraits.maxHeight / 2,
                  decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  constraints: constraits,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: formKey,
                        child: value
                            ? cardCadastro(
                                maxWidth: constraits.maxWidth,
                                maxHeight: constraits.maxHeight,
                              )
                            : cardLogin(
                                maxWidth: constraits.maxWidth,
                                maxHeight: constraits.maxHeight,
                              ),
                      ),
                      buttons(
                        maxWidth: constraits.maxWidth,
                        maxHeight: constraits.maxHeight,
                        change: value,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget cardLogin({
    required double? maxWidth,
    required double? maxHeight,
  }) {
    SizedBox space = const SizedBox(height: 40);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: maxWidth,
              height: maxHeight! / 13,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
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
            visible: changePassword,
          ),
        ),
        space,
      ],
    );
  }

  Widget cardCadastro({
    required double? maxWidth,
    required double? maxHeight,
  }) {
    SizedBox space = const SizedBox(height: 40);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
            visible: changePassword,
          ),
        ),
        space,
      ],
    );
  }

  Widget buttons({
    required double maxWidth,
    required double maxHeight,
    required bool change,
  }) =>
      Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtons.buttonPrimary(
                    label: change ? "Login" : "Cadastre-se",
                    fontSize: 10,
                    width: maxWidth / 12,
                    height: maxHeight / 16,
                    colorBackground: CustomColors.green500,
                    colorFont: Colors.white,
                    function: () {
                      changeForms.value = !changeForms.value;
                    },
                  ),
                  CustomButtons.buttonPrimary(
                    label: "Enviar",
                    fontSize: 10,
                    colorBackground: CustomColors.green500,
                    colorFont: Colors.white,
                    width: maxWidth / 12,
                    height: maxHeight / 16,
                    function: () {
                      if (formKey.currentState?.validate() == true) {
                        change
                            ? SupabaseAuth.signUp(
                                context: context,
                                email: emailController.value.text,
                                password: passwordController.value.text,
                              )
                            : SupabaseAuth.signIn(
                                context: context,
                                email: emailController.value.text,
                                passsword: passwordController.value.text,
                              );
                        userController.clear();
                        passwordController.clear();
                        emailController.clear();
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );
}
