import 'package:auth_mobile_app/constants/colors.dart';
import 'package:auth_mobile_app/constants/padding.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:auth_mobile_app/screens/login_screen.dart';
import 'package:auth_mobile_app/shared/components.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool myObscureText = true;
  bool checkBoxValue = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

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
                    /* child: Image.asset(
                      'assets/images/intern2growLogo.png',
                      width: 116,
                      height: 116,
                    ),*/
                    child: Image.network(
                      widget.user.image.toString(),
                      width: 116,
                      height: 116,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Center(
            child: Text(
              widget.user.firstName.toString(),
              style: const TextStyle(
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
                  enabled: false,
                  controller: _usernameController,
                  decoration: InputDecoration(
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
                    hintText: widget.user.username.toString(),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: p_22),
                textTitle(myText: 'Email'),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: false,
                  controller: _emailController,
                  decoration: InputDecoration(
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
                    hintText: widget.user.email.toString(),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: p_22),
                textTitle(myText: 'Gender'),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: false,
                  controller: _genderController,
                  decoration: InputDecoration(
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
                    hintText: widget.user.gender.toString(),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: p_22),
                SizedBox(
                  width: fullWidth,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(RED_DEEP_COLOR),
                    ),
                    onPressed: () {
                      navigateTo(context, LoginScreen());
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
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
