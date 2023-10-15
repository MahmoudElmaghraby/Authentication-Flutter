import 'package:auth_mobile_app/constants/colors.dart';
import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false, //To delete all the last screens
    );

Widget textTitle({required String myText}) {
  return Text(
    myText,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: GRAY_COLOR,
    ),
  );
}




/*

final TextEditingController _usernameController = TextEditingController();

Widget myInputField({
  required hintText,
  IconData suffixIcon = Icons.abc_outlined,
}) {
  return TextFormField(
    controller: _usernameController,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: () {
          _usernameController.clear();
        },
        icon: Icon(
          suffixIcon,
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
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
*/
