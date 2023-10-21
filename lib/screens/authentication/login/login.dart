import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/screens/owner_screen/owner_home/owner_home.dart';
import 'package:sportify/screens/player_screen/home/player_home.dart';
import 'package:sportify/utilities/colors/utilities.dart';

import '../../../data/login_register/bloc/login_register_bloc_bloc.dart';
import '../../../utilities/fonts/fonts.dart';
import '../owner_signup/owner_signup.dart';
import '../player_signup/player_signup.dart';
import 'login_function.dart';

class LoginPage extends StatefulWidget {
  final bool? isOwner;
  const LoginPage({Key? key, required this.isOwner}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginRegisterBlocBloc(),
      child: BlocConsumer<LoginRegisterBlocBloc, LoginRegisterBlocState>(
        listener: (context, state) {
           if (state is LoginRegisterLoaded) {
              _navigateToHomePage();
            } else if (state is LoginRegisterFailure) {
              const Text('something wrong , try  again later');
            }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mMainColor,
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: pageWidth * 0.2),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: mBackgroundColor,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Image.asset('assets/images/Logo1.png'),
                    ),
                    SizedBox(
                      height: pageHeight * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(pageHeight * 0.02),
                      child: TextFormField(
                        controller: _emailController,
                        validator: LoginFunction.validateEmail,
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
                            color: mMainColor,
                          ),
                          isDense: true,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: mMainColor,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          _emailController.text = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(pageHeight * 0.02),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: isObsecure,
                        validator: LoginFunction.validatePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: mMainColor,
                          ),
                          isDense: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                // BlocProvider.of<LoginRegisterBloc>(context)
                                //     .add(ToggleVisibilityEvent(isObsecure));

                                setState(() {
                                  isObsecure = !isObsecure;
                                });
                              },
                              icon: Icon(!isObsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (value) {
                          _passwordController.text = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: pageHeight * 0.09),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              mBackgroundColor),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(mMainColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                           BlocProvider.of<LoginRegisterBlocBloc>(context)
                               .add(LoginSuccessEvent(
                             email: _emailController.text,
                             password: _passwordController.text,
                           ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: pageWidth * 0.44),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: loginText,
                          ),
                          TextButton(
                              onPressed: () {
                                if (widget.isOwner == true) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OwnerSignUp(),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PlayerSignUp(),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Register",
                                style: loginFontButton,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  void _navigateToHomePage() async {
    try {
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          if (widget.isOwner == true) {
            return  OwnerHomePage(
              isOwner: true,
            );
          } else {
            return  PlayerHome(
              isOwner: false,
            );
          }
        }),
        (route) => false,
      );
    } catch (e) {
      print("Login error__________________________________: $e");
    }
  }
}



