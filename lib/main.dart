/* import 'package:cloud_firestore/cloud_firestore.dart'; */
import 'package:flutter/material.dart';
import 'package:bernardo_cardoso_presentation/home/home.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

/*   FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("Somente para testar").doc("Estou testando").set({
   "funcionou": true, 
  }); */

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bernardo Cardoso',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(0, 65, 130, 1),
      ),
      initialRoute: '/home',
      routes: {
        // É aqui onde as rotas são definidas.

        '/home': (context) => const HomePage(),
      },

      // Vai ficar de exemplo por hora.

/*       initialRoute: decideInitialRoute(),
      routes: {
        //Define a rota aqui.
        '/': (context) => StartPage(),
        '/home': (context) => HomePage(),
        '/channels': (context) => ChannelsListPage(),
        '/courses': (context) => CoursesPage(),
        '/favorites': (context) => FavoritesPage(),,
      }, */
    );
  }
}
