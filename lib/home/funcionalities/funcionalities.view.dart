import 'package:bernardo_cardoso_presentation/home/funcionalities/tic-tac-toe/tic-tac-toe.view.dart';
import 'package:bernardo_cardoso_presentation/home/funcionalities/zipcode-search/zipcode-search.view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FuncionalitiesTab extends StatelessWidget {
  const FuncionalitiesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(244, 242, 238, 1),
        padding: const EdgeInsets.only(top: 5.0),
        width: size.width,
        height: size.height * 0.7,
        child: Column(
          children: [
            funcionalitieCard(
              context,
              'Buscador de Cep',
              const ZipCodeSearchView(),
            ),
            funcionalitieCard(
              context,
              'Jogo da Velha',
              const TicTacToePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget funcionalitieCard(BuildContext context, String title, dynamic view) {
    return GestureDetector(
      child: Card(
        child: SizedBox(
          height: 50.0,
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Text(
                title,
                style: GoogleFonts.viga(
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(5, 5),
                          blurRadius: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => view,
          ),
        );
      },
    );
  }
}
