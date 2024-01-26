import 'package:flutter/material.dart';
import 'joke.dart'; 
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'joke_detail_page.dart';
import 'main.dart';

class JokesListPage extends StatefulWidget {
  @override
  _JokesListPageState createState() => _JokesListPageState();
}

class _JokesListPageState extends State<JokesListPage> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  Future<void> fetchJokes() async {
  try {
    final response = await http.get(Uri.parse('https://v2.jokeapi.dev/joke/Programming?type=twopart&amount=10'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        jokes = List<Joke>.from(jsonResponse['jokes'].map((x) => Joke.fromJson(x)));
      });
    } else {
      print('Failed to load jokes. Status code: ${response.statusCode}');
      showErrorMessage(context, 'Failed to load jokes.');
    }
  } catch (e) {
    print('An error occurred: $e');
    showErrorMessage(context, 'An error occurred while fetching jokes.');
  }
}

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programming Jokes'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Row(
              children: <Widget>[
                Text('Log Out'),
                Icon(Icons.logout),
              ],
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.white],
          ),
        ),
        child: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(jokes[index].category),
                subtitle: Text("${jokes[index].setup}\n${jokes[index].delivery}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JokeDetailPage(joke: jokes[index])),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchJokes();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Jokes reloaded!')));
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.orange.withOpacity(0.5), 
      ),
    );
  }
}
