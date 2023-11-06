import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:monumen_submission/models/monument.dart';
import 'package:url_launcher/url_launcher.dart';

class MonumentCard extends StatelessWidget {
  const MonumentCard({super.key, required this.monument, required this.onRatingChanged});

  final Monument monument;
  final Function(double rating) onRatingChanged;

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
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Card(
            color: Colors.white,
            elevation: 0,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * (50 / 100),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/${monument.images[0]}'))),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        monument.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(monument.summary, textAlign: TextAlign.justify),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () => _openMaps(monument.pinMap),
                        child: Row(
                          children: [
                            const Icon(Icons.pin_drop, color: Colors.lightBlue),
                            Text(
                              monument.map,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: RatingBar.builder(
                          initialRating: monument.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            onRatingChanged(rating);
                          },
                        )
                      )
                    ]))));
  }
}
