import 'package:flutter/material.dart';
import 'package:pokedex_demo/models/pokemon_basic.dart';
import 'package:pokedex_demo/components/deck.dart';
import 'package:pokedex_demo/controllers/pokemon_list.dart';
import 'package:pokedex_demo/components/details.dart';


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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pokédex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<PokemonBasic> listData = [PokemonBasic(id: 1, name: 'bulbasaur', imagePath: 'graphics/sprites/pokemon/other/official-artwork/1.png')];
  // List<PokemonBasic> listData = List.generate(100, (index) => PokemonBasic(id: index + 1, name: 'Pokemon', imagePath: 'graphics/sprites/pokemon/other/official-artwork/${index + 1}.png'));
  // List<PokemonBasic> listData = List.generate(100, (index) => PokemonBasic(id: index + 1, name: 'Pokemon', imagePath: 'graphics/sprites/pokemon/${index + 1}.png'));
  List<PokemonBasic> listData = [];
  dynamic payload;
  PokemonBasicList handler = PokemonBasicList();

  @override
  initState() {
    super.initState();
    fetchPokemonList();
  }

  void fetchPokemonList() {
    try {
      (listData.isNotEmpty? handler.next() : handler.fetchNewBatch(null)).then((value) => appendToList(value!));
    } catch(e) {
      print(e);
    }
  }

  void appendToList(List<PokemonBasic> data) {
    setState(() {
      listData.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10), 
          constraints: const BoxConstraints(maxHeight: kToolbarHeight),
          child: const Image(
              image: AssetImage('graphics/pokemon_logo.png'),)
        )
      ),
      body: Column(children: [const DetailsCard(), Deck(entries: listData,)]),
      drawer: Drawer(
        child: ListView()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchPokemonList(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
