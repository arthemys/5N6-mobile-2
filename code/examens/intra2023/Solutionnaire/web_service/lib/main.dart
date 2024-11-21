import 'package:flutter/material.dart';
import 'package:solutionnaire/lib_http.dart';
import 'package:solutionnaire/transfert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solutionnaire Intra A23',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Recherche d\'artiste'),
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
  late List<Artiste> _artists;
  late SnackBar _error;

  late TextEditingController _searchController;

  Future<void> _rechercher() async {
    try {
      _artists = await searchArtists(_searchController.text);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(_error);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _artists = [];
    _searchController = TextEditingController();
    _error = SnackBar(
        content: const Text(
            'Une erreur est survenue en communicant avec le serveur. Veuillez réessayer dans quelques instants.'),
        action:
            SnackBarAction(label: 'Réessayer', onPressed: () => _rechercher()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Recherche',
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: _artists.length,
              itemBuilder: (context, index) => Container(
                  color: Colors.lightBlueAccent,
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.all(5),
                  child: Row(children: [
                    Text(
                      _artists[index].titre,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    )
                  ])),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rechercher,
        tooltip: 'Rechercher',
        child: const Icon(Icons.search),
      ),
    );
  }
}
