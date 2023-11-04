import 'monument.dart';

class GeneratorMonuments {
  static List<Monument> monuments(){
    List<Monument> monuments = [];
    List<String> images = [];
    images.add('');
    Monument monument = Monument(
        name: 'Monumen Sanapati',
        summary: 'Sejarah Persandian Indonesia berawal dari sini',
        map: 'Kotabaru, Gondokusuman, Yogyakarta',
        mapLink: 'https://goo.gl/maps/hocTP538x4SzgYaQ8',
        description: "Persandian di Indonesia dimulai dari Jawatan Teknik Kementerian Pertahanan Indonesia pada masa perjuangan kemerdekaan, baik di Jakarta maupun di Yogyakarta. Menteri Pertahanan kala itu, Amir Syariffudin, mengungkapkan pentingnya organisasi pelaksana fungsi persandian. Amir Syariffudin bersama dr Rubiono Kertapati, yang kini dikenal sebagai Bapak Persandian Indonesia, membentuk lembaga sandi negara pertama yang disebut Dinas Kode pada 4 April 1946. Perndirian Dinas Kode tersebut diperingati sebagai Hari Persandian Indonesia.\n\nLembaga persandian Indonesia telah mengalami 4 kali perubahan. Pada tahun 1950-1960, Dinas Sandi diubah menjadi Jawatan Sandi. Kemudian pada masa Orde Baru Jawatan Sandi diubah menjadi Lembaga Sandi Negara dan berada di bawah koordinasi Presiden. Pada masa kepemmpinan Presiden Joko Widodo, Lembaga Sandi Negara ini dilebur dengan Badan Siber dan Sandi Negara (BSSN).\n\nMonumen Sanapati dibangun untuk memeringati 50 tahun persandian Indonesia di Yogyakarta. Persandian di Yogyakarta memiliki andil yang besar dalam mempertahankan kemerdekaan Negara Indonesia. Tercatat pada peristiwa Serangan Umum 1 Maret 1949, sandi buatan Roebiono masih digunakan untuk menyebarkan pesan pada dunia bahwa Indonesia masih ada dan masih bisa melawan. Selanjutnya, peristiwa tersebut dikenal dengan Peristiwa 6 jam di Yogyakarta.",
        images: images
    );
    monuments.add(monument);
    return monuments;
  }
}