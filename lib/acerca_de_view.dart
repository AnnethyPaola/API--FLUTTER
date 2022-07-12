import 'package:flutter/material.dart';

class AcercaDeView extends StatelessWidget {
  const AcercaDeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: const Text(
          'En mi vida',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _imageContainer(),
            const SizedBox(
              height: 20.0,
            ),
            const Text('Información Personal'),
            const SizedBox(
              height: 20.0,
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Annethy Paola Javier Montero'),
            ),
            const ListTile(
              leading: Icon(Icons.library_books),
              title: Text('202010518'),
            ),
            const ListTile(
              leading: Icon(Icons.alternate_email_rounded),
              title: Text('annethy25@gmail.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('809-436-1300'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageContainer() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 200,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Image.asset(
            'assets/foto2x2.jpg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
