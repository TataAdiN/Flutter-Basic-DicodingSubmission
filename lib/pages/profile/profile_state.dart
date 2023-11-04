import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/user_circle_image.dart';
import 'profile_page.dart';

class ProfilePageState extends State<ProfilePage> {
  void _openUrl(String url) async {
    canLaunchUrl(Uri.parse(url))
        .then((value) =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication))
        .onError((error, stackTrace) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Profil'),
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              aboutCard(),
              mediaSocialCard()
            ],
          ),
        ));
  }

  Widget aboutCard() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Card(
            color: Colors.white,
            elevation: 0,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tentang Aplikasi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Tema Aplikasi ini adalah Monumen Bersejarah yang ada di Daerah Istimewa Yogyakarta. Monumen yang menyimpanberbagai cerita sejarah perjuangan mulai dari sebelum kemerdekaan hingga pasca kemerdekaan Indonesia'
                          '\n\nWarna merah dipilih untuk warna aplikasi terinspirasi logo Pariwisata Daerah Istimewa Yogyakarta',
                          textAlign: TextAlign.justify)
                    ]))),
      );

  Widget mediaSocialCard() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
          color: Colors.white,
          elevation: 0,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const UserCircleImage(
                      imgUrl:
                          'https://scontent.fjog1-1.fna.fbcdn.net/v/t39.30808-6/395488480_2399833326890796_3346072083590875990_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFd8JT_if5ylcsa_hdf5xtGpqpXDqthw1amqlcOq2HDViyzbtlejMNsyCt7e_9rB41-px9b5HaI-N7MUOWn4QPY&_nc_ohc=ibYKLR_yaB0AX9Jc0Vl&_nc_ht=scontent.fjog1-1.fna&oh=00_AfD3LXnZJDu22kEUusPxSCbNEilZqRfprXY8d-IT-FB0_Q&oe=654B7E78',
                      diameter: 120),
                  const Center(
                    child: Text(
                      'Tata Adi Nugroho',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'tataa2237@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  socialButton(() async {
                    return _openUrl('https://github.com/TataAdiN');
                  }, Colors.grey, LineIcons.github, 'Github'),
                  socialButton(() async {
                    return _openUrl('https://www.facebook.com/Tata.AdiNugroho');
                  }, Colors.lightBlue, LineIcons.facebook, 'Facebook'),
                  socialButton(() async {
                    return _openUrl('https://www.linkedin.com/in/tataadin/');
                  }, Colors.blue, LineIcons.linkedin, 'Linkedin'),
                  socialButton(() async {
                    return _openUrl('https://www.instagram.com/tataadin.id/');
                  }, Colors.redAccent, LineIcons.instagram, 'Instagram')
                ],
              ))));

  Widget socialButton(VoidCallback onTap, Color backgroundColor, IconData icon,
          String label) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        onPressed: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 5),
            Text(label),
          ],
        ),
      );
}
