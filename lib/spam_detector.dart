import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SpamDetector extends StatefulWidget {
  static const routeName = '/message-form';
  const SpamDetector({super.key});

  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<SpamDetector> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';

  Future<String> checkSpam(String message) async {
    // emulator
    final url = Uri.parse("http://10.0.2.2:5000/predict");
    // final url = Uri.parse("http://192.168.1.2:5000/predict");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['prediction'];
    } else {
      print('Failed to load prediction. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load prediction');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Spam Detector',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 23, 22, 22),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            _response == "spam"
                ? Image.asset(
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    'assets/ad899320062a92a66266eb2fb73ce83a.jpg')
                : Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        _response,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            SizedBox(
              height: 40,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: _controller,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: 'Enter a message',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                try {
                  final result = await checkSpam(_controller.text);
                  setState(() {
                    _response = result;
                  });
                } catch (e) {
                  setState(() {
                    _response = 'Error: $e';
                  });
                }
              },
              child: Text(
                'Send',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
