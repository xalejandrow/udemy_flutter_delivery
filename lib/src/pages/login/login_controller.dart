import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    
    print('Email ${email}');
    print('Password ${password}');

   // Get.snackbar('Email', email);
   // Get.snackbar('Password', password);

    if(isValidForm(email, password)){
      Get.snackbar('Formulario válido', 'Estás listo para enviar la petición HTTP');

    }
  }


  bool isValidForm(String email, String password) {

    if(email.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el Email');
      return false;
    }

    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no válido', 'El Email no es válido');
      return false;
    }

    if(password.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el password');
      return false;
    }

    return true;
  }


}