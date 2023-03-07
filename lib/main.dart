import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:provider/provider.dart'; // new

import 'firebase_options.dart'; // new
import 'src/authentication.dart'; // new
import 'dart:async'; // new

import 'package:cloud_firestore/cloud_firestore.dart'; // new

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => App(),
    ),
  );
}

class GuestBookMessage {
  GuestBookMessage({required this.name, required this.message});
  final String name;
  final String message;
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safety & Health Guarantee Hotel Booking',
      theme: ThemeData(
        buttonTheme:
            Theme.of(context).buttonTheme.copyWith(highlightColor: Colors.blue),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety & Health Guarantee Hotel Booking'),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      child: Image.asset(
                    'images/sha.png',
                    width: 100,
                    height: 100,
                  )),
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'SHA',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      child: Image.asset(
                    'images/shaplus.png',
                    width: 135,
                    height: 135,
                  )),
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'SHA PLUS',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      child: Image.asset(
                    'images/shaextraplus.png',
                    width: 135,
                    height: 135,
                  )),
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'SHA EXTRA PLUS',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
            ],
          ),
          // Modify from here
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.login),
                          label: const Text('Enter to website'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondRoute()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // To here
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety & Health Guarantee Hotel Booking'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.home),
                          label: const Text('Home'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShaHomepageScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.send),
                          label: const Text('Send Hotel information'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HotelInformationRegistration()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.account_balance),
                          label: const Text('About us'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutusScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.phone),
                          label: const Text('Developer contact'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DevelopercontactScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShaHomepageScreen extends StatelessWidget {
  const ShaHomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                        appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShalistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shabangkok01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('The Service Residence Co.,Ltd.',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              ' Bangkok',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaHomepageDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShalistDropdown extends StatefulWidget {
  const ShalistDropdown({Key? key}) : super(key: key);

  @override
  _ShalistDropdownState createState() => _ShalistDropdownState();
}

class _ShalistDropdownState extends State<ShalistDropdown> {
  final items = [
    'Bangkok',
    'Chonburi Province',
    'Nakhon Pathom Province',
    'Nonthaburi Province',
    'Pathum Thani Province',
    'Samut Prakan Province',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Colors.white),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    switch (value) {
                      case 'Bangkok':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShaHomepageScreen()),
                        );
                        break;
                      case 'Chonburi Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaChonburiProvince()),
                        );
                        break;
                      case 'Nakhon Pathom Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaNakhonPathomProvince()),
                        );
                        break;
                      case 'Nonthaburi Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaNonthaburiProvince()),
                        );
                        break;
                      case 'Pathum Thani Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaPathumThaniProvince()),
                        );
                        break;
                      case 'Samut Prakan Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaSamutPrakanProvince()),
                        );
                        break;
                    }
                  },
                  hint: const Text('Select Province'),
                ),
              )),
        ),
      ],
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );

