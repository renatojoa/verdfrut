import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/page_routes/app_pages.dart';
import 'package:greengroocer/src/pages/auth/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Adicione qualquer lógica de inicialização, se necessário
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    // Aguarde por alguns segundos (por exemplo, 2 segundos) para simular a exibição da splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Navegue para a próxima tela (pode ser a tela inicial do aplicativo)
    
      Get.offNamed(PageRoutes.signInRoute);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhitechColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: CustomColors.customWhitechColor,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Text(
              'Produtos para seu dia-dia',
              style: TextStyle(
                  fontSize: 20, color: CustomColors.customPurpleColor),
            )
          ],
        ),
      ),
    );
  }
}
