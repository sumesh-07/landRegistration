import 'package:flutter/material.dart';
import 'package:land_registration/widget/header.dart';
import 'package:land_registration/widget/homePageDecription.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant/utils.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  bool isHeaderVisible = true; // Track the visibility of the header

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    if (width > 600) {
      width = 590;
      isDesktop = true;
      return _buildDesktopLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/logo_landRege.png', height: 40),
            const SizedBox(width: 10),
            const Text('Land Registration on Blockchain'),
          ],
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 118, 161, 225), // Dark blue background color
        child: Row(
          children: [
            _buildSidebar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: HeaderWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 150.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Expanded(
                            child: LeftDescription(),
                          ),
                          Expanded(
                            child: Container(
                              height: 804,
                              child: SvgPicture.asset(
                                'assets/background_svg.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomAnimatedContainer('Land Inspector', () {
                          Navigator.of(context)
                              .pushNamed('/login', arguments: "LandInspector");
                        }),
                        CustomAnimatedContainer('User', () {
                          Navigator.of(context)
                              .pushNamed('/login', arguments: "UserLogin");
                        }),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: Colors.blue.shade800,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/logo_landRege.png', height: 80),
                const SizedBox(height: 10),
                const Text(
                  'Government Portal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.white),
            title: const Text('Land Inspector',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/login', arguments: "LandInspector");
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text('User', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushNamed('/login', arguments: "UserLogin");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title:
                const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Land Registration on Blockchain'),
        backgroundColor: Colors.blue.shade900,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/logo_landRege.png', height: 80),
                  const SizedBox(height: 10),
                  const Text(
                    'Government Portal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.black),
              title: const Text('Land Inspector'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/login', arguments: "LandInspector");
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('User'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/login', arguments: "UserLogin");
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.blue.shade900, // Dark blue background color
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: HeaderWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    LeftDescription(),
                    SvgPicture.asset(
                      'assets/background_svg.svg',
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.contain,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomAnimatedContainer('Land Inspector', () {
                Navigator.of(context)
                    .pushNamed('/login', arguments: "LandInspector");
              }),
              CustomAnimatedContainer('User', () {
                Navigator.of(context)
                    .pushNamed('/login', arguments: "UserLogin");
              }),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomAnimatedContainer(this.text, this.onTap, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.blue.shade700,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
