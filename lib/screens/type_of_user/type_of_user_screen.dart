import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/data/type_of_user/bloc/type_of_user_bloc.dart';

import '../../utilities/fonts/fonts.dart';
import '../../utilities/utilities.dart';
import '../authentication/login/login.dart';

class TypeOfUser extends StatefulWidget {
  const TypeOfUser({super.key});

  @override
  State<TypeOfUser> createState() => _TypeOfUserState();
}

class _TypeOfUserState extends State<TypeOfUser> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => TypeOfUserBloc(),
      child: Scaffold(
        body: BlocConsumer<TypeOfUserBloc, TypeOfUserState>(
          listener: (context, state) {
            if (state is ChoosingOwnerState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage(isOwner: true)));
            } else if (state is ChoosingPlayerState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage(isOwner: false)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                color: mMainColor,
                width: pageWidth,
                height: pageHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Logo.jpeg'),
                      Padding(
                        padding: EdgeInsets.all(pageWidth * 0.1),
                        child: Text(
                          "Please select your User Type:",
                          style: inFont,
                          textAlign: TextAlign.center,
                          
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<TypeOfUserBloc>(context)
                              .add(UserTypeEvent(isOwner: true));
                        },
                        child: Card(
                          child: Container(
                            width: pageWidth * 0.8,
                            height: pageHeight * 0.2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/owner.png"),
                                  fit: BoxFit.contain),
                            ),
                            child: Align(
                              child: Container(
                                width: pageWidth * 0.8,
                                height: pageHeight * 0.2,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      const Color.fromARGB(255, 113, 113, 113)
                                          .withAlpha(210),
                                      const Color.fromARGB(31, 107, 106, 106)
                                          .withAlpha(210),
                                      const Color.fromARGB(179, 108, 107, 107)
                                          .withAlpha(210),
                                    ],
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:  Text('Owner',style: appBarFont,),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: pageHeight * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<TypeOfUserBloc>(context)
                              .add(UserTypeEvent(isOwner: false));
                        },
                        child: Card(
                          child: Container(
                            width: pageWidth * 0.8,
                            height: pageHeight * 0.2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/players.jpeg"),
                                  fit: BoxFit.contain),
                            ),
                             child: Align(
                              child: Container(
                                width: pageWidth * 0.8,
                                height: pageHeight * 0.2,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      const Color.fromARGB(255, 113, 113, 113)
                                          .withAlpha(210),
                                      const Color.fromARGB(31, 107, 106, 106)
                                          .withAlpha(210),
                                      const Color.fromARGB(179, 108, 107, 107)
                                          .withAlpha(210),
                                    ],
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:  Text('Player',style: appBarFont,),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
