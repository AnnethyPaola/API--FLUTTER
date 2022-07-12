import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DigimonsView extends StatefulWidget {
  const DigimonsView({Key? key}) : super(key: key);

  @override
  State<DigimonsView> createState() => _DigimonsViewState();
}

class _DigimonsViewState extends State<DigimonsView> {
  List<dynamic> digimons = [];
  bool cargando = true;

  @override
  void initState() {
    _cargarDigimons();
    super.initState();
  }

  void _cargarDigimons() async {
    final response = await http
        .get(Uri.parse("https://digimon-api.herokuapp.com/api/digimon"));
    if (response.statusCode == 200) {
      digimons = jsonDecode(response.body);
    }
    cargando = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          "Digimons",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: cargando ? _showLoading() : _digimonsList(),
    );
  }

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget _digimonsList() {
    return ListView.builder(
      itemCount: digimons.length,
      itemBuilder: (BuildContext context, int index) {
        final item = digimons[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item['img']),
          ),
          title: Text(
            item['name'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _DigimonDetail(
                  digimon: item,
                );
              },
            );
          },
        );
      },
    );
  }
}

class _DigimonDetail extends StatelessWidget {
  const _DigimonDetail({
    Key? key,
    required this.digimon,
  }) : super(key: key);
  final dynamic digimon;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Detalles',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  splashRadius: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(digimon['img']),
              ),
              title: Text(
                digimon['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                digimon['level'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
