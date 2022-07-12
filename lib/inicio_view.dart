import 'package:flutter/material.dart';
import 'package:tarea6/acerca_de_view.dart';
import 'package:tarea6/digimons_view.dart';

class InicioView extends StatefulWidget {
  const InicioView({Key? key}) : super(key: key);

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          DigimonsView(),
          AcercaDeView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 3,
        child: BottomNavigationBar(
          selectedItemColor: Colors.pink,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeIn,
            );
            currentIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Acerca de',
            ),
          ],
        ),
      ),
    );
  }
}
