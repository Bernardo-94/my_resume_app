import 'dart:convert';

import 'package:bernardo_cardoso_presentation/firestore/models/zipcode.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ZipCodeSearchView extends StatefulWidget {
  const ZipCodeSearchView({super.key});

  @override
  State<ZipCodeSearchView> createState() => _ZipCodeSearchViewState();
}

class _ZipCodeSearchViewState extends State<ZipCodeSearchView> {
  TextEditingController cepController = TextEditingController();
  ZipCodeModel? address;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(244, 242, 238, 1),
          padding: const EdgeInsets.only(top: 5.0),
          width: size.width,
          height: size.height * 0.99,
          child: Column(
            children: [
              SizedBox(
                height: size.height > 340 ? 220 : size.height * 0.5,
                width: size.width > 350 ? 350 : size.width,
                child: Image.asset(
                  'assets/images/search_map.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: size.width * 0.5,
                        child: TextField(
                          controller: cepController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            hintText: 'Digite o Cep',
                          ),
                        )),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          searchCep(cepController.text);
                        });
                      },
                      child: const Text('Buscar'),
                    ),
                  ],
                ),
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : address != null
                      ? Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'CEP: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    address!.zipCode,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Logradouro: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    address!.street,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Bairro: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    address!.district,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Cidade: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${address!.city} / ${address!.uf}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> searchCep(String cep) async {
    setState(() {
      isLoading = true;
    });

    try {
      var response =
          await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          address = ZipCodeModel.fromJson(data);
        });
      } else {
        setState(() {
          address = null;
        });
        if (kDebugMode) {
          print('Erro ao buscar CEP: ${response.statusCode}');
        }
      }
    } catch (e) {
      setState(() {
        address = null;
      });
      if (kDebugMode) {
        print('Erro: $e');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
