import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:apk/welcome.dart';

class Debu extends StatefulWidget {
  @override
  _DebuState createState() => _DebuState();
}

class _DebuState extends State<Debu> {
  final databaseRef = FirebaseDatabase.instance.reference();

  final String emailUsername =
      'achmadmusyawir12345@gmail.com'; // Ganti dengan email pengirim
  final String emailPassword =
      'dmduwbghvxfskhnj'; // Ganti dengan kata sandi email pengirim

  void sendEmail(String sensor, double value) async {
    final smtpServer = gmail(emailUsername, emailPassword);
    final message = Message()
      ..from = Address(emailUsername, 'Pengirim')
      ..recipients.add('skripsifakari@gmail.com')
      ..subject = 'Peringatan: Nilai Sensor $sensor Melebihi 150'
      ..text =
          'Nilai sensor $sensor telah melebihi 150. Nilai saat ini: $value';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email berhasil dikirim: ${sendReport.toString()}');
    } catch (e) {
      print('Error dalam pengiriman email: $e');
    }
  }

  double _extractValueFromStatus(String status) {
    try {
      return double.parse(status.split(': ')[1]);
    } catch (e) {
      return 0.0;
    }
  }

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp();

    // Menambahkan pemantau (listener) untuk setiap sensor
    List<String> sensorList = [
      'sensor1',
      'sensor2',
      'sensor3',
      'sensor4',
      'sensor5',
      'sensor6',
      'sensor7',
      'sensor8',
    ];

    for (String sensor in sensorList) {
      DatabaseReference sensorRef = databaseRef.child(sensor);
      sensorRef.onValue.listen((event) {
        String? status = event.snapshot.value as String?;
        if (status != null) {
          double value = _extractValueFromStatus(status);
          if (value > 150) {
            sendEmail(sensor, value);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 114, 213, 33),
        leading: IconButton(
          icon: Icon(Icons.air),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          },
        ),
        title: Text('Deteksi Debu'),
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
          ListTileWidget(databaseRef.child('sensor1'), _extractValueFromStatus),
          ListTileWidget(databaseRef.child('sensor2'), _extractValueFromStatus),
          ListTileWidget(databaseRef.child('sensor3'), _extractValueFromStatus),
          ListTileWidget(databaseRef.child('sensor4'), _extractValueFromStatus),
          ListTileWidget(databaseRef.child('sensor5'), _extractValueFromStatus),
          ListTileWidget(databaseRef.child('sensor6'), _extractValueFromStatus),
          ListTileWidget(databaseRef.child('sensor7'), _extractValueFromStatus),
          ListTileWidget(databaseRef.child('sensor8'), _extractValueFromStatus),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Denah Nilai Deteksi Debu ',
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
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(''),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor7'),
                          _extractValueFromStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor6'),
                          _extractValueFromStatus),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor1'),
                          _extractValueFromStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor8'),
                          _extractValueFromStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor5'),
                          _extractValueFromStatus),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor2'),
                          _extractValueFromStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor3'),
                          _extractValueFromStatus),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTileWidget(databaseRef.child('sensor4'),
                          _extractValueFromStatus),
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
  final Function(String) extractValueFromStatus;

  ListTileWidget(this.databaseRef, this.extractValueFromStatus);

  @override
  _ListTileWidgetState createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  double sensorValue = 0.0;

  @override
  void initState() {
    super.initState();
    widget.databaseRef.onValue.listen((event) {
      String? status = event.snapshot.value as String?;
      double value = widget.extractValueFromStatus(status ?? '');
      setState(() {
        sensorValue = value;
      });
    });
  }

  Color getSensorBackgroundColor() {
    return sensorValue > 150 ? Colors.red : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getSensorBackgroundColor(),
      child: StreamBuilder(
        stream: widget.databaseRef.onValue,
        builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            DataSnapshot dataSnapshot = snapshot.data!.snapshot;
            String sensor = widget.databaseRef.key!;
            String? status = dataSnapshot.value as String?;
            double value = widget.extractValueFromStatus(status ?? '');

            return ListTile(
              title: Text(sensor),
              subtitle: Text(value > 0 ? 'Nilai: $value' : 'Data Tidak Valid'),
            );
          }
          return ListTile(
            title: Text(widget.databaseRef.key!),
            subtitle: Text('Loading Database'),
          );
        },
      ),
    );
  }
}
