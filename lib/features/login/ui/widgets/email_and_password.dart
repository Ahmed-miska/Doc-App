import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(
      () {
        setState(
          () {
            hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
            hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
            hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
            hasNumber = AppRegex.hasNumber(passwordController.text);
            hasMinLength = AppRegex.hasMinLength(passwordController.text);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              // ignore: unnecessary_null_comparison
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please Enter a vaild Email';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Password',
            isObscureText: isObscureText,
            controller: context.read<LoginCubit>().passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              // ignore: unnecessary_null_comparison
              if (value == null || value.isEmpty) {
                return 'Please Enter a vaild password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
