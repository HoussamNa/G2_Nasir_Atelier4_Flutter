import 'package:atelier4_h_nasir_iir5g2/ajt_produit.dart';
import 'package:atelier4_h_nasir_iir5g2/produit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class LoginEcran extends StatelessWidget {
  const LoginEcran({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SignInScreen();
          }
          return const ListeProduits();
        },
      ),
    );
  }
}

