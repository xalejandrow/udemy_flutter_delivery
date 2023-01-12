import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';
import 'package:udemy_flutter_delivery/src/providers/users_provider.dart';

class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();


  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();


    print('Email ${email}');
    print('Password ${password}');

    // Get.snackbar('Email', email);
    // Get.snackbar('Password', password);

    if(isValidForm(email, name, lastName, phone, password, confirmPassword)){

      User user = User(
        email: email,
        name: name,
        lastname: lastName,
        phone: phone,
        password: password
      );

      Response response = await usersProvider.create(user);
      
      print('RESPONSE: ${response.body}');

      Get.snackbar('Formulario válido', 'Estás listo para enviar la petición HTTP');
    }
  }


  bool isValidForm(String email, String name, String lastName, String phone, String password, String confirmPassword) {

    if(email.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar tu Email');
      return false;
    }

    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no válido', 'El Email no es válido');
      return false;
    }

    if(name.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar tu Nombre');
      return false;
    }
    if(lastName.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar tu Apellido');
      return false;
    }
    if(phone.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar tu teléfono');
      return false;
    }

    if(password.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el password');
      return false;
    }
    if(confirmPassword.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes confirmar el password');
      return false;
    }

    if(password != confirmPassword){
      Get.snackbar('Formulario no válido', 'Los password no coinciden');
      return false;
    }

    return true;
  }
}