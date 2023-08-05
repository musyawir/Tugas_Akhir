import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apk/welcome.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String _title = 'Ruangan Storage';

  void _openURL(BuildContext context) async {
    const url =
        'https://docs.google.com/spreadsheets/d/1o-Msp01qohz8J8qyaeLWSzxeKhAKOlsKaeNV7rpWUa4/edit?usp=sharing';
    try {
      await launch(url);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not launch URL'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 114, 213, 33),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
              );
            },
          ),
          title: const Text(_title),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[200],
        body: DefaultTextStyle(
          style: GoogleFonts.poppins(
            // Apply Poppins font as default
            textStyle: TextStyle(fontSize: 16),
            color: Color(0xFF555555),
          ),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/lovemuseum.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'MUSEUM NEGERI LAMPUNG',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/depan_museum.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      'Museum Lampung memiliki dua tempat utama yaitu Bangunan Pameran atau Storage. Ruangan Storage memiliki 4 ruangan untuk menyimpan dan memelihara koleksi dalam perawatan koleksi',
                      // No need to specify the style here as DefaultTextStyle will apply it
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () => _openURL(context),
                      child: const Text('Open Google Sheets'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/zonatikus.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Denah untuk Zona Sensor yang mendeteksi Tikus',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(''),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/zonadebu.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Denah untuk Zona Sensor yang mendeteksi Debu',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Dibawah ini Terdapat Denah 3 Dimensi ',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/3datas.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/3dbelakang.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/3dsamping.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  '1. Tampak dari Atas',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  '2. Tampak dari Belakang',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  '3. Tampak dari Samping',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
