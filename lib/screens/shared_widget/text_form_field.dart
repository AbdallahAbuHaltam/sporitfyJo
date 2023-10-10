import 'package:flutter/material.dart';
import '../../utilities/colors/utilities.dart';

Widget textFormFied(
  TextEditingController controller,
  validator,
  keyboardType,
) {
  return TextFormField(
    controller: controller,
    validator: validator,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      labelText: "Email",
      labelStyle: const TextStyle(
        color: mPrimaryColor,
      ),
      isDense: true,
      // prefixIcon: const Icon(
      //   Icons.email_outlined,
      //   color: mPrimaryColor,
      // ),
    ),
    keyboardType: keyboardType,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onSaved: (value) {
      controller.text = value!;
    },
  );
}