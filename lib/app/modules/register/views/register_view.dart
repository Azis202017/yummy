import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../theme/theme.dart';
import '../../widgets/custom_text_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Login',
              style: TextStyles.title,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/Landing page 1.jpg'),
                  const SizedBox(height: 24.0),
                  Text(
                    'Login Details',
                    style: TextStyles.title.copyWith(fontSize: 20.0),
                  ),
                  const SizedBox(height: 24.0),
                  CustomTextField(
                    controller: controller.nameController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hint: 'Name ',
                  ),
                  CustomTextField(
                    controller: controller.emailController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hint: 'Email ',
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                      controller: controller.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      hint: 'Password',
                      isObscure: controller.isObsecure,
                      hasSuffix: true,
                      onPressed: controller.showPassword),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text('Lupa Password?', style: TextStyles.body),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.oren,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    onPressed: controller.register,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Login',
                        style: TextStyles.title.copyWith(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    "Sudah punya akun?",
                    style: TextStyles.body.copyWith(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.HOME),
                    child: Text(
                      "Masuk disini",
                      style: TextStyles.body.copyWith(
                        fontSize: 18.0,
                        color: AppColors.oren,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
