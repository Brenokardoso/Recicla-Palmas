import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recicla_palmas/app/core/database/supabase_auth.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/buttons.dart';
import 'package:recicla_palmas/app/core/widgets/image.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     SupabaseDb.supabase.auth.onAuthStateChange.listen(
    //       (authState) {
    //         if (authState.session != null && mounted) {
    //           Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
    //         }
    //       },
    //     );
    //   },
    // );
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
    double pi = 3.14159;
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushNamed(Routes.homeRoute);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraits) {
          return ValueListenableBuilder(
            valueListenable: changeForms,
            builder: (_, value, __) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: constraits.maxWidth * .45,
                  height: constraits.maxHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: CustomColors.gradientColorsAuth,
                      transform: GradientRotation((pi / 2)),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        imageReciclaPalmas,
                        const SizedBox(height: 10),
                        const Text(
                          "Recicla Palmas",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: constraits.maxWidth * .55,
                  height: constraits.maxHeight,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                              "Acesse sua conta",
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.grey[700]!,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 64),
                      Form(
                        key: formKey,
                        child: value
                            ? cardCadastro(
                                maxWidth: constraits.maxWidth / 2,
                                maxHeight: constraits.maxHeight / 2,
                              )
                            : cardLogin(
                                maxWidth: constraits.maxWidth / 2,
                                maxHeight: constraits.maxHeight / 2,
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
              ],
            ),
          );
        },
      ),
    );
  }

  Widget cardLogin({
    required double? maxWidth,
    required double? maxHeight,
  }) {
    SizedBox space = const SizedBox(height: 40);

    return Container(
      width: 600,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: CustomTextFormField.user(
                controller: emailController,
                text: "Email",
                placeholder: "Digite seu email...."),
          ),
          space,
          Flexible(
            child: CustomTextFormField.password(
                controller: passwordController,
                text: "Senha",
                visible: changePassword,
                placeholder: "Digite a sua senha..."),
          ),
          space,
        ],
      ),
    );
  }

  Widget cardCadastro({
    required double? maxWidth,
    required double? maxHeight,
  }) {
    SizedBox space = const SizedBox(height: 40);

    return Container(
      width: 600,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: CustomTextFormField.email(
              controller: emailController,
              text: "Email",
              placeholder: "Digite seu email...",
            ),
          ),
          space,
          Flexible(
            child: CustomTextFormField.password(
              controller: passwordController,
              text: "Senha",
              visible: changePassword,
              placeholder: "Digite a sua senha",
            ),
          ),
          space,
        ],
      ),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtons.buttonPrimary(
                    label: "Acessar",
                    fontSize: 25,
                    colorBackground: CustomColors.green500,
                    colorFont: Colors.white,
                    width: maxWidth / 5,
                    height: maxHeight / 16,
                    fontWeight: FontWeight.w500,
                    function: () {
                      print("Login");
                      if (formKey.currentState?.validate() == true) {
                        Navigator.of(context).pushNamed(Routes.homeRoute);

                        // SupabaseAuth.signIn(
                        //   context: context,
                        //   email: emailController.value.text,
                        //   passsword: passwordController.value.text,
                        // );
                        userController.clear();
                        passwordController.clear();
                        emailController.clear();
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomButtons.buttonPrimary(
                    label: "Me cadastrar",
                    fontSize: 25,
                    width: maxWidth / 5,
                    height: maxHeight / 16,
                    colorBackground: Colors.white,
                    colorFont: CustomColors.green500,
                    elevation: 0,
                    fontWeight: FontWeight.w500,
                    function: () {
                      print("Cadastro");

                      // SupabaseAuth.signUp(
                      //   context: context,
                      //   email: emailController.value.text,
                      //   password: passwordController.value.text,
                      // );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
