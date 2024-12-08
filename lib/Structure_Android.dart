// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _coeur = const Icon(Icons.favorite_border, color: Colors.white,);
  final bool _likeBool = false;
  var _selectedIndex = 0;
  var _affichage = '0: Accueil';

  void _likeThis(){
    setState(() {
      if (_likeBool){
        _coeur = Icon(Icons.favorite_border, color: Colors.white,);
      }
      else {
        _coeur = Icon(Icons.favorite, color: Colors.white,);
      }
    });
  }

  void _itemClique(int index){
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex ==0){
        _affichage = "0 : Accueil";
      }
      else if (_selectedIndex ==1){
        _affichage = "1 : Mon compte";
      }
      else{
        _affichage = "2 : Paramètres";
      }
    });
  }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.title),
      actions: <Widget>[
      IconButton(onPressed: _likeThis, icon: _coeur)
      ],
      backgroundColor: const Color.fromARGB(255, 54, 86, 244),
      ),

      drawer: Drawer(
      child: ListView(
    // Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Accueil'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: const Text('Compte'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
       ListTile(
        title: const Text('Paramètres'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),
),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/maroc.jpeg", width: 250, height: 250,),
            Image.network("https://s.yimg.com/ny/api/res/1.2/fZQ8vje8DetmwNDEhJLtsQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTYzOQ--/https://media.zenfs.com/fr/article.bfmtv.com/2deb25fed697605e7af6a507ca9c02d8", width: 240, height: 240,),
            Text(_affichage),
             ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
      onPressed: (){},
      tooltip: 'bonjour',
      child: const Icon(Icons.waving_hand),
  ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'Accueil',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label:'Mon Compte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label:'Paramètres',
          ),
          ],
          onTap:_itemClique,
          currentIndex: _selectedIndex,
  ),
  );
}
}