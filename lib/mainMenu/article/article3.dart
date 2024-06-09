import 'package:flutter/material.dart';

class Article3Page extends StatelessWidget {
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
                'Tips Menggunakan LPG yang Aman dan Benar',
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
                  'assets/img/Foto3.jpg',
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
JAKARTA. seiring dengan terjadi beberapa insiden yang dikaitkan dengan penggunaan material LPG 3 kg (Tabung LPG 3 Kg, Kompor, Regulator, Selang). Penanganan insiden yang telah dilakukan Pertamina dalam kurun waktu 2008 - 2010 meliputi pergantian biaya pengobatan korban, asuransi bagi korban hingga asuransi aset yang mengalami kerusakan. Terdiri dari 27 insiden tahun 2008, 9 insiden 2009 dan 6 insiden tahun 2010.Beberapa insiden tersebut disebabkan oleh bermacam-macam hal yang diduga seperti : gas LPG bocor yang terakumulasi, pemasangan regulator tidak tepat, penggunaan tabung yang tidak sesuai dengan prosedur hingga lokasi penempatan tabung dan kompor yang tidak sesuai standar keamanan (tidak ada ventilasi, merokok dalam ruangan tersebut hingga menggunakan kompor minyak tanah dan LPG secara bersamaan).

Untuk menghindari terjadinya insiden, berikut di bawah ini tips menggunakan LPG yang aman dan benar :
1.	Gunakan peralatan ELPIJI (tabung, kompor, regulator dan selang) sesuai standard (SNI) 
2.	Kompor dan tabung ELPIJI ditempatkan di tempat yang datar dan di ruangan yang memiliki sirkulasi udara yang baik 
3.	Idealnya ventilasi dapur berada di dinding bagian bawah dan mengarah ke tempat aman mengingat berat jenis ELPIJI lebih berat dari udara maka apabila terjadi kebocoran ELPIJI akan berada di bagian bawah lantai dan pintu dapur harus terbuka 
4.	Selang harus terpasang erat dengan klem pada regulator maupun kompor 
5.	Tabung ELPIJI diletakkan menjauh dari kompornya atau sumber api lainnya dan harus diupayakan tidak terpapar panas 
6.	Pasang regulator pada katup tabung ELPIJI (posisi knob regulator mengarah ke bawah). Pastikan regulator tidak dapat terlepas dari katup tabung ELPIJI 
7.	Pastikan selang tidak tertindih atau tertekuk 
8.	Periksa kemungkinan kebocoran gas dari tabung, kompor, selang maupun regulatornya dengan cara membasuh dengan air sabun pada bagian-bagian rawan kebocoran (sambungan regulator dengan valve tabung, sambungan selang ke regulator dan kompor). Apabila terjadi kebocoran akan terjadi gelembung-gelembung udara pada air sabun dan tercium bau khas ELPIJI 
9.	Rangkaian Kompor ELPIJI siap dan aman untuk digunakan 

Cara menggunakan kompor yang baik :
1. Tekan dan putar knob kompor berlawanan arah jarum jam 
2.	Putar knob sampai posisi off (ditandai dengan bunyi klik) bila selesai 

Tips khusus :
Ruang dapur yang menjadi satu dengan ruang makan atau ruang tidur dan tidak mempunyai ventilasi atau sirkulasi udara yang baik maka harus diperhatikan perihal sebagai berikut :
1. Pada dini hari setelah bangun tidur dan akan menyalakan listrik dan atau menghidupkan kompor harus diyakinkan tidak ada akumulasi gas dalam ruangan dengan cara membuka pintu dan jendela terlebih dahulu. Bau khas ELPIJI mungkin menjadi tidak akan tercium apabila kita sedang pilek dan penciuman kita akan mengalami imun terhadap bau apabila kita :
•	Sudah terpapar bau tersebut selama waktu yang cukup lama.
•	Pada saat ruangan tertutup ditinggal dalam waktu lama, pada saat membuka pintu harus diyakinkan bahwa dalam ruang tersebut tidak terjadi akumulasi ELPIJI akibat kebocoran sebelum menyalakan listrik dan sumber api lain.
2. Jangan mencolok-colok valve tabung apabila ELPIJI tidak keluar dari tabung, tukarkan dengan penjual atau agen terdekat.
3. Jangan menggunakan kompor gas dan kompor minyak tanah secara bersamaan dalam satu ruangan.
4. Jangan menyalakan listrik dan atau menghidupkan kompor jika tercium bau ELPIJI yang bocor.


Sumber:
* Kementerian Energi dan Sumber Daya Mineral - Republik Indonesia
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
