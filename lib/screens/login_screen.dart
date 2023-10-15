import 'dart:convert';

import 'package:auth_mobile_app/constants/colors.dart';
import 'package:auth_mobile_app/constants/padding.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:auth_mobile_app/screens/profile_screen.dart';
import 'package:auth_mobile_app/screens/register_screen.dart';
import 'package:auth_mobile_app/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool myObscureText = true;
  bool checkBoxValue = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

/*  void login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://dummyjson.com/auth/login'), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['firstName']);
        print('Login successfully');
      } else {
        print('failed');
        print('the code : ${response.statusCode.toString()}');
      }
    } catch (e) {
      print(e.toString());
    }
  }*/

  ///ChatGpt code
  Future<void> login(
      String username, String password, BuildContext context) async {
    try {
      final response = await post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['firstName']);
        print('Login Successful');
        String loggedFirstName = data['firstName'];
        String loggedUsername = data['username'] ;
        String loggedEmail = data['email'] ;
        String loggedGender = data['gender'] ;
        String loggedImage = data['image'] ;

        User myUser = User(
          loggedFirstName,
          loggedUsername,
          loggedEmail,
          loggedGender,
          loggedImage,
        );
       navigateTo(context, ProfileScreen(user: myUser));
      } else {
        print('Login Failed - Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/cover-photo.png',
                  height: fullHeight * 0.20,
                  width: fullHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: fullHeight * 0.15,
                ),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/intern2growLogo.png',
                      width: 116,
                      height: 116,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Center(
            child: Text(
              'Login into your account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: BOLD_TEXT_COLOR,
              ),
            ),
          ),
          const SizedBox(height: p_22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textTitle(myText: 'Username'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _usernameController.clear();
                      },
                      icon: const Icon(
                        Icons.highlight_remove,
                        color: GRAY_COLOR,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: GRAY_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: GRAY_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter your username',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: p_22),
                textTitle(myText: 'Password'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: myObscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          myObscureText = !myObscureText;
                        });
                      },
                      icon: myObscureText
                          ? const Icon(
                              Icons.visibility,
                              color: GRAY_COLOR,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: GRAY_COLOR,
                            ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: GRAY_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: GRAY_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: p_22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: Checkbox(
                        value: checkBoxValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: BOLD_TEXT_COLOR, //0xFF2A2B2E
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: UNDERLINE_TEXT_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: BOLD_TEXT_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: fullWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      // navigateTo(context, ProfileScreen());
                      login(
                        _usernameController.text.toString(),
                        _passwordController.text.toString(),
                        context,
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: BOLD_TEXT_COLOR, //0xFF2A2B2E
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateAndFinish(context, RegisterScreen());
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: UNDERLINE_TEXT_COLOR,
                          //0xff4F90F0
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: BOLD_TEXT_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**
 *
 * List view
 *  Stack
 *    cover image
 *    logo image
 *  Username text
 *  Username input field
 *  password text
 *  password input field
 *  Row
 *    remember me check box
 *    forget password text
 *  Login button
 *  Row
 *    Don't have and account text
 *    Register text
 *
 * */
