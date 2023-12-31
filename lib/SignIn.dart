import 'package:atelier4_h_nasir_iir5g2/PlaceHolderScreen.dart';
import 'package:atelier4_h_nasir_iir5g2/produit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              try {
                UserCredential userCredential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );

                if (emailController.text == 'Houssam@admin.com' &&
                    passwordController.text == 'admin123') {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListeProduits()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlaceholderScreen()),
                  );
                }
              } catch (e) {
                print('Error: $e');
              }
            },
            child: const Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}
