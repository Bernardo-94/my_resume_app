import 'dart:convert';

import 'package:bernardo_cardoso_presentation/firestore/models/certificate.model.dart';
import 'package:bernardo_cardoso_presentation/shared/pdf-page/pdf-page.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificationsTab extends StatefulWidget {
  const CertificationsTab({Key? key}) : super(key: key);

  @override
  State<CertificationsTab> createState() => _CertificationsTabState();
}

class _CertificationsTabState extends State<CertificationsTab> {
  List<CertificateModel> certificates = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String jsonData =
        await rootBundle.loadString('assets/data/certificates.json');
    List<dynamic> decodedData = json.decode(jsonData);

    setState(() {
      certificates =
          decodedData.map((json) => CertificateModel.fromJson(json)).toList();
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
        height: size.height * 0.7,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: certificates.length,
              itemBuilder: (context, index) {
                CertificateModel certificate = certificates[index];
                return certificationCard(certificate, size.width);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget certificationCard(CertificateModel certificate, var width) {
    return GestureDetector(
      child: Card(
        child: SizedBox(
          width: width,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Text(
                certificate.title,
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
            builder: (context) => PdfViewerPage(
              pdfAssetPath: "assets/pdf/${certificate.name}",
            ),
          ),
        );
      },
    );
  }
}
