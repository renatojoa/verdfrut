import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengroocer/src/page_routes/app_pages.dart';
import 'package:greengroocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengroocer/src/pages/base/base_screen.dart';
import 'package:greengroocer/src/components/custom_text_field.dart';
import 'package:greengroocer/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customWhitechColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(

              //Background Child
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColors.customPurpleColor,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(45)),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 320,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: CustomColors.customPurpleColor,
                          fontSize: 20,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Vegetais'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Vinhos'),
                            FadeAnimatedText('e muito mais!'),
                          ],
                          pause: Duration.zero,
                        ),
                      ),
                    ),
                  ],
                )),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColors.customPurpleColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(45)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Email
                        CustomTextField(
                          icon: Icons.email,
                          label: 'Email',
                          newBackgroundColor: CustomColors.customGreenColor,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Email e um campo obrigatorio';
                            }
                            if (!email.contains(RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                              return 'Digite um email valido';
                            }
                            return null;
                          },
                        ),

                        //Senha
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Password',
                          isSecret: true,
                          newBackgroundColor: CustomColors.customGreenColor,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Senha e um campo obrigatorio';
                            }
                            if (password.length < 6) {
                              return 'Senha deve possuir mais de 6 caracteres';
                            }
                            if (!password
                                .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return 'Senha deve possuir caractere especial';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 50,
                          width: 120,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      CustomColors.customPurpleColor,
                                  shadowColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: BorderSide(
                                          width: 1,
                                          color: CustomColors
                                              .customWhitechColor))),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.toNamed(PageRoutes.baseRoute);
                                }
                              },
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  color: CustomColors.customWhitechColor,
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                  color: CustomColors.customWhitechColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'ou',
                                  style: TextStyle(
                                      color: CustomColors.customWhitechColor),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 120,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1,
                                      color: CustomColors.customWhitechColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {
                                Get.toNamed(PageRoutes.signUnRoute);
                              },
                              child: Text(
                                'Criar Conta',
                                style: TextStyle(
                                  color: CustomColors.customWhitechColor,
                                  fontSize: 18,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
