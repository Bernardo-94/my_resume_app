import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstructionPage extends StatefulWidget {
  const ConstructionPage({Key? key}) : super(key: key);

  @override
  State<ConstructionPage> createState() => _ConstructionPageState();
}

class _ConstructionPageState extends State<ConstructionPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(244, 242, 238, 1),
        padding: const EdgeInsets.only(top: 5.0),
        width: size.width,
        height: size.height * 0.69,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.09,
              ),
              SizedBox(
                height: size.height * 0.22,
                width: size.width * 0.7,
                child: Image.asset(
                  'assets/images/em_construcao.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Text(
                'Em Construção!',
                style: GoogleFonts.pressStart2p(
                  textStyle: const TextStyle(
                      fontSize: 22, color: Color.fromRGBO(103, 93, 169, 1)),
                ),
              ),
              SizedBox(
                height: size.height * 0.029,
              ),
              Text(
                'Em breve uma nova área para explorar neste App',
                textAlign: TextAlign.center,
                style: GoogleFonts.teko(
                  textStyle: const TextStyle(
                      fontSize: 30, color: Color.fromRGBO(231, 109, 171, 1)),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
