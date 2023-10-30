import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bernardo_cardoso_presentation/shared/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactMeTab extends StatelessWidget {
  const ContactMeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(244, 242, 238, 1),
        padding: const EdgeInsets.only(top: 5.0),
        width: size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Card(
                  child: SizedBox(
                    height: size.height * 0.677,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.3,
                          width: size.width,
                          child: Image.asset(
                            'assets/images/curtindo_o_app.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.35,
                          width: size.width * 0.1,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Text(
                              'OBS.: ',
                              style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              'Gostaríamos de informar que Desing não é o forte desta casa!',
                              style: GoogleFonts.abel(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.3,
              left: size.width * 0.05,
              child: SizedBox(
                width: 150,
                height: 40,
                child: Text(
                  'Gostou e ficou a fim de fazer contato profissional?',
                  style: GoogleFonts.abel(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.34,
              left: size.width * 0.052,
              child: Image.asset(
                'assets/images/seta_1.png',
                width: size.width * 0.22,
                height: size.height * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: size.height * 0.4,
              left: size.width * 0.2,
              child: buildSocialButton(
                icon: FontAwesomeIcons.linkedin,
                color: const Color.fromRGBO(42, 102, 188, 1),
                onClicked: () => share(SocialMedia.linkedin),
              ),
            ),
            Positioned(
              top: size.height * 0.45,
              left: size.width * 0.57,
              child: SizedBox(
                width: 155,
                height: 40,
                child: Text(
                  'Tá a fim de trocar uma ideia ou alguma dica de melhoria?',
                  style: GoogleFonts.abel(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.49,
              left: size.width * 0.63,
              child: Image.asset(
                'assets/images/seta_2.png',
                width: size.width * 0.22,
                height: size.height * 0.1,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: size.height * 0.52,
              left: size.width * 0.45,
              child: buildSocialButton(
                icon: FontAwesomeIcons.instagram,
                color: const Color.fromRGBO(225, 42, 130, 1),
                onClicked: () => share(SocialMedia.instagram),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future share(SocialMedia platform) async {
  final urls = {
    SocialMedia.instagram: (myInstagram),
    SocialMedia.linkedin: (myLinkedin),
  };
  final url = urls[platform]!;
  await launchUrlString(url);
}

enum SocialMedia { instagram, linkedin }

Widget buildSocialButton(
        {required IconData icon,
        Color? color,
        required Function() onClicked}) =>
    InkWell(
      onTap: onClicked,
      child: SizedBox(
        width: 90,
        height: 90,
        child: Center(child: FaIcon(icon, color: color, size: 75)),
      ),
    );
