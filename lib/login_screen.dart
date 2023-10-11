import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool myObscureText = true;
  bool checkBoxValue = false;
  final TextEditingController _usernameController = TextEditingController();

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
                color: Color(0xFF2A2B2E),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF808194),
                  ),
                ),
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
                        color: Color(0xff808194),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Color(0xFF808194),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Color(0xFF808194),
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
                const SizedBox(height: 22),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF808194),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
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
                              color: Color(0xff808194),
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Color(0xff808194),
                            ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Color(0xFF808194),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Color(0xFF808194),
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
                const SizedBox(height: 22),
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
                        color: Color(0xFF2A2B2E),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff4F90F0),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2A2B2E),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: fullWidth,
                  child: ElevatedButton(
                    onPressed: () {},
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
                        color: Color(0xFF2A2B2E),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff4F90F0),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2A2B2E),
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
