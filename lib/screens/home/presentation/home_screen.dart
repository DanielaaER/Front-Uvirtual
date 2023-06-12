import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uvirtual/screens/home/presentation/credential_screen.dart';
import 'package:uvirtual/screens/home/presentation/main_screen.dart';
import 'package:uvirtual/screens/sidebar/presentation/side_bar.dart';
import 'package:uvirtual/helpers/estudiante.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _paginaActual = 0;
  bool _isDarkMode = false;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CredentialPage(),
  ];

  void _openDrawer(BuildContext context) {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => _openDrawer(context),
          ),
          actions: [
            CupertinoSwitch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
              activeColor: Colors.lightBlue,
            )
          ],
        ),
        drawer: const SideBar(),
        body: _pages[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Credencial',
            ),
          ],
        ),
      ),
    );
  }
}
