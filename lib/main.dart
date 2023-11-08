import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sportify/screens/player_screen/detail_page/detail_player.dart';
import 'package:sportify/screens/player_screen/home/player_home.dart';
import 'package:sportify/screens/owner_screen/owner_home/owner_home.dart';
import 'package:sportify/screens/type_of_user/type_of_user_screen.dart';
import 'package:sportify/shared_preference/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(const DetailPlayer(isOwner: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fixed constructor

  Future<String?> getCurrentUID() async {
    Future<String?> currentUID =
        SharedPreferencesManager.getData(key: 'currentUID');

    return currentUID;
  }

  Future<String?> getCurrentType() async {
    String? currentType =
        await SharedPreferencesManager.getData(key: 'currentType');

    return currentType;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: getCurrentUID(),
        builder: (context, uidSnapshot) {
          if (uidSnapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          String? currentUID = uidSnapshot.data;

          if (currentUID != null && currentUID.isNotEmpty) {
            return FutureBuilder<String?>(
              future: getCurrentType(),
              builder: (context, typeSnapshot) {
                if (typeSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                String? currentType = typeSnapshot.data;

                if (currentType == 'owner') {
                  return  OwnerHomePage(
                    isOwner: true,
                  );
                } else if (currentType == 'player') {
                  return  PlayerHome(
                    isOwner: false,
                  );
                } else {
                  return const TypeOfUser();
                }
              },
            );
          } else {
            return const TypeOfUser();
          }
        },
      ),
    );
  }
}


