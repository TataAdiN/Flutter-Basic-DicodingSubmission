import 'package:flutter/material.dart';
import 'package:monumen_submission/models/generator_monuments.dart';
import 'package:monumen_submission/models/monument.dart';
import 'package:monumen_submission/pages/profile/profile_page.dart';

import 'home_page.dart';

class HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openProfilePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ProfilePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    List<Monument> monuments = GeneratorMonuments.monuments();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                  onTap: () => _openProfilePage(),
                  child: const Icon(Icons.account_circle_outlined, size: 32)),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: monuments.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text(monuments[index].name),
              );
            }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
