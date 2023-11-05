import 'package:flutter/material.dart';
import 'package:monumen_submission/models/generator_monuments.dart';
import 'package:monumen_submission/models/monument.dart';
import 'package:monumen_submission/pages/monumen/monumen_page.dart';
import 'package:monumen_submission/pages/profile/profile_page.dart';
import 'package:monumen_submission/widgets/monument_card.dart';

import 'home_page.dart';

class HomePageState extends State<HomePage> {
  void _openDetail(Monument monument) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MonumentPage(monument: monument);
    }));
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
        body: Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.only(top: 5.0),
          child: ListView.builder(
              itemCount: monuments.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () => _openDetail(monuments[index]),
                    child: MonumentCard(monument: monuments[index]));
              }),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
