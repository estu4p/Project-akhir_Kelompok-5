import 'package:flutter/material.dart';

class TimeConverterScreen extends StatefulWidget {
  @override
  _TimeConverterScreenState createState() => _TimeConverterScreenState();
}

class _TimeConverterScreenState extends State<TimeConverterScreen> {
  DateTime _selectedTime = DateTime.now();
  String _wibTime = '';
  String _witTime = '';
  String _witaTime = '';
  String _londonTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        title: const Text(
          'Konversi Waktu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        shape: const Border(
          bottom: BorderSide(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Waktu:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                  side: const BorderSide(),
                ),
                child: const Text(
                  'Pilih Waktu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Waktu Terpilih: $_selectedTime',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hasil Konversi:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // asdadsadasdadas
            const Text(
              'WIB',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    // spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '$_wibTime',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'WIT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    // spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '$_witTime',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'WITA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    // spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '$_witaTime',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'LONDON',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    // spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '$_londonTime',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // dadadasdadadada
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = DateTime(
          _selectedTime.year,
          _selectedTime.month,
          _selectedTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Perform time zone conversions here
        _wibTime = _convertToTimeZone(_selectedTime, 7);
        _witTime = _convertToTimeZone(_selectedTime, 9);
        _witaTime = _convertToTimeZone(_selectedTime, 8);
        _londonTime = _convertToTimeZone(_selectedTime, 0);
      });
    }
  }

  String _convertToTimeZone(DateTime dateTime, int timeZoneOffset) {
    final convertedTime = dateTime.toUtc().add(Duration(hours: timeZoneOffset));
    return convertedTime.toString();
  }
}
