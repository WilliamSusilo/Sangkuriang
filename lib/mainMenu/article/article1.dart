import 'package:flutter/material.dart';

class Article1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artikel"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Text(
                'Tanda dan Upaya Mengatasi Kebocoran Gas',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Arial",
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/img/Foto1.jpeg',
                  width: 350,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '''
Yogyakarta, 20 Agustus 2022 – Kebakaran menjadi salah satu bencana yang banyak terjadi, baik disebabkan oleh alam sekitar maupun kelalaian manusia. Pada musim kemarau, suhu udara yang panas bisa menyulut api semakin cepat di dalam ruangan. Kebakaran di musim kemarau ini juga banyak terjadi di daerah Yogyakarta salah satunya kebakaran rumah. Kebakaran rumah dapat disebabkan oleh berbagai faktor. Kerap kali kebakaran rumah terjadi karena kelalaian pemilik rumah seperti konseleting listrik, lupa mematikan kompor hingga kebocoran gas elpiji. Tidak jarang masyarakat abai dan kurang mengetahui tanda-tanda kebocoran gas. 

Mengetahui tanda-tanda kebocoran gas sangat berguna untuk mencegah terjadinya kebakaran, tanda-tanda yang umum terjadi yaitu:
1.	Gas menjadi cepat habis atau boros
Gas yang bocor akan keluar secara berkala yang mengakibatkan massa gas berkurang, maka saat gas digunakan akan terasa cepat habis atau boros.
2.	Api pada kompor tidak berwarna biru
Ketika gas dalam keadaan baik, api pada kompor akan berwarna biru. Namun, ketika gas mengalami kebocoran api pada kompor akan berwarna orens atau kuning. Segera hentikan kegiatan jika api pada kompor berwarna orens atau kuning.
3.	Mengeluarkan bau menyengat
Gas yang mengalami kebocoran akan mengeluarkan bau yang menyengat terutama saat berada di dalam ruangan. Segera copot regulator dan pindahkan gas ke ruangan terbuka
4.	Muncul suara mendesis di sekitar gas
Akan mengeluarkan suara mendesis disekitaran gas. Ini merupakan salah satu tanda bahwa gas telah mengalami kebocoran.

Di beberapa kasus, kebocoran gas mungkin tidak disadari dan dirasakan tanda-tandanya. Untuk mencegah resiko yang ditimbulkan, baiknya bertanya kepada orang yang lebih mengerti atau ahli dalam menganalisis kebocoran gas yang mungkin terjadi agar tidak menimbulkan kebakaran atau kejadian lain yang lebih besar.
Namun, kebakaran dapat terjadi kapan saja dan dimana saja, tidak terkecuali di lingkungan sekitar kita seperti rumah, warung atau toko. Oleh karena itu, masyarakat diharap tetap berhati-hati dalam aktivitas apapun, tidak panik dan tenang dalam menghadapi situasi. 

Berikut upaya yang diberikan oleh BPBD DIY dalam menangani kebocoran gas:
1.	Melapas regulator dengan tabung gas
2.	Membuka semua pintu dan jendela agar udara segar masuk dan menghilangkan gas di dapur
3.	Mematikan listrik pada barang elektronik karena arus pendek listrik dapat menimbulkan percikan api
4.	Jangan menyalakan lampu, lilin, dan rokok karena panas atau bara api dari benda-benda tersebut dapat menyebabkan ledakan.

Namun jika sudah terjadi kebakaran, penanganan sederhana yang bisa dilakukan jika terjadi kebakaran di dapur ialah:
1.	Jika kebakaran bersumber dari atas kompor, segera cabut regulator gas dari tabungnya
2.	Padamkan api dengan menggunakan kain basah
3.	Jangan padamkan api langsung dengan air secara langsung, karena akan membuat api semakin membesar.
4.	Segera evakuasikan anggota keluarga dan hubungi Dinas Pemadam Kebakaran terdekat jika dirasa upaya pemadaman belum berhasil dan api semakin membesar.


Sumber:
* Badan Penanggulangan Bencana Daerah (BPBD) DIY
''',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
