import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:apk/welcome.dart';

class Tikus extends StatefulWidget {
  @override
  _TikusState createState() => _TikusState();
}

class _TikusState extends State<Tikus> {
  final databaseRef = FirebaseDatabase.instance.reference();
  final String emailUsername =
      'achmadmusyawir12345@gmail.com'; // Ganti dengan email pengirim
  final String emailPassword =
      'dmduwbghvxfskhnj'; // Ganti dengan kata sandi email pengirim

  void updateRuanganStatus(String ruangan, String status) {
    DatabaseReference ruanganRef = databaseRef.child(ruangan);
    ruanganRef.set(status).then((value) {
      if (status.contains('Terdeteksi Tikus')) {
        sendEmail(ruangan);
      }
    });
  }

  void sendEmail(String ruangan) async {
    final smtpServer = gmail(emailUsername, emailPassword);
    final message = Message()
      ..from = Address(emailUsername, 'Pengirim')
      ..recipients.add('skripsifakari@gmail.com')
      ..subject = 'Peringatan: Perubahan $ruangan'
      ..text = 'Perubahan terdeteksi di $ruangan: Terdeteksi Tikus';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email berhasil dikirim: ${sendReport.toString()}');
    } catch (e) {
      print('Error dalam pengiriman email: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp();

    // Menambahkan pemantau (listener) untuk setiap ruangan
    DatabaseReference ruanganRef1 = databaseRef.child('Ruangan1');
    ruanganRef1.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan1');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef2 = databaseRef.child('Ruangan2');
    ruanganRef2.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan2');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef3 = databaseRef.child('Ruangan3');
    ruanganRef3.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan3');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef4 = databaseRef.child('Ruangan4');
    ruanganRef4.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan4');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef5 = databaseRef.child('Ruangan5');
    ruanganRef5.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan5');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef6 = databaseRef.child('Ruangan6');
    ruanganRef6.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan6');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef7 = databaseRef.child('Ruangan7');
    ruanganRef7.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan7');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef8 = databaseRef.child('Ruangan8');
    ruanganRef8.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan8');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });

    DatabaseReference ruanganRef9 = databaseRef.child('Ruangan9');
    ruanganRef9.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (status != null && status.contains('Terdeteksi Tikus')) {
        sendEmail('Ruangan9');
      }
      setState(() {}); // Memperbarui tampilan saat status berubah
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 114, 213, 33),
        leading: IconButton(
          icon: Icon(Icons.mouse_outlined),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          },
        ),
        title: Text('Deteksi Tikus'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Divider(
            color: Colors.green,
          ),
          Divider(
            color: Colors.green,
          ),
          ListTileWidget(databaseRef.child('Ruangan1'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan2'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan3'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan4'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan5'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan6'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan7'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan8'), updateRuanganStatus),
          ListTileWidget(databaseRef.child('Ruangan9'), updateRuanganStatus),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Denah Nilai Deteksi Tikus ',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40),
          Table(
            border: TableBorder.all(
              color: Colors.blue, // Ganti dengan warna yang diinginkan
              width: 6.0, // Ganti dengan ketebalan garis yang diinginkan
            ),
            defaultColumnWidth: FixedColumnWidth(100),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan1'), updateRuanganStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan9'), updateRuanganStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan8'), updateRuanganStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan7'), updateRuanganStatus),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(''),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(''),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(''),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan6'), updateRuanganStatus),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan2'), updateRuanganStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan3'), updateRuanganStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan4'), updateRuanganStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: ListTileWidget(
                          databaseRef.child('Ruangan5'), updateRuanganStatus),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatefulWidget {
  final DatabaseReference databaseRef;
  final Function(String, String) updateRuanganStatus;

  ListTileWidget(this.databaseRef, this.updateRuanganStatus);

  @override
  _ListTileWidgetState createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  String? _status;
  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    widget.databaseRef.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      if (mounted && status != null) {
        setState(() {
          _status = status;
          if (status.contains('Terdeteksi Tikus')) {
            _backgroundColor = Colors.red;
          } else {
            _backgroundColor = Colors.white;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String ruangan = widget.databaseRef.key!;
    bool isTerdeteksiTikus = _status == 'Terdeteksi Tikus';

    return Container(
      color: _backgroundColor,
      child: ListTile(
        title: Text(
          ruangan,
          style: TextStyle(
            color: isTerdeteksiTikus ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          _status ?? 'Loading Database',
          style: TextStyle(
            fontSize: 12,
            color: isTerdeteksiTikus ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
