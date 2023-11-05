import 'package:flutter/material.dart';

import 'monumen_page.dart';

class MonumentPageState extends State<MonumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.monument.name),
        ),
        body: Container(
          color: Colors.grey[300],
          child: ListView(
            children: [
              const SizedBox(height: 10.0),
              imagesCard(),
              detailCard()
            ],
          ),
        ));
  }

  Widget imagesCard() => const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
          color: Colors.white,
          elevation: 0,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Images Are Here')]))));

  Widget detailCard() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
          color: Colors.white,
          elevation: 0,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sejarah Monument',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.monument.description,
                        textAlign: TextAlign.justify)
                  ]))));
}
