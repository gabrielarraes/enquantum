import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/signIn/cubit/Sign_in_cubit.dart';

class SignInRegisterButton extends StatelessWidget {
  const SignInRegisterButton({super.key});

  @override
  Widget build(BuildContext context) =>
  Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black ),
          borderRadius: BorderRadius.circular(24)
        ),
        backgroundColor: Colors.white//side: const BorderSide(color: Colors.white, width: 1),
      ),
      onPressed: () => context.read<SignInCubit>().signIn(),
      child: const Text(
        "Cadastrar",
        style: TextStyle(color: Color(0xFF6750A4), fontWeight: FontWeight.w700),
      )
    )
  );
} 