class ShaHomepageDetail01 extends StatelessWidget {
  const ShaHomepageDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The Service Residence Co.,Ltd.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Bangkok',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaHomepage01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, ' 0863418115'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Bangkok'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6868'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'To improve the quality of urban life to be livable.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 15/1-9 Paholyothin 30 Alley , Paholyothin Rd. Chan Kasem Chatuchak Bangkok 10900'),
                Text('Call: 0863418115'),
                Text('Website: www.senahouse.com'),
                Text('E-mail: senahousep30@hotmail.com'),
                Text('Access time: Daily 07.00-20.00'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Standard',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30-31 sq.m.'),
                Text('Room information: Room with 1 king-size bed or 2 twin beds, 1 bathroom (shower only with water heater) pantry, work station and balcony.'),
                Text('Price: 28 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 31 sq.m.'),
                Text('Room information: Room with 1 king-size bed and 1 twin-size beds, 1 bathroom (shower only with water heater) specious living area, dining area, pantry, work station and balcony.'),
                Text('Price: 38 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 35-37 sq.m.'),
                Text('Room information: Room with 1 king-size bed or 2 twin beds, 1 bathroom (shower or bathtub with water heater) specious living area, separate pantry, all purpose table and balcony.'),
                Text('Price: 44 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Super Deluxe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 40 sq.m.'),
                Text('Room information: Room with 3 twin beds, 1 bathroom (shower or bathtub with water heater) specious living area, separate pantry, all purpose table and balcony.'),
                Text('Price: 62 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '1 Bedroom Suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 46-51 sq.m.'),
                Text('Room information: Finest room with1 master bedroom and luxury living area, 1 bathroom (shower or bathtub with water heater) specious living area, separate kitchen, dining area, and balcony.'),
                Text('Price: 75 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_8 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '2 Bedroom Suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 66 sq.m.'),
                Text('Room information: Family room with 2 bedrooms (master bedroom with en-suite bahtroom) luxury living area, 2nd bathroom (bathtub with water heater) specious living area, separate kitchen, dining area, and balcony.'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shabangkok01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/sha.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shabangkok01-Standard.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shabangkok01-Superior.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shabangkok01-Deluxe.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shabangkok01-Super-Deluxe.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shabangkok01-1-Bedroom-Suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_7,
                Image.asset('images/shabangkok01-2-Bedroom-Suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_8,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaHomepage01Favoritewidget extends StatefulWidget {
  const _ShaHomepage01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaHomepage01FavoritewidgetState createState() =>
      __ShaHomepage01FavoritewidgetState();
}

class __ShaHomepage01FavoritewidgetState
    extends State<_ShaHomepage01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaChonburiProvince extends StatelessWidget {
  const ShaChonburiProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShalistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shachonburi01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Mike garden resort hotel',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              ' Chonburi',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                       Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaChonburiDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShaChonburiDetail01 extends StatelessWidget {
  const ShaChonburiDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mike garden resort',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Chonburi',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaChonburi01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '038416622'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Chonburi'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6835'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Mike garden is a wonderful garden resort location in the middle of pattaya city.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 221/71-72 m.6 pattaya soi sam road Na Kluea Bang Lamung Chon Buri 20150'),
                Text('Call: 038416622'),
                Text('Website: www.mikegardenresort.com'),
                Text('E-mail: info@mikeresortpattaya.com'),
                Text('Access time: Monday-Sunday 24 horus'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 42 sq.m.'),
                Text('Bed type: Two single beds'),
                Text('Room information: 42 square metres with two single bed to give a guest the best comfortable solution of staying, combination with a wide range of facilities including television, private balcony both pool view and garden view, shower and bathtub in the bathroom are separated as well as Private safety box. The luxurious, elegance and unique room decorated to complete your wonderful holidays.'),
                Text('Price: 110 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 60 sq.m.'),
                Text('Bed type: One double bed and one single bed'),
                Text('Room information: 60 square metres with one double bed and one single bed, Air-Conditioning, Cable TV, Telephone, Personal Safety box as well as with bathtub and shower in bathroom are separated.'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Executive suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 65 sq.m.'),
                Text('Bed type: Double bed'),
                Text('Room information: 65 square metres with Double bed to give a guest the best comfortable solution of staying, combination with a wide range of facilities including television, private balcony both pool view and garden view, shower and bathtub in the bathroom are separated as well as Private safety box.'),
                Text('Price: 160 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Family suite room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 120 sq.m.'),
                Text('Bed type: 2 Double Beds'),
                Text('Room information: Room size 120 square metres have 2 bedrooms, 2 bathrooms and one living room including the private wide balcony, full equipped such as Individual Air-Conditioning, Cable Color TV in the bedroom and living room as well as individual personal safety box,the bathtub and the shower in the bathroom are separated.'),
                Text('Price: 200 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Hotel'),
            ),
            body: ListView(
              children: [
                 Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shachonburi01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/sha.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shachonburi01-Superior.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shachonburi01-Deluxe.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shachonburi01-ExecutiveSuite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shachonburi01-FamilySuiteRoom.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
               Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaChonburi01Favoritewidget extends StatefulWidget {
  const _ShaChonburi01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaChonburi01FavoritewidgetState createState() =>
      __ShaChonburi01FavoritewidgetState();
}

class __ShaChonburi01FavoritewidgetState
    extends State<_ShaChonburi01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaNakhonPathomProvince extends StatelessWidget {
  const ShaNakhonPathomProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                  Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShalistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shanakhonpathom01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Whale hotel',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              ' Nakhon Pathom',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaNakhonparhomDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShaNakhonparhomDetail01 extends StatelessWidget {
  const ShaNakhonparhomDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Whale hotel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nakhon Pathom',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaNakhonparhomDetail01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, ' 0949250101'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Nakhon Pathom'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6304'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Complete whale.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: Whale hotel Phra Pathom Chedi Mueang Nakhon Pathom Nakhon Pathom 73000'),
                Text('Call: 0949250101'),
                Text('Website: www.whale.co.th'),
                Text('E-mail: whale_hotel@hotmail.com'),
                Text('Access time: 00.01-23.59'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Standard room - 2 beds',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Two single beds'),
                Text('Price: 13 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Standard room - King size bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: King size bed'),
                Text('Price: 22 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'VIP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 65 sq.m.'),
                Text('Bed type: 1 Big bed and 1 small bed'),
                Text('Price: 32 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Suite room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Room detail: 2 bedrooms, 1 bathroom and 1 living room.'),
                Text('Price: 38 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shanakhonpathom01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/sha.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shanakhonpathom01-Standard-Twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shanakhonpathom01-Standard.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shanakhonpathom01-VIP.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shanakhonpathom01-Suite-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaNakhonparhomDetail01Favoritewidget extends StatefulWidget {
  const _ShaNakhonparhomDetail01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaNakhonparhomDetail01FavoritewidgetState createState() =>
      __ShaNakhonparhomDetail01FavoritewidgetState();
}

class __ShaNakhonparhomDetail01FavoritewidgetState
    extends State<_ShaNakhonparhomDetail01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaNonthaburiProvince extends StatelessWidget {
  const ShaNonthaburiProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShalistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shanonthaburi01.jpeg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Grand Ratchapruek Hotel',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              ' Chonburi',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaNonthaburiDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaNonthaburiDetail01 extends StatelessWidget {
  const ShaNonthaburiDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Grand Ratchapruek Hotel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nonthaburi',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaNonthaburi01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '021954455'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Nonthaburi'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B5948'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Grand Ratchapruek Hotel is located in Ratchapruek Road (pakkret area), which is connected from Bangkok passing our area pakkret, Nonthaburi to Patumthani and Ayutthaya. Around 20 mins to Don Mueang international airport and about 10-15 mins to express ways and to Chaengwattana Government Center. We provide Ratchapruek Grand Ballroom for seminar, meeting rooms, and also for events and weddings. Suite, triple, deluxe, and superior rooms types are provided for accommodations. We also have a Thai restaurant, Ratchapruek Cuisine and @345 cafe’ for breakfast and all day dining.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 55/55 M.2 Bang Phlap Pak Kret Nonthaburi 11120'),
                Text('Call: 021954455'),
                Text('Website: www.grandratchapruek.com'),
                Text('E-mail: info@grandratchapruek.com'),
                Text('Access time: 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Room rates are net inclusive of 10% service charge and 7% VAT'),
                Text('Price: 59 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: Single bed'),
                Text('Room detail: Room rates are net inclusive of 10% service charge and 7% VAT'),
                Text('Price: 59 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 46 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room detail: Room rates are net inclusive of 10% service charge and 7% VAT'),
                Text('Price: 59 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Single bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 46 sq.m.'),
                Text('Bed type: Single bed'),
                Text('Room detail: Room rates are net inclusive of 10% service charge and 7% VAT'),
                Text('Price: 59 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Triple Room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 46 sq.m.'),
                Text('Bed type: Single bed'),
                Text('Room detail: Room rates are net inclusive of 10% service charge and 7% VAT'),
                Text('Price: 94 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_8 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Suite room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 58 sq.m.'),
                Text('Bed type: Single bed'),
                Text('Room detail: Room rates are net inclusive of 10% service charge and 7% VAT'),
                Text('Price: 140 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Hotel'),
            ),
            body: ListView(
              children: [
                 Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shanonthaburi01.jpeg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/sha.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shanonthaburi01-Superior-Twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shanonthaburi01-Superior-Singlebed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shanonthaburi01-Deluxe-Twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shanonthaburi01-Deluxe-Singlebed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shanonthaburi01-Tripleroom.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_7,
                Image.asset('images/shanonthaburi01-Suiteroom.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_8,
                 Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                          MaterialPageRoute(
                                            builder: (context) => const ContactHotel()
                                            ),
                                          );
                                        },
                      child: const Text('Contact hotel')),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaNonthaburi01Favoritewidget extends StatefulWidget {
  const _ShaNonthaburi01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaNonthaburi01FavoritewidgetState createState() =>
      __ShaNonthaburi01FavoritewidgetState();
}

class __ShaNonthaburi01FavoritewidgetState
    extends State<_ShaNonthaburi01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaPathumThaniProvince extends StatelessWidget {
  const ShaPathumThaniProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShalistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shapathumthani01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('iResidHotel',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Pathum Thani',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaPathumthaniDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}

class ShaPathumthaniDetail01 extends StatelessWidget {
  const ShaPathumthaniDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'iResidHotel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Pathum Thani',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaPathumthani01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '0900526666'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Pathum Thani'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6084'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The perfect balance of relaxation in the business district next to the Thai market with iResidence Hotel with complete facilities that match your lifestyle 24 hours a day.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 91/201 Moo 9 Klongnueng Klongluang Pathumthani Khlong Nueng Khlong Luang Pathum Thani 12120'),
                Text('Call: 0900526666'),
                Text('Website: www.iresidencepathumthani.com/'),
                Text('E-mail: hotel.iresidence@gmail.com'),
                Text('Access time: Monday-Sunday 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Standard',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 32 sq.m.'),
                Text('Bed type: Queen size'),
                Text('Price: 40 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 32 sq.m.'),
                Text('Bed type: Queen size'),
                Text('Price: 50 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Hotel'),
            ),
            body: ListView(
              children: [
                 Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shapathumthani01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/sha.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shapathumtani01-standard.png',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shapathumthani01-deluxe.png',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
         ],
       )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaPathumthani01Favoritewidget extends StatefulWidget {
  const _ShaPathumthani01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaPathumthani01FavoritewidgetState createState() =>
      __ShaPathumthani01FavoritewidgetState();
}

class __ShaPathumthani01FavoritewidgetState
    extends State<_ShaPathumthani01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaSamutPrakanProvince extends StatelessWidget {
  const ShaSamutPrakanProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShalistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shasamutprakan01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('The color Living Hotel',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Samut Prakan',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaSamutprakanDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShaSamutprakanDetail01 extends StatelessWidget {
  const ShaSamutprakanDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The color Living Hotel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Samut Prakan',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaSamutprakan01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '027596565'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Samut Prakan'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6195'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The hotel 4 stars are near Factory industry and Tourist Attraction in Samutprakarn Convenience to travel by bus and sky train Samrong station in 15 minutes Impression staff service 4 stars standard.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 2222 Moo7 Teparak, Muang, Samutprakarn Thepharak Mueang Samut Prakan Samut Prakarn 10270'),
                Text('Call: 027596565'),
                Text('Website: www.thecolorlivinghotel.com'),
                Text('E-mail: om.colorliving@gmail.com'),
                Text('Access time: Monday-Sunday 00.00-23.59'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Price: 70 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Single bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Single bed'),
                Text('Price: 80 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Grand deluxe room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Price: 90 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Grand deluxe room - Sigle bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Single bed'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Suite room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Single bed'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shasamutprakan01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/sha.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shasamutprakan01-deluxe-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shasamutprakan01-deluxe-singlebed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shasamutprakan01-granddeluxe-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shasamutprakan01-granddeluxe-singlebed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shasamutprakan01-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_7,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaSamutprakan01Favoritewidget extends StatefulWidget {
  const _ShaSamutprakan01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaSamutprakan01FavoritewidgetState createState() =>
      __ShaSamutprakan01FavoritewidgetState();
}

class __ShaSamutprakan01FavoritewidgetState
    extends State<_ShaSamutprakan01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaPlusHomepageScreen extends StatelessWidget {
  const ShaPlusHomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shaplusbangkok01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('ELEGANT AIRPORT HOTEL',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Bangkok',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaPlusHomepageDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaPluslistDropdown extends StatefulWidget {
  const ShaPluslistDropdown({Key? key}) : super(key: key);

  @override
  _ShaPluslistDropdownState createState() => _ShaPluslistDropdownState();
}

class _ShaPluslistDropdownState extends State<ShaPluslistDropdown> {
  final items = [
    'Bangkok',
    'Chonburi Province',
    'Nakhon Pathom Province',
    'Nonthaburi Province',
    'Pathum Thani Province',
    'Samut Prakan Province',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Colors.white),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    switch (value) {
                      case 'Bangkok':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaPlusHomepageScreen()),
                        );
                        break;
                      case 'Chonburi Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaPlusChonburiProvince()),
                        );
                        break;
                      case 'Nakhon Pathom Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaPlusNakhonPathomProvince()),
                        );
                        break;
                      case 'Nonthaburi Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaPlusNonthaburiProvince()),
                        );
                        break;
                      case 'Pathum Thani Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaPlusPathumThaniProvince()),
                        );
                        break;
                      case 'Samut Prakan Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaPlusSamutPrakanProvince()),
                        );
                        break;
                    }
                  },
                  hint: const Text('Select Province'),
                ),
              )),
        ),
      ],
    );
  }
}

