import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/monument.dart';

class MonumentPage extends StatelessWidget {
  const MonumentPage({super.key, required this.monument});

  final Monument monument;

  void _openMaps(String pinMap) {
    canLaunchUrl(Uri.parse(pinMap))
        .then((value) =>
        launchUrl(Uri.parse(pinMap), mode: LaunchMode.externalApplication))
        .onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(monument.name),
        ),
        body: Container(
          color: Colors.grey[300],
          child: ListView(
            children: [
              const SizedBox(height: 10.0),
              imagesCard(context, monument.images),
              detailCard(context)
            ],
          ),
        ));
  }

  Widget imagesCard(BuildContext context, List<String> images) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        FlutterCarousel(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.width * (60 / 100),
            showIndicator: true,
            floatingIndicator: false,
            slideIndicator: CircularSlideIndicator(
                currentIndicatorColor:
                Theme.of(context).colorScheme.inversePrimary,
                indicatorBackgroundColor: Colors.grey[200]),
          ),
          items: images.map((String image) {
            return Container(
              height: MediaQuery.of(context).size.width * (50 / 100),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/$image'))),
            );
          }).toList(),
        )
      ]));

  Widget detailCard(BuildContext context) => Padding(
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
                    const SizedBox(height: 10),
                    Text(monument.description,
                        textAlign: TextAlign.justify),
                    const SizedBox(height: 10),
                    const Text(
                      'Dapatkan Peta Lokasi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    mapButton(context, () => _openMaps(monument.pinMap))
                  ]))));

  Widget mapButton(BuildContext context, VoidCallback onTap) => SizedBox(
    width: MediaQuery.of(context).size.width * (40 / 100),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
      onPressed: () => onTap(),
      child: const Row(
        children: [
          Icon(Icons.pin_drop_outlined, color: Colors.white),
          SizedBox(width: 5),
          Text('Google Maps'),
        ],
      ),
    ),
  );
}