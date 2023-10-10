import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';
import 'package:sportify/screens/shared_functions/signup_functions.dart';
import 'package:sportify/screens/shared_widget/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/login_register/bloc/login_register_bloc_bloc.dart';
import '../../../utilities/colors/utilities.dart';
import '../../../utilities/fonts/fonts.dart';
import '../../player_screen/player_home.dart';

class PlayerSignUp extends StatefulWidget {
  const PlayerSignUp({super.key});

  @override
  State<PlayerSignUp> createState() => _PlayerSignUpState();
}

class _PlayerSignUpState extends State<PlayerSignUp> {
  File? image;
  final imagePicker = ImagePicker();
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource
            .gallery); // You can also use ImageSource.camera for taking a new photo.

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Now you can use the 'imageFile' for further processing, e.g., displaying it in your UI or uploading it to a server.
    } else {
      // User canceled the picker.
    }
  }

  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool phoneHasError = false;
  bool _isPasswordValid = true;
  bool _isObsecure = true;
  bool _isObsecure2 = true;

  final List<String> gender = ['Male', 'Female'];
  String selectedGender = 'Gender';

  final TextEditingController _customerGender = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confpasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginRegisterBlocBloc(),
      child: Scaffold(
        backgroundColor: mBackgroundColor,
        appBar: AppBar(
          title: Text(
            "RegisterP",
            style: appBarFont,
          ),
          backgroundColor: mMainColor,
        ),
        body: BlocConsumer<LoginRegisterBlocBloc, LoginRegisterBlocState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is LoginRegisterLoading) {
              const CircularProgressIndicator();
            } else if (state is LoginRegisterLoaded) {
              navigateToHomePage();
            } else if (state is LoginRegisterFailure) {
              const Text("Something is wrong !");
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: pageHeight * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.all(pageWidth * 0.05),
                          child: TextFormField(
                            controller: _emailController,
                            validator: SharedFunction.emailValidator,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                color: mMainColor,
                              ),
                              isDense: true,
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: mMainColor,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onSaved: (value) {
                              _emailController.text = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(pageWidth * 0.05),
                          child: TextFormField(
                            controller: _passwordController,
                            focusNode: passwordFocusNode,
                            obscureText: _isObsecure,
                            onChanged: (value) {
                              setState(() {
                                _isPasswordValid =
                                    SharedFunction.isPasswordValid(value);
                              });
                            },
                            validator: SharedFunction.passwordValidator,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                color: mMainColor,
                              ),
                              isDense: true,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: mMainColor,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObsecure = !_isObsecure;
                                    });
                                  },
                                  icon: Icon(
                                      !_isObsecure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: mMainColor)),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (value) {
                              _passwordController.text = value!;
                            },
                          ),
                        ),
                        passwordFocusNode.hasFocus
                            ? passwordException(context)
                            : Container(),
                        Padding(
                          padding: EdgeInsets.all(pageWidth * 0.05),
                          child: TextFormField(
                            controller: _confpasswordController,
                            obscureText: _isObsecure2,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required ,Please enter a password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: "confirm Password",
                              labelStyle: const TextStyle(
                                color: mMainColor,
                              ),
                              isDense: true,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: mMainColor,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObsecure2 = !_isObsecure2;
                                    });
                                  },
                                  icon: Icon(
                                    !_isObsecure2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: mMainColor,
                                  )),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (value) {
                              _confpasswordController.text = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(pageWidth * 0.05),
                          child: TextFormField(
                            controller: _nameController,
                            validator: (value) =>
                                value!.isEmpty ? " name required  " : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: " User name ",
                              labelStyle: const TextStyle(
                                color: mMainColor,
                              ),
                              isDense: true,
                              prefixIcon: const Icon(
                                Icons.person_2_rounded,
                                color: mMainColor,
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onSaved: (value) {
                              _nameController.text = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: pageWidth * 0.05,
                              right: pageWidth * 0.05,
                              top: pageWidth * 0.05),
                          child: IntlPhoneField(
                            dropdownIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: mMainColor,
                            ),
                            controller: _phoneNumberController,
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                setState(() {
                                  phoneHasError = true;
                                });
                              } else {
                                setState(() {
                                  phoneHasError = false;
                                });
                              }
                              return null;
                            },
                            initialCountryCode: "JO",
                            focusNode: focusNode,
                            cursorColor: mMainColor,
                            decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                color: mMainColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: phoneHasError
                                        ? Colors.red
                                        : Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: phoneHasError
                                        ? Colors.red
                                        : Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: phoneHasError
                                        ? Colors.red
                                        : Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: 'Phone Number',
                            ),
                            languageCode: "en",
                            onCountryChanged: (country) {
                              print('Country changed to: ${country.name}');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: pageWidth * 0.09),
                          child: DropdownMenu<String>(
                            controller: _customerGender,
                            label: const Text('Gender',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            initialSelection: selectedGender,
                            onSelected: (String? value) {
                              setState(() {
                                _customerGender.text = value!;
                              });
                            },
                            dropdownMenuEntries: gender
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: pageHeight * 0.01,
                              bottom: pageHeight * 0.05),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  mBackgroundColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  mPrimaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                               _handelSignUp();
                               PlayerInfo newPlayerModel = await playerModelData();

                               BlocProvider.of<LoginRegisterBlocBloc>(context).add(
                                 PlayerSignUpEvent(
                                   playerInfo: newPlayerModel,
                                   email: _emailController.text,
                                   password: _passwordController.text,
                                 ),
                               );
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
  void _handelSignUp() async {
    if (_phoneNumberController.text.isNotEmpty) {
      setState(() {
        phoneHasError = false;
      });
    }
    if (_phoneNumberController.text.isEmpty &&
        _formKey.currentState!.validate() == false) {
      setState(() {
        phoneHasError = true;
      });
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      const snackBar = SnackBar(
        content: Text('Sign up successful'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void navigateToHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>  PlayerHome(
          isOwner: false,
        ),
      ),
      (route) => false,
    );
  }

  Future<PlayerInfo> playerModelData() async {
    PlayerInfo newPlayerModel = PlayerInfo(
        playerEmail: _emailController.text,
        playerPassword: _passwordController.text,
        playerUUId: '',
        playerName: _nameController.text,
        playerAge: '',
        playerPhone: _phoneNumberController.text,
        playerGender: _customerGender.text);
    return newPlayerModel;
  }
}