class ShaPlusHomepageDetail01 extends StatelessWidget {
  const ShaPlusHomepageDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ELEGANT AIRPORT HOTEL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Bangkok',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaPlusHomepage01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '021469998'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Bangkok'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6676'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The Newly built A-One Star Hotel smartly balances eclectic details with '
        'cozy public spaces that are both playfully cosmopolitan while sleek and '
        'elegant, all while colorfully echtoing the ambience of Pattaya’s nightlife. '
        'Our brightly lit rooms with sharp designs are fashioned for a young and '
        'modern crowd. A-One Star Hotel is a taste of young and radiant urban '
        'sophistication, offering momentary beachfront access. Conveniently '
        'located in North Pattaya, it is a popular choice for young beachgoers, and '
        'backpackers, and all at attractively reasonable rates. Guests are welcome '
        'to use the facilities of the adjoining, A-One the Royal Cruise Hotel; '
        'featuring a selection of savory restaurants, picturesque swimming pools '
        'and a fully-equipped Gym.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 121/1 Kanchanaphisek Road,Prawat District,Bangkok 10250 THAILAND Prawet Prawet Bangkok 10250'),
                Text('Call: 021469998'),
                Text('Website: https://elegantairporthotel.com/'),
                Text('E-mail: rsvn@theelegantbangkokhotel.com'),
                Text('Access time: 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: King size bed or 4 ft Twin bed'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 25 sq.m.'),
                Text('Bed type: King size bed or 4 ft Twin bed'),
                Text('Price: 120 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'One bedroom suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 70 sq.m.'),
                Text('Bed type: King size bed'),
                Text('Room information: 1 bed room and 1 living room'),
                Text('Price: 170 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaplusbangkok01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaplusbangkok01-Deluxe-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaplusbangkok01-Superior-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaplusbangkok01-One-bedroom-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaPlusHomepage01Favoritewidget extends StatefulWidget {
  const _ShaPlusHomepage01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaPlusHomepage01FavoritewidgetState createState() =>
      __ShaPlusHomepage01FavoritewidgetState();
}

class __ShaPlusHomepage01FavoritewidgetState
    extends State<_ShaPlusHomepage01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaPlusChonburiProvince extends StatelessWidget {
  const ShaPlusChonburiProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shapluschonburi01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('A-One Star Pattaya, Head Office',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              ' Chonburi',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                       Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaPlusChonburiDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaPlusChonburiDetail01 extends StatelessWidget {
  const ShaPlusChonburiDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'A-One Star Pattaya, Head office',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Chonburi',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaPlusChonburi01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '038259511'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Chonburi'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6693'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The Newly built A-One Star Hotel smartly balances eclectic details with '
        'cozy public spaces that are both playfully cosmopolitan while sleek and '
        'elegant, all while colorfully echtoing the ambience of Pattaya’s nightlife. '
        'Our brightly lit rooms with sharp designs are fashioned for a young and '
        'modern crowd. A-One Star Hotel is a taste of young and radiant urban '
        'sophistication, offering momentary beachfront access. Conveniently '
        'located in North Pattaya, it is a popular choice for young beachgoers, and '
        'backpackers, and all at attractively reasonable rates. Guests are welcome '
        'to use the facilities of the adjoining, A-One the Royal Cruise Hotel; '
        'featuring a selection of savory restaurants, picturesque swimming pools '
        'and a fully-equipped Gym.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 115/11-12 Beach Road North Pattaya Soi 3 Nong Prue Bang Lamung Chon Buri 20150'),
                Text('Call: 038259511'),
                Text('Website: www.a-onestarhotel.com'),
                Text('E-mail: starinfo@a-onehotel.com'),
                Text('Access time: Everyday Sunday - Monday 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Star room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 17 sq.m.'),
                Text('Bed type: Twin or Double'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior star room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 18 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Super star room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 25 sq.m.'),
                Text('Bed type: Double bed'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Super star room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 28 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Super star balcony family room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 28 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shapluschonburi01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shpchonburi01R01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shpchonburi01R02.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shpchonburi01R03.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shpchonburi01R04.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shpchonburi01R05.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_7,
               Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaPlusChonburi01Favoritewidget extends StatefulWidget {
  const _ShaPlusChonburi01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaPlusChonburi01FavoritewidgetState createState() =>
      __ShaPlusChonburi01FavoritewidgetState();
}

class __ShaPlusChonburi01FavoritewidgetState
    extends State<_ShaPlusChonburi01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaPlusNakhonPathomProvince extends StatelessWidget {
  const ShaPlusNakhonPathomProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shaplusnakhonpathom01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Mida Grande Hotel Dhavaravati Nakhon Pathom',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Nakhon Pathom',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                       Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaPlusNakhonpathomDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaPlusNakhonpathomDetail01 extends StatelessWidget {
  const ShaPlusNakhonpathomDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mida Grande Hotel Dhavaravati Nakhon Pathom',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nakhon Pathom',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaPlusNakhonpathom01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '034966700'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Nakhon Pathom'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID : B0959'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Experience the ultimate luxury hotel in the city center of Nakhon Pathom with a rich contemporary decor influenced by the arts of Dhavaravati. Our function rooms and ballroom can be accommodated over 1,000 guests, fully equiped wiht all the modern technical requirements, state-of-the-art audio-visual technology, vdo conferencing capabilities. The dining experience "Sky Bar" brings you for a panaromic 360 degree view overlook of the surrounded ancient city of Nakhon Pathom.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 711 Petchkasem Road Huai Chorakhe Mueang Nakhon Pathom Nakhon Pathom 73000'),
                Text('Call: 034966700'),
                Text('Website: www.midagrandehoteldhavaravati.com'),
                Text('E-mail: info_mgnp@midahotelsandresorts.com'),
                Text('Access time: Monday-Sunday 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 42 sq.m.'),
                Text('Bed type: Two single bed'),
                Text('Room information: 42 square metres with two single bed to give a guest the best comfortable solution of staying, combination with a wide range of facilities including television, private balcony both pool view and garden view, shower and bathtub in the bathroom are separated as well as Private safety box. The luxurious, elegance and unique room decorated to complete your wonderful holidays.'),
                Text('Price: 110 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30 sq.m.'),
                Text('Bed type: Twin or King bed'),
                Text('Room information: With a rich contemporary dector infuenced by the arts of Dhavaravati, our 30 square metre deluxe rooms offer a very breath-taking view in the arms of the very beautiful Nakhon Pathom City and the sense of luxury with our comfortable.'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe pool view room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Enjoy a very relaxing view beside our traditional style of swimming pool wuth a rich contemporary decor influenced by the art of Dhavaravati, our 30 squre metre Pool View rooms offer the sense of luxury. All Pool view rooms are available choice of single or twin bed.'),
                Text('Price: 110 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Executive suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 56 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Enjoy 56 square metre of design space. The stylish bedroom offers the adjacent living area comprises a sofa and offering a contemporary in-room smart work-station. Most of our guests are addicited to see pagoda view from living area in the Executive Suite.'),
                Text('Price: 200 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dhavaravati suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 84 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Relax in style in our 84 square meters one bedroom suite. The Royal Suite offers an extraordinary experience with a breathtaking view of the city. It also features a private balcony. This room is attractive to view Phra Pathom Chedi.'),
                Text('Price: 225 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaplusnakhonpathom01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaplusnakhonpathom01-deluxe.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaplusnakhonpathom01-deluxewithpool.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaplusnakhonpathom01-deluxechedi.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shaplusnakhonpathom01-executivesuite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shaplusnakhonpathom01-dhavaravatisuite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_7,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaPlusNakhonpathom01Favoritewidget extends StatefulWidget {
  const _ShaPlusNakhonpathom01Favoritewidget({Key? key}) : super(key: key);

  @override
  ___ShaPlusNakhonpathom01FavoritewidgetState createState() =>
      ___ShaPlusNakhonpathom01FavoritewidgetState();
}

class ___ShaPlusNakhonpathom01FavoritewidgetState
    extends State<_ShaPlusNakhonpathom01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaPlusNonthaburiProvince extends StatelessWidget {
  const ShaPlusNonthaburiProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shaplusnonthaburi01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('ibis Bangkok IMPACT',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Nonthaburi',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                       Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaPlusNonthaburiDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaPlusNonthaburiDetail01 extends StatelessWidget {
  const ShaPlusNonthaburiDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ibis Bangkok IMPACT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nonthaburi',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaPlusNonthaburi01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '020117777'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Nonthaburi'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B1353'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'ibis Bangkok IMPACT is located at the heart of IMPACT Exhibition and Convention Centre. Featuring a 24 hour bar, all day dining restaurant and round the clock reception, ibis Bangkok IMPACT offers comfort at the best price for business and leisure travellers.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 93 Popular Road Ban Mai Pak Kret Nonthaburi 11120'),
                Text('Call: 020117777'),
                Text('Website: www.ibisbangkokimpact.com'),
                Text('E-mail: H9060@accor.com'),
                Text('Access time: Monday-Sunday for 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Standard twin room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Room detail: The Standard Twin Rooms at IBIS Bangkok IMPACT are perfect for sharing and can comfortably accommodate 2 people. All rooms are soundproof for the best night’s rest after a busy day of conferencing at IMPACT. The rooms have a modular desk, a 32-inch flat-screen LED TVs, bathroom with head to toe amenity, minibar fridge and in-room safe. Complimentary WIFI access is available in all rooms and throughout the hotel.'),
                Text('Price: 85 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Standard queen room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Queen size bed'),
                Text('Room information: All IBIS Bangkok IMPACT Standard Queen Rooms are soundproof with a modular desk, a 32-inch flat-screen LED TVs, bathroom with head to toe amenity. Offering coffee and tea service and complimentary water, a minibar fridge and in-room safe, this room ensures blissful sleep after busy IMPACT events. Complimentary WIFI access is available in all rooms and throughout the hotel.'),
                Text('Price: 95 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Plus Hotel'),
            ),
            body: ListView(
              children: [
                 Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaplusnonthaburi01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaplusnonthaburi01-standdard-twin-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaplusnonthaburi01-standdard-queen-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaPlusNonthaburi01Favoritewidget extends StatefulWidget {
  const _ShaPlusNonthaburi01Favoritewidget({Key? key}) : super(key: key);

  @override
  ___ShaPlusNonthaburi01FavoritewidgetState createState() =>
      ___ShaPlusNonthaburi01FavoritewidgetState();
}

class ___ShaPlusNonthaburi01FavoritewidgetState
    extends State<_ShaPlusNonthaburi01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaPlusPathumThaniProvince extends StatelessWidget {
  const ShaPlusPathumThaniProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shapluspathumthani01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('ASIA AIRPORT HOTEL',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Pathum Thani',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaPlusPathumthaniDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShaPlusPathumthaniDetail01 extends StatelessWidget {
  const ShaPlusPathumthaniDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ASIA AIRPORT HOTEL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Pathum Thani',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaPlusPathumthani01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '029926999'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Pathum Thani'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B1341'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Asia Airport Hotel Located in a situated 3 kms north of the former Bangkok domestic and international airport (Don Muang Airport). The Asia airport hotel offers convenience and relaxation all at great value to business travelers and tourists. All 402 fully-equipped accommodations and suites, stay on top of the Zeer shopping complex. Our Hotel is cozy comfort with thoughtful amenities and spacious interiors with no noises from the airport .Ideal for stopover, transit or the first and last night of a trip.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 99/2 Moo.8 Phaholyothin Road, Khu Khot Lam Luk Ka Pathum Thani 12130'),
                Text('Call: 029926999'),
                Text('Website: www.asiahotel.co.th/asia_airport'),
                Text('E-mail: airport@asiahotel.co.th'),
                Text('Access time: 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Triple room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: 3 Small beds'),
                Text('Room information: Spacious rooms elegantly designed. Tastefully decorated, modern bathroom standards. Additional mini-bar, tea / coffee maker, LCD TV large increase. For your comfort.'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Room information: Spacious rooms elegantly designed. Tastefully decorated, modern bathroom standards. Additional mini-bar, tea / coffee maker, LCD TV large increase. For your comfort.'),
                Text('Price: 140U SD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Single bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Single bed'),
                Text('Room information: Spacious rooms elegantly designed. Tastefully decorated, modern bathroom standards. Additional mini-bar, tea / coffee maker, LCD TV large increase. For your comfort.'),
                Text('Price: 140U SD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Executive room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Room information: 160 Rooms Spacious rooms elegantly designed. Tastefully decorated, modern bathroom standards. Additional mini-bar, tea / coffee maker, LCD TV large increase. For your comfort.'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Executive room - Single bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Single bed'),
                Text('Room information: 160 Rooms Spacious rooms elegantly designed. Tastefully decorated, modern bathroom standards. Additional mini-bar, tea / coffee maker, LCD TV large increase. For your comfort.'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_8 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Premier room - Single bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Single bed'),
                Text('Room information: Spacious rooms elegantly designed. Tastefully decorated, modern bathroom standards. Additional mini-bar, tea / coffee maker, LCD TV large increase. For your comfort.'),
                Text('Price: 170 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_9 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Asia suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Single bed'),
                Text('Room information: Spacious rooms elegantly designed. Tastefully decorated, modern bathroom standards. Additional mini-bar, tea / coffee maker, LCD TV large increase. For your comfort.'),
                Text('Price: 180 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_10 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Studio room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: he 30 sq.m. Studio Room are all double bed rooms. Our room spacious and efficient decorated  in modern style. Fully range of linens and towels.'),
                Text('Price: 225 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shapluspathumthani01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shapluspathumthani01-triple-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shapluspathumthani01-superior-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shapluspathumthani01-superior-singlebed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shapluspathumthani-executive-room-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shapluspathumthani-executive-room-singlebed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_7,
                Image.asset('images/shapluspathumthani01-premier-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_8,
                Image.asset('images/shapluspathumthani01-asia-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_9,
                Image.asset('images/shapluspathumthani01-studio-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_10,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaPlusPathumthani01Favoritewidget extends StatefulWidget {
  const _ShaPlusPathumthani01Favoritewidget({Key? key}) : super(key: key);

  @override
  ___ShaPlusPathumthani01FavoritewidgetState createState() =>
      ___ShaPlusPathumthani01FavoritewidgetState();
}

class ___ShaPlusPathumthani01FavoritewidgetState
    extends State<_ShaPlusPathumthani01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaPlusSamutPrakanProvince extends StatelessWidget {
  const ShaPlusSamutPrakanProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shaplussamutprakan01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('The Leisure Residence',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Samut Prakan',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                       Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaPlusSamutprakanDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShaPlusSamutprakanDetail01 extends StatelessWidget {
  const ShaPlusSamutprakanDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The Leisure Residence',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Samut Prakan',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaPlusSamutprakan01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '0886937147'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Samut Prakan'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B5235'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Luxury accommodation nearby Suvarnabhumi Airport International just 20 minutes close to Bangna-Chonburi Expressway connect to scenic place like Eastern region and easy to Bangkok sightseeing place.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 195 Moo 7 T.Bang Bo Bang Bo District ,Samutprakan 10560 Bang Bo Bang Bo Samut Prakarn 10560'),
                Text('Call: 0886937147'),
                Text('Website: www.theleisurehotel.com'),
                Text('E-mail: rsvn@theleisurehotel.com'),
                Text('Access time: Monday-Sunday 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 32 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Room size 32 Sq.m with twin bed room, 40” T.V with satellite channels, Private balcony, Air conditioner, Telephone, Digital clock, Refrigerator, Complimentary 2 bottled of water, Safety box, Hair dryer, Weighing apparatus, Coffee maker with refill, Two Umbrella, Flashlight, Spare pillows, Hot and cold water with shower, Wi-Fi Internet access etc.'),
                Text('Price: 78 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 40 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Room size 40 Sq.m with twin bed room, 40” T.V with satellite channels, Private balcony, Air conditioner, Telephone, Digital clock, Refrigerator, Complimentary 2 bottled of water, Safety box, Hair dryer, Weighing apparatus, Coffee maker with refill, Two Umbrella, Flashlight, Spare pillows, Hot and cold water with shower, Wi-Fi Internet access etc.'),
                Text('Price: 94 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Junior room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 48 sq.m.'),
                Text('Bed type: Double bed'),
                Text('Room information: Room size 48 Sq.m with double bed room, 40” T.V with satellite channels, Pantry area, Private balcony, Air conditioner, Telephone, Digital clock, Refrigerator, Complimentary 2 bottled of water, Safety box, Hair dryer, Weighing apparatus, Coffee maker with refill, Two Umbrella, Flashlight, Spare pillows, Hot and cold water with shower, Wi-Fi Internet access etc.'),
                Text('Price: 119 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Royal suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 67 sq.m.'),
                Text('Bed type: Double bed'),
                Text('Room information: Room size 67 Sq.m with double bed room & 1 living room, 40” T.V with satellite channels, Pantry area, Private balcony, Air conditioner, Telephone, Digital clock, Refrigerator, Complimentary 2 bottled of water, Safety box, Hair dryer, Weighing apparatus, Coffee maker with refill, Two Umbrella, Flashlight, Spare pillows, Hot and cold water shower, Wi-Fi Internet access etc.'),
                Text('Price: 140 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaplussamutprakan01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaplussamutprakan01-superior-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaplussamutprakan01-deluxe-room.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaplussamutprakan01-junior-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shaplussamutprakan01-royal-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
               Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaPlusSamutprakan01Favoritewidget extends StatefulWidget {
  const _ShaPlusSamutprakan01Favoritewidget({Key? key}) : super(key: key);

  @override
  ___ShaPlusSamutprakan01FavoritewidgetState createState() =>
      ___ShaPlusSamutprakan01FavoritewidgetState();
}

class ___ShaPlusSamutprakan01FavoritewidgetState
    extends State<_ShaPlusSamutprakan01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaExtraPlusHomepageScreen extends StatelessWidget {
  const ShaExtraPlusHomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaExtraPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shaextraplusbangkok01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Radisson Blu Plaza Bangkok',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Bangkok',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaExtraPlusHomepageDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaExtraPluslistDropdown extends StatefulWidget {
  const ShaExtraPluslistDropdown({Key? key}) : super(key: key);

  @override
  _ShaExtraPluslistDropdownState createState() =>
      _ShaExtraPluslistDropdownState();
}

class _ShaExtraPluslistDropdownState extends State<ShaExtraPluslistDropdown> {
  final items = [
    'Bangkok',
    'Chonburi Province',
    'Nakhon Pathom Province',
    'Nonthaburi Province',
    'Pathum Thani Province',
    'Samut Prakan Province',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Colors.white),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    switch (value) {
                      case 'Bangkok':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaExtraPlusHomepageScreen()),
                        );
                        break;
                      case 'Chonburi Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaExtraPlusChonburiProvince()),
                        );
                        break;
                      case 'Nakhon Pathom Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaExtraPlusNakhonPathomProvince()),
                        );
                        break;
                      case 'Nonthaburi Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaExtraPlusNonthaburiProvince()),
                        );
                        break;
                      case 'Pathum Thani Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaExtraPlusPathumThaniProvince()),
                        );
                        break;
                      case 'Samut Prakan Province':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ShaExtraPlusSamutPrakanProvince()),
                        );
                        break;
                    }
                  },
                  hint: const Text('Select Province'),
                ),
              )),
        ),
      ],
    );
  }
}

class ShaExtraPlusHomepageDetail01 extends StatelessWidget {
  const ShaExtraPlusHomepageDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Radisson Blu Plaza Bangkok',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Bangkok',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaExtraPlusHomepage01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '023023333'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Bangkok'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6635'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Iconic and vibrant Radisson Blu Plaza Bangkok Turning Bangkok Blu as Bangkok Blu Heartbeat in Central Sukhumvit!!!',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 489 Sukhumvit Road Khlong Toei Nuea Vadhana Bangkok 10110'),
                Text('Call: 023023333'),
                Text('Website: www.radissonhotels.com'),
                Text('E-mail: info.bangkok.blu@radisson.com'),
                Text('Access time: Monday-Sunday 00.00-23.59 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Decorated with chic fabrics and modern furnishings, this room offers a king bed or two twin beds.'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Decorated with chic fabrics and modern furnishings, this room offers a king bed or two twin beds.'),
                Text('Price: 150 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Premium deluxe room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Get great views in a room featuring a king bed or two twin beds and complimentary laundry service.'),
                Text('Price: 170 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Premium deluxe room - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Get great views in a room featuring a king bed or two twin beds and complimentary laundry service.'),
                Text('Price: 170 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Business class room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Upgrade to a Business class room for a free breakfast, access to the lounge, and late check-out.'),
                Text('Price: 190 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_8 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Business class room - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 36 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Upgrade to a Business class room for a free breakfast, access to the lounge, and late check-out.'),
                Text('Price: 190 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_9 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Junior suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 56 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Expand in amprie space in this suite with a seating area, a king bed, and picturesque city views.'),
                Text('Price: 210 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_10 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'One bedroom suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 72 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Relax in this suite with a separate bedroom for privacy and a living room that offers sweeping views.'),
                Text('Price: 230 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_11 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Two bedroom suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 144 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: A private bicony adds to the allure of this suite that has two bedrooms with ensuite bathrooms.'),
                Text('Price: 250 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Extra Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaextraplusbangkok01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaextraplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaextraplusbangkok01-deluxe-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaextraplusbangkok01-deluxe-kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaextraplusbangkok01-business-class-room-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shaextraplusbangkok01-business-class-room-kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shaextraplusbangkok01-premium-deluxe-room-twinbed.jpg',
                ),
                textSection_7,
                Image.asset('images/shaextraplusbangkok01-premium-deluxe-room-kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_8,
                Image.asset('images/shaextraplusbangkok01-junior-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_9,
                Image.asset('images/shaextraplusbangkok01-one-bedroom-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_10,
                Image.asset('images/shaextraplusbangkok01-two-bedroom-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_11,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaExtraPlusHomepage01Favoritewidget extends StatefulWidget {
  const _ShaExtraPlusHomepage01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaExtraPlusHomepage01FavoritewidgetState createState() =>
      __ShaExtraPlusHomepage01FavoritewidgetState();
}

class __ShaExtraPlusHomepage01FavoritewidgetState
    extends State<_ShaExtraPlusHomepage01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaExtraPlusChonburiProvince extends StatelessWidget {
  const ShaExtraPlusChonburiProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaExtraPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset('images/shaextrapluschonburi01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('OZO NORTH PATTAYA',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Chonburi',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaExtraPlusChonburiDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShaExtraPlusChonburiDetail01 extends StatelessWidget {
  const ShaExtraPlusChonburiDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'OZO NORTH PATTAYA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Chonburi',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaExtraPlusChonburi01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '038419419'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Chonburi'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6534'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Are you in need of a beachside getaway? Something fun for the whole family? A playful space with a huge swimming pool for your whole tribe to hang-out? Look no further: Travel is a breeze at OZO North Pattaya. Looking to chill? Sip an ice-cold drink by the pool and unwind with your favourite people. Brought your kids along? Make sure they play in our kids’ pool with slides. Getting hungry? Cool down and refuel at EAT, serving up iconic Thai and international classics. Need to get some work done? We’ve got meeting spaces for you +1, or you +1,000! We’re just around the corner from Terminal 21 shopping mall, surrounded by great bars and restaurants, and loads of vibrant, tasty, noisy street-side stalls along the way. The north-end of Pattaya Bay is where it’s at! An amazing night’s sleep awaits after your adventure under the sun: our OZO Snooze Zones offer soft, signature beds, blackout curtains and noise-proof rooms for that perfect combination of comfort, privacy and peace. Sweet dreams. Grab your sunnies, put on some sunblock and unpack good vibes @ OZO North Pattaya.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 240/43 Pattaya Beach Road, Chonburi, 20150 Thailand Na Kluea Bang Lamung Chonburi 20150'),
                Text('Call: 038419419'),
                Text('Website: www.ozohotels.com/pattaya'),
                Text('E-mail: pattaya@ozohotels.com'),
                Text('Access time: Monday-Sunday 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 27 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Getting great sleep is easy. Our 27 square metre Superior features a snooze-inducing king bed or twin beds with pillow top mattresses, black-out curtains and free Wi-Fi.'),
                Text('Price: 120 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 27 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Getting great sleep is easy. Our 27 square metre Superior features a snooze-inducing king bed or twin beds with pillow top mattresses, black-out curtains and free Wi-Fi.'),
                Text('Price: 120 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe ocean view - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 27 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Recharge in the Deluxe Ocean View room featuring a private balcony with amazing views of Pattaya Beach, a daybed and OZO signature beds.'),
                Text('Price: 140 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe ocean view - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 27 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Recharge in the Deluxe Ocean View room featuring a private balcony with amazing views of Pattaya Beach, a daybed and OZO signature beds.'),
                Text('Price: 140 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior family',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 35 sq.m.'),
                Text('Bed type: King and bunk beds'),
                Text('Room information: Ideal for families, the Superior Family room at our North Pattaya hotel features a sublime king bed, bunk beds for the kids in the second room, black-out curtains and free Wi-Fi.'),
                Text('Price: 160 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_8 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'One bedroom suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 39 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Spacious with amazing panoramic views of the city, the One Bedroom Suite features a separate living room, sublime king bed, private balcony and blackout curtains.'),
                Text('Price: 170 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_9 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior two bedroom - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 54 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Are you in need of a beachside getaway with the whole family? Look no further: the Superior Two Bedroom at our resort in North Pattaya features a king bed in the master bedroom, twin beds for the kids in the second bedroom and a flat-screen TV in both bedrooms.'),
                Text('Price: 180 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_10 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior two bedroom - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 54 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Are you in need of a beachside getaway with the whole family? Look no further: the Superior Two Bedroom at our resort in North Pattaya features a king bed in the master bedroom, twin beds for the kids in the second bedroom and a flat-screen TV in both bedrooms.'),
                Text('Price: 180 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_11 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe two bedroom - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 54 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: When it is time to chill and relax, the Deluxe Two Bedroom is your private haven. The family-friendly room at our North Pattaya resort features a king bed in the master bedroom, twin beds for the kids in the second bedroom and a flat-screen TV in both bedrooms.'),
                Text('Price: 200 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_12 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe two bedroom - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 54 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: When it is time to chill and relax, the Deluxe Two Bedroom is your private haven. The family-friendly room at our North Pattaya resort features a king bed in the master bedroom, twin beds for the kids in the second bedroom and a flat-screen TV in both bedrooms.'),
                Text('Price: 200 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Extra Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaextrapluschonburi01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaextraplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaextrapluschonburi01-superior-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaextrapluschonburi01-superior-kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaextrapluschonburi01-deluxe-ocean-view-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shaextrapluschonburi01-deluxe-ocean-view-kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shaextrapluschonburi01-superiorfamily.jpg',
                ),
                textSection_7,
                Image.asset('images/shaextrapluschonburi01-one-bedroom-suite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_8,
                Image.asset('images/shaextrapluschonburi01-superior-twobedroom-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_9,
                Image.asset('images/shaextrapluschonburi01-superior-twobedroom-kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_10,
                Image.asset('images/shaextrapluschonburi01-deluxe-twobedroom-twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_11,
                Image.asset('images/shaextrapluschonburi01-deluxe-twobedroom-kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_12,
                Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaExtraPlusChonburi01Favoritewidget extends StatefulWidget {
  const _ShaExtraPlusChonburi01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaExtraPlusChonburi01FavoritewidgetState createState() =>
      __ShaExtraPlusChonburi01FavoritewidgetState();
}

class __ShaExtraPlusChonburi01FavoritewidgetState
    extends State<_ShaExtraPlusChonburi01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaExtraPlusNakhonPathomProvince extends StatelessWidget {
  const ShaExtraPlusNakhonPathomProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaExtraPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                            'images/shaexpraplusnakhonpathum01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Theroyalgemslodge',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Nakhon Pathom',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                        Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaExtraPlusNakhonpathomDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ShaExtraPlusNakhonpathomDetail01 extends StatelessWidget {
  const ShaExtraPlusNakhonpathomDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Theroyalgemslodge',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nakhon Pathom',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaExtraPlusNakhonpathom01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '024298151'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Nakhon Pathom'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B6193'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'At our exquisitely luxurious guestrooms, a guest can enjoy superb Golf Course Fairway Views in private from the privacy of their guestrooms. The delicately selected international amenity sets are provided all thogh your stay with us.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 170/148 Salaya-Banglane Rd. Salaya Phutthamonthon Nakhon Pathom 73170'),
                Text('Call: 024298151'),
                Text('Website: www.royalgemsgolf.com'),
                Text('E-mail: sales_hotel@royalgemsgolf.com'),
                Text('Access time: Monday - Sunday 0.00 - 23.59'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Price: 120 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Price: 140 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Junior suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: King bed'),
                Text('Price: 180 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Extra Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaexpraplusnakhonpathum01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaextraplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaexpraplusnakhonpathum01-superior.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaexpraplusnakhonpathum01-deluxe.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaexpraplusnakhonpathum01-juniorsuites.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
               Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaExtraPlusNakhonpathom01Favoritewidget extends StatefulWidget {
  const _ShaExtraPlusNakhonpathom01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaExtraPlusNakhonpathom01FavoritewidgetState createState() =>
      __ShaExtraPlusNakhonpathom01FavoritewidgetState();
}

class __ShaExtraPlusNakhonpathom01FavoritewidgetState
    extends State<_ShaExtraPlusNakhonpathom01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaExtraPlusNonthaburiProvince extends StatelessWidget {
  const ShaExtraPlusNonthaburiProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaExtraPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child:
                            Image.asset('images/shaextraplusnonthaburi01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Best Western Plus Wanda Grand Hotel',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Nonthaburi',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaExtraPlusNonthaburiDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaExtraPlusNonthaburiDetail01 extends StatelessWidget {
  const ShaExtraPlusNonthaburiDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Best Western Plus Wanda Grand Hotel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nonthaburi',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaExtraPlusNonthaburi01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '025828282'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Nonthaburi'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B0857'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Best Weatern Plus Wanda Grand Hotel is a striking, state-of-the-art hotel in the up-and-coming area of North Bangkok. Strategically located close to a range of key business, leisure and MICE destinations, this chic hotel is the perfect choice for all types of traveller. And with excellent highway links to the airport and city center, the hotel is highly accessible. Best Western Plus Wanda Grand Hotel is the ideal location for corporate and social events of all sizes. Located in one of Bangkok main business hubs, the hotel offers a choice of ten meeting rooms, plus the expansive Wanda Grand Ballroom. All meeting spaces are backed up with the latest audio-visual technology and a full range of catering options. And our dedicated event management team will ensure that every function, both large and small, runs seamless and successfully. With 183 sleek, contemporary rooms, ranging from superior rooms to two-bedroom suites, Best Western Plus Wanda Grand Hotel is ideal for both short-and-extended-stay guests. Guest can enjoy exquisite Thai and International cuisine at the hotel all-day restaurant, socialize at the vibrant lounge, or unwind in the tropical outdoor swimming pool and modern fitness center.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 170/148 Salaya-Banglane Rd. Salaya Phutthamonthon Nakhon Pathom 73170'),
                Text('Call: 025828282'),
                Text('Website: www.bwpluswandagrand.com'),
                Text('E-mail: enquiry@bwpluswandagrand.com'),
                Text('Access time: 24 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room twin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Starting at a spacious 30 square meters, our Superior Twin rooms are furnished in a sleek, contemporary style and feature comfortable twin beds, floor-to-ceiling windows, large work desks with power outlets, and bathrooms with refreshing showers. All rooms come equipped with the latest technology including flat-screen TVs with satellite channels and complimentary Wi-Fi.'),
                Text('Price: 100 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room king',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Starting at a spacious 30 square meters, our Superior Twin rooms are furnished in a sleek, contemporary style and feature comfortable twin beds, floor-to-ceiling windows, large work desks with power outlets, and bathrooms with refreshing showers. All rooms come equipped with the latest technology including flat-screen TVs with satellite channels and complimentary Wi-Fi.'),
                Text('Price: 120 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'One bedroom suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 58 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Covering an expansive 58 square meters, our One-Bedroom Suites all feature separate living areas, bedrooms and bathrooms. The large bedroom is fitted with a king-size bed, while the bathroom comes equipped with a refreshing shower. Guests can unwind in comfort in the living room, which features a relaxing sofa, flat-screen TV with satellite channels and complimentary Wi-Fi. And both the bedroom and living room feature floor-to-ceiling windows with stunning city views.'),
                Text('Price: 160 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Two bedroom suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bed type: Twin bed'),
                Text('Room information: Our Two-Bedroom Suites offer a true “home-away-from-home” experience for long-stay travelers and families. At 88 square meters, these apartment-style units offer two bedrooms, each equipped with an en-suite bathroom. Guests can unwind in the comfort of the living room, which features a relaxing sofa, flat-screen TV with satellite channels and complimentary Wi-Fi. Both the master bedroom and living room feature floor-to-ceiling windows with stunning city views.'),
                Text('Price: 180 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Extra Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaextraplusnonthaburi01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaextraplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaextraplusnonthaburi01-superiortwin.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaextraplusnonthaburi01-superiorking.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaextraplusnonthaburi01-onebedroomsuite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shaextraplusnonthaburi01-twobedroomsuite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
               Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaExtraPlusNonthaburi01Favoritewidget extends StatefulWidget {
  const _ShaExtraPlusNonthaburi01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaExtraPlusNonthaburi01FavoritewidgetState createState() =>
      __ShaExtraPlusNonthaburi01FavoritewidgetState();
}

class __ShaExtraPlusNonthaburi01FavoritewidgetState
    extends State<_ShaExtraPlusNonthaburi01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaExtraPlusPathumThaniProvince extends StatelessWidget {
  const ShaExtraPlusPathumThaniProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaExtraPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child:
                            Image.asset('images/shaextrapluspathumthani01.jpg'),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('The Idle Residence',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Pathum Thani',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                       Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaExtraPlusPathumthaniDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
         ],
      )
    );
  }
}

class ShaExtraPlusPathumthaniDetail01 extends StatelessWidget {
  const ShaExtraPlusPathumthaniDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The Idle Residence',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Pathum Thani',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaExtraPlusPathumthani01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '029088077'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Pathum Thani'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B0219'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The Idle residence is a city resort. That is natural, tranquility, provides privacy Modern accommodation services, meeting rooms, seminars and banquets - restaurant - fitness center - swimming pool and activities for health, cycling, yoga, aerobics and 24 hour security.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 58 / 851 หมู่ 13 T. Klong Nueng A. Klong Luang Pathumthani 12120 Khlong Nueng Khlong Luang Pathum Thani 12120'),
                Text('Call: 029088077'),
                Text('Website: www.theidle-residence.com'),
                Text('E-mail: rm@theidle-residence.com'),
                Text('Access time: 08.30 - 20.00 hours'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room - Twin bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 28 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: A 28 sq.m. room offering a comfortable Twin bed, work desk, flat-screen TV, air conditioning, refrigerator, safety box and hair dryer.'),
                Text('Price: 120 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room - King bed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 28 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: A 28 sq.m. room offering a comfortable King bed, work desk, flat-screen TV, air conditioning, refrigerator, safety box and hair dryer.'),
                Text('Price: 120 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_5 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Deluxe room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 38 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: A comfortable 38 sq.m. room with living space, kitchenette, working desk, flat-screen TV, air conditioning, refrigerator, safety box and hair dryer.'),
                Text('Price: 140 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_6 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Junior suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 48 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: A spacious 48 sq.m. room with separate bedroom and living room, kitchenette, working area, flat-screen TV, air conditioning, refrigerator, safety box and hair dryer.'),
                Text('Price: 160 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_7 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Family suite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 76 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: A spacious 76 sq.m. room offering a comfortable King and King bed or King and Twin bed room with two bathrooms and living room, kitchenette, working area, flat-screen TV, air conditioning, refrigerator, safety box and hair dryer.'),
                Text('Price: 190 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Extra Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaextrapluspathumthani01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaextraplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaextrapluspathumthani01-SuperiorRoom-Twinbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaextrapluspathumthani01-SuperiorRoom-Kingbed.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                Image.asset('images/shaextrapluspathumthani01-DeluxeRoom.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_5,
                Image.asset('images/shaextrapluspathumthani-JuniorSuite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_6,
                Image.asset('images/shaextrapluspathumthani-FamilySuite.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_7,
                   Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaExtraPlusPathumthani01Favoritewidget extends StatefulWidget {
  const _ShaExtraPlusPathumthani01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaExtraPlusPathumthani01FavoritewidgetState createState() =>
      __ShaExtraPlusPathumthani01FavoritewidgetState();
}

class __ShaExtraPlusPathumthani01FavoritewidgetState
    extends State<_ShaExtraPlusPathumthani01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class ShaExtraPlusSamutPrakanProvince extends StatelessWidget {
  const ShaExtraPlusSamutPrakanProvince({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                    appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.hotel),
                            label: const Text('SHA EXTRA PLUS'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShaExtraPlusHomepageScreen()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [ShaExtraPluslistDropdown()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/shaextraplussamutprakan01.jpg',
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            Text('Dahla hotel',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.where_to_vote,
                              color: Colors.blue,
                            ),
                            Text(
                              'Samut Prakan',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 1500,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.pageview_outlined),
                                    label: const Text('See more'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ShaExtraPlusSamutprakanDetail01()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.menu),
                        label: const Text('Back to Menu'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

class ShaExtraPlusSamutprakanDetail01 extends StatelessWidget {
  const ShaExtraPlusSamutprakanDetail01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dahla hotel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Samut Prakan',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const _ShaExtraPlusSamutprakan01Favoritewidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '0868936708'),
        _buildButtonColumn(color, Icons.where_to_vote, 'Pathum Thani'),
        _buildButtonColumn(color, Icons.safety_divider, 'SHA ID: B5384'),
      ],
    );

    Widget textSection_1 = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The Dahla Hotel provide you 5 stars hotel for enjoy and relaxing during your trip in Thailand with 209 Rooms with our facility services fitness, restaurant & bar and swimming pool 24 hour and free Wi-Fi and security system. Our best location to Bangkok landmark just 16Km from Bangkok airport and within 1 hour to Central Bangkok. An ideal living space for business, the deluxe room overlook view, the room provide free Wi-Fi internet, 40” LCD cable TV, Working desk, refrigerator & Kettle in room.',
        softWrap: true,
      ),
    );

    Widget textSection_2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Address: 93 Moo 7 Soi 4 Bangna Garden, Bangsaotong, Samut Prakan 10540 Bang Sao Thong Bang Sao Thong Samut Prakarn 10540'),
                Text('Call: 029088077'),
                Text('Website: http://dahlabangkok.com/'),
                Text('E-mail: rsvndahla@gmail.com'),
                Text('Access time: Everyday 08:00-16:00'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Standard room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30 sq.m.'),
                Text('Bed type: Twin bed'),
                Text('Room information: Desk Multi-type outlets Central air conditioning Wardrobe/closet Curtain Sofa High-speed Internet 4 Clothes rack.'),
                Text('Price: 94 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection_4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Superior room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Room size: 30 sq.m.'),
                Text('Bed type: King bed'),
                Text('Room information: Desk Multi-type outlets Central air conditioning Wardrobe/closet Curtain Sofa High-speed Internet 4 Clothes rack.'),
                Text('Price: 94 USD/night'),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
        title: 'Safety & Health Guarantee Hotel Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SHA Extra Plus Hotel'),
            ),
            body: ListView(
              children: [
                Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
                titleSection,
                buttonSection,
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/shaextraplussamutprakan01.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_1,
                Image.asset('images/shaextraplus.png', width: 100, height: 100),
                textSection_2,
                Image.asset('images/shaextraplussamutprakan01-standardroom.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_3,
                Image.asset('images/shaextraplussamutprakan01-superiorroom.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
                textSection_4,
                 Consumer<ApplicationState>(
                        builder: (context, appState, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (appState.loginState ==
                                ApplicationLoginState.loggedIn) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: SizedBox(
                                    width: 1500,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => const ContactHotel()
                                              ),
                                            );
                                          },
                      child: const Text('Contact hotel')),
                                  ),
                    )
                  ],
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaExtraPlusSamutprakan01Favoritewidget extends StatefulWidget {
  const _ShaExtraPlusSamutprakan01Favoritewidget({Key? key}) : super(key: key);

  @override
  __ShaExtraPlusSamutprakan01FavoritewidgetState createState() =>
      __ShaExtraPlusSamutprakan01FavoritewidgetState();
}

class __ShaExtraPlusSamutprakan01FavoritewidgetState
    extends State<_ShaExtraPlusSamutprakan01Favoritewidget> {
  int _favoriteCount = 0;

  void _incrementCounter() {
    setState(() {
      _favoriteCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (const Icon(Icons.emoji_emotions_outlined)),
            color: Colors.red[500],
            onPressed: _incrementCounter,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}

class HotelInformationRegistration extends StatelessWidget {
  const HotelInformationRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety & Health Guarantee Hotel Booking'),
      ),
      body: const _HotelInformationRegistration(),
    );
  }
}

class _HotelInformationRegistration extends StatefulWidget {
  const _HotelInformationRegistration({Key? key}) : super(key: key);

  @override
  __HotelInformationRegistrationState createState() =>
      __HotelInformationRegistrationState();
}

class __HotelInformationRegistrationState
    extends State<_HotelInformationRegistration> {
  final _formKey = GlobalKey<FormState>();
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Send Hotel information',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Send us e-mail at contact@gmail.com if you are interested in advertising your hotel on our website. Please note that we accept only the SHA group of hotel (SHA, SHA Plus and SHA Extra plus). You need to show the evidence documents that your hotel is eligibal to apply.',
                    style: TextStyle(fontSize: 18),
                  )),
              Image.asset('images/hotel.jpg')
            ],
          ),
        ]));
  }
}

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety & Health Guarantee Hotel Booking'),
        ),
        body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                
                Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset('images/SHAxSafeTravelsStamp.jpg')),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'About us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                        'Safety & Health Guarantee Hotel Booking application is a platform that collects all a group of hotels that they were guaranteed with SHA, SHA Plus, or SHA Extra Plus certificates to ensure all customers travel safely.'))
          ],
        )
      )
    );
  }
}

class DevelopercontactScreen extends StatelessWidget {
  const DevelopercontactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety & Health Guarantee Hotel Booking'),
      ),
      body: const _DevelopercontactScreen(),
    );
  }
}

class _DevelopercontactScreen extends StatelessWidget {
  const _DevelopercontactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: const [
              Text('Developer contact',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: Row(
            children: const [
              Icon(Icons.account_box_rounded),
              Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Kankanis Chanthercrob')
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: Row(
            children: const [
              Icon(Icons.work),
              Text('ID: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('63130700357')
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: Row(
            children: const [
              Icon(Icons.account_balance),
              Text('Department : ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('School of Information technology')
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: Row(
            children: const [
              Icon(Icons.account_balance_outlined),
              Text('Major : ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('IT')
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: Row(
            children: const [
              Icon(Icons.email),
              Text('Email : ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('kankanis.cha@gmail.com')
            ],
          ),
        ),
      ),
    ]);
  }
}

class ContactHotel extends StatelessWidget {
  const ContactHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Hotel'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('images/hotelcontactcenter.jpg'),
          const SizedBox(height: 8),
          const IconAndDetail(Icons.calendar_today, 'Everyday 24 hours'),
          const IconAndDetail(Icons.location_city, 'Bangkok office'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          // Modify from here
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  const Header('Contact hotel center'),
                  GuestBook(
                    addMessage: (message) =>
                        appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessages,
                  ),
                ],
              ],
            ),
          ),
          // To here.
        ],
      ),
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;

        // Add from here
        _guestBookSubscription = FirebaseFirestore.instance
            .collection('guestbook')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _guestBookMessages = [];
          for (final document in snapshot.docs) {
            _guestBookMessages.add(
              GuestBookMessage(
                name: document.data()['name'] as String,
                message: document.data()['text'] as String,
                // To here.
              ),
            );
          }
          notifyListeners();
        });
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        // Add from here
        _guestBookMessages = [];
        _guestBookSubscription?.cancel();
        // to here.
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  // Add from here
  StreamSubscription<QuerySnapshot>? _guestBookSubscription;
  List<GuestBookMessage> _guestBookMessages = [];
  List<GuestBookMessage> get guestBookMessages => _guestBookMessages;
  // to here

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Add from here
  Future<DocumentReference> addMessageToGuestBook(String message) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance
        .collection('guestbook')
        .add(<String, dynamic>{
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }
  // To here
}

class GuestBook extends StatefulWidget {
  const GuestBook({required this.addMessage, required this.messages});
  final FutureOr<void> Function(String message) addMessage;
  final List<GuestBookMessage> messages;

  @override
  _GuestBookState createState() => _GuestBookState();
}

class _GuestBookState extends State<GuestBook> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        for (var message in widget.messages)
          Paragraph('${message.name} : ${message.message}'),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Leave a message',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your message to continue';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                StyledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.addMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.send),
                      SizedBox(width: 4),
                      Text('SEND'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
