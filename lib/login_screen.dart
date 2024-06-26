import 'package:easyfood_flutter/forgotpass01.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easyfood_flutter/formField.dart';
import 'customButton.dart';
import 'package:flutter/gestures.dart';
import 'package:easyfood_flutter/signup_screen.dart';
import 'package:easyfood_flutter/animations.dart';
import 'main.dart';

class LoginScreen extends StatelessWidget {
  // Adjust the gap height as needed
  var addgap = SizedBox(height: 20);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(context) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Handle successful login (e.g., navigate to home screen)
       Navigator.push(
       context,
       SlideUpAnimation(
       page: MyApp(),
       duration: Duration(milliseconds: 500)),
           );
    } catch (e) {
      // Handle login failure (show error message)
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
           content: Text("Login failed. Please try again."),
            ),
        );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('Login')), // Center the title
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter your details to login',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          addgap,
          customTextInput(hintText: 'Email', controller: emailController,),
          addgap,
          customPassInput(hintText: 'Password', controller: passwordController,),
          addgap,
          addgap,
          Center(
            child: OrangeButton(
              text: 'Login',
              onPressed: () {
                login(context);
              },
            ),
          ),
          addgap,
          GestureDetector(
            onTap: () {
              // TODO: Implement forgot password functionality
            },
            child: InkWell(
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  SlideLeftAnimation(
                      page: ForgotPass01(),
                      duration: Duration(milliseconds: 300)),
                );
              },
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: Text('Or Login with'),
          ),
          addgap,
          NewButton(
            text: 'Login with Facebook',
            onPressed: () {},
            buttonColor: Colors.blue,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          NewButton(
            text: 'Login with Google',
            onPressed: () {},
            buttonColor: Colors.red,
            textColor: Colors.white,
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              text: "Don't have an Account? ",
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color: Color(0xffFC6011),
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                        context,
                        SlideUpAnimation(
                            page: SignupScreen(),
                            duration: Duration(milliseconds: 400)),
                      );
                    },
                ),
              ],
            ),
          ),
          addgap,
        ],
      ),
    );
  }
}
