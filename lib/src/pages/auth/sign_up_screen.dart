import 'package:flutter/material.dart';
import 'package:greengroocer/src/components/custom_text_field.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')},
    );
    final phoneFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );

    return Scaffold(
      backgroundColor: CustomColors.customWhitechColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                
                //Background Child
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
    
                        height: 120,
                        width: 320,
                        child: Image.asset('assets/images/logo.png'),
                    ),
                                 
                
                        ],
                      )
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical:  40,
                    ),
                    decoration: BoxDecoration(
                      color: CustomColors.customGreenColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(45)
                      ),
                    ),
                    //Formulario
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Email
                        CustomTextField(
                          icon: Icons.email,
                           label: 'Email *',
                           newBackgroundColor: Colors.black87
                        ),
                    
                        //Password
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Password *',
                          isSecret: true,
                          newBackgroundColor: Colors.black87
                        ),
                  
                        // Confirm Password
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Confirm Password *',
                          isSecret: true,
                          newBackgroundColor: Colors.black87
                        ),
              
                        // CPF
                        CustomTextField(
                          icon: Icons.wallet,
                          label: 'CPF *',
                          inputFormatters: [cpfFormatter],
                          newBackgroundColor: Colors.black87
                        ),
              
                        // Celular
                        CustomTextField(
                          icon: Icons.phone,
                          label: 'Celular *',
                          inputFormatters: [phoneFormatter],
                          newBackgroundColor: Colors.pink
                        ),

              
                        // Name
                        CustomTextField(
                          icon: Icons.person,
                          label: 'Name',
                          newBackgroundColor: Colors.black87
                        ),
                      
              
                        SizedBox(
                          height: 50,
                          width: 120,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)
                              ),
                            ), onPressed: () {  }, 
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                  color: Colors.white,
                            ),        
                          ),
                      ),
                        ),
                      ],
                  ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    ),
                ),
              ),

            ],
          ),
        ),
      ),
);
  }
}