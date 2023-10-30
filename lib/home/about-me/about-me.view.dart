import 'dart:convert';

import 'package:bernardo_cardoso_presentation/firestore/models/professional-expertise.model.dart';
import 'package:flutter/material.dart';
import 'package:bernardo_cardoso_presentation/shared/constants.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeTab extends StatefulWidget {
  const AboutMeTab({Key? key}) : super(key: key);

  @override
  State<AboutMeTab> createState() => _AboutMeTabState();
}

class _AboutMeTabState extends State<AboutMeTab> {
  List<ProfessionalExpertiseModel> professionalExpertise = [];
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String jsonData =
        await rootBundle.loadString('assets/data/professional_expertise.json');
    List<dynamic> decodedData = json.decode(jsonData);

    setState(() {
      professionalExpertise = decodedData
          .map((json) => ProfessionalExpertiseModel.fromJson(json))
          .toList();
    });
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(244, 242, 238, 1),
        padding: const EdgeInsets.only(top: 5.0),
        width: size.width,
        child: Column(
          children: [
            aboutMe(size.height, size.width),
            professionalExpertises(size.width, size.height),
          ],
        ),
      ),
    );
  }

  Widget aboutMe(var height, var width) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 5.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sobre mim',
              style: GoogleFonts.viga(
                textStyle: TextStyle(
                  fontSize: 17,
                  shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(5, 5),
                        blurRadius: 15),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _isExpanded ? totalVizualization() : minimalVizualization(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _toggleExpanded,
                  child: Text(
                    _isExpanded ? 'Ler Menos' : 'Ler Mais',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.008,
            ),
          ],
        ),
      ),
    );
  }

  Widget minimalVizualization() {
    return Column(
      children: [
        Text(
          paragraphPT[0],
          style: GoogleFonts.commissioner(
            textStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget totalVizualization() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphPT.map((paragraph) {
        return Text(
          paragraph,
          style: GoogleFonts.commissioner(
            textStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget professionalExpertises(var width, var height) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 5.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experiência Profissional',
              style: GoogleFonts.viga(
                textStyle: TextStyle(
                  fontSize: 17,
                  shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(5, 5),
                        blurRadius: 15),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.99,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: professionalExpertise.length,
              itemBuilder: (context, index) {
                ProfessionalExpertiseModel pExpertise =
                    professionalExpertise[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pExpertise.occupation,
                        style: GoogleFonts.abel(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3.0,
                          right: 3.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pExpertise.company,
                              style: GoogleFonts.inconsolata(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              pExpertise.duration,
                              style: GoogleFonts.inconsolata(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              pExpertise.address,
                              style: GoogleFonts.inconsolata(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Competências:',
                              style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: pExpertise.skills.map((skill) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 4.0,
                                    right: 4.0,
                                  ),
                                  child: Text(skill),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 30,
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
