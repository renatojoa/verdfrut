
import 'package:flutter/material.dart';
import 'package:greengroocer/src/components/custom_text_field.dart';
import 'package:greengroocer/src/config/app_data.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')},
    );

    final phoneFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil do usuário', style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: CustomColors.customPurpleColor,
        actions: [
          IconButton(onPressed: () {
            
          }, icon: const Icon(
            Icons.logout, 
            color: Colors.white,
            )
          )
        ],

        ),
        body: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                      children: [
                        //Email
                        CustomTextField(
                          icon: Icons.email,
                          label: 'Email',
                          isFilled: userData.UserMail,
                          isEdditable: false,
                          newBackgroundColor: Colors.black87
                        ),              
                        // Name
                        CustomTextField(
                          icon: Icons.person,
                          label: 'Name',
                          isFilled: userData.UserName,
                          newBackgroundColor: Colors.black87
                        ),
                         // CPF
                        CustomTextField(
                          icon: Icons.wallet,
                          label: 'CPF',
                          inputFormatters: [cpfFormatter],
                          isSecret: true,
                          isFilled: userData.UserID,
                          newBackgroundColor: Colors.black87
                        ),
              
                        // Celular
                        CustomTextField(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatters: [phoneFormatter],
                          isFilled: userData.UserPhone,
                          newBackgroundColor: Colors.black87
                        ),
              
                        SizedBox(
                          height: 50,
                          width: 120,
                          child: OutlinedButton(
                            
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)
                          
                              ),
                            ), onPressed: () {  }, 
                            child: const Text(
                              'Salvar',
                              style: TextStyle(
                                  color: Colors.green,
                            ),        
                          ),
                      ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10
                          ),
                          child: SizedBox(
                            height: 50,
                            width: 120,
                            child: OutlinedButton(                          
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                            
                                ),
                              ), onPressed: () { 
                                updatePassword(context);
                               }, 
                              child: const Text(
                                'Atualizar Senha',
                                style: TextStyle(
                                    color: Colors.green,
                              ),        
                            ),
                          ),
                          ),
                        ),
                      ],
                  )
        
    );
  }
   Future<bool?> updatePassword(BuildContext context){
    return showDialog<bool>(
      context: context, 
      builder: (context) {
        return AlertDialog(
          
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 1, right: 1),
              child: IconButton(onPressed: () {
                  Navigator.pop(context);
              }, icon: const Icon(Icons.close)),
            ),
            const Center(
              child: Padding(
                
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5
                ),
                child: Text('Atualização de senha',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
            CustomTextField(icon: Icons.lock, label: 'Senha Atual', isSecret: true,newBackgroundColor: Colors.black87),
            CustomTextField(icon: Icons.lock_outline, label: 'Nova Senha', isSecret: true,newBackgroundColor: Colors.black87),
            CustomTextField(icon: Icons.lock_outline, label: 'Confirmar Nova Senha ', isSecret: true,newBackgroundColor: Colors.black87),
            
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
          
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                  ), onPressed: () {  }, 
                  child: const Text(
                    'Alterar Senha',
                    style: TextStyle(
                        color: Colors.white,
                  ),        
                ),
              ),
                      ],
            ),
        
          ],
        );
      }
    );
  }
}
