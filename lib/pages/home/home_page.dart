import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../models/generator_monuments.dart';
import '../../models/monument.dart';
import '../../widgets/monument_card.dart';
import '../monumen/monumen_page.dart';
import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool ascending = false;
  List<Monument> monuments = GeneratorMonuments.monuments();

  void _openDetail(Monument monument) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MonumentPage(monument: monument);
    }));
  }

  void _sortMonuments() {
    List<Monument> sortedMonument = monuments;
    sortedMonument.sort((a, b) {
      if(!ascending){
        return a.rating.compareTo(b.rating);
      }else {
        return b.rating.compareTo(a.rating);
      }
    });
    setState(() {
      monuments = sortedMonument;
    });
  }

  void _openProfilePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ProfilePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      ascending = !ascending;
                    });
                    _sortMonuments();
                  },
                  child: Row(children: [
                    const Text("Sort by Rating"),
                    Icon(
                        ascending
                            ? LineIcons.sortNumericUp
                            : LineIcons.sortNumericDown,
                        size: 32)
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                  onTap: () => _openProfilePage(),
                  child: const Icon(Icons.account_circle_outlined, size: 32)),
            ),
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
                    child: MonumentCard(
                      monument: monuments[index],
                      onRatingChanged: (double rating) {
                        monuments[index].rating = rating;
                      },
                    ));
              }),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
