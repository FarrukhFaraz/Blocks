import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'dart:convert';

import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class SummarizeScreen extends StatefulWidget {
  const SummarizeScreen({Key? key}) : super(key: key);

  @override
  State<SummarizeScreen> createState() => _SummarizeScreenState();
}

class _SummarizeScreenState extends State<SummarizeScreen> {
  TextEditingController textController = TextEditingController();
  String? summaryText;
  bool isloader = false;
  bool issummarize = false;

//   import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// final Uri _url = Uri.parse('https://flutter.dev');

// void main() => runApp(
//       const MaterialApp(
//         home: Material(
//           child: Center(
//             child: RaisedButton(
//               onPressed: _launchUrl,
//               child: Text('Show Flutter homepage'),
//             ),
//           ),
//         ),
//       ),
//     );

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not post ';
  }

  getsummarize() async {
    setState(() {});
    var ApiUrl = 'https://api.nlpcloud.io/v1/bart-large-cnn/summarization';
    var token = 'fd7e426332b8075e11715068600635714374a989';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    Map maped = {'text': textController.text.toString()};
    final response = await http.post(Uri.parse(ApiUrl),
        headers: headers, body: json.encode(maped));
    print('response====' + response.body.toString());
    final jsondata = jsonDecode(response.body);
    print('json======' + jsondata.toString());
    setState(() {
      issummarize = false;
      isloader == false;
      textController.clear();
    });
    summaryText = jsondata['summary_text'];
    _showdonepopup(context);
    //Share.share(summaryText);
    print('summaryText+++' + summaryText.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summarization'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100),
            child: TextField(
              controller: textController,
              maxLines: 20,
              decoration: InputDecoration(
                  hintText: 'Write something to summarize',
                  border: InputBorder.none),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          GestureDetector(
            onTap: (() {
              if (textController.text.length == 0) {
                Toast.show('Please write something to summarize');
              } else if (textController.text.length < 5) {
                Toast.show('Please write something to summarize');
              } else {
                setState(() {
                  isloader = true;
                });
                getsummarize();
              }
            }),
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade300),
              child: isloader == true
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Post Summary',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          issummarize == false
              ? Container()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(summaryText.toString()),
                ),
        ],
      )),
    );
  }

  _showdonepopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('facebook');
                                _launchUrl(Uri.parse(
                                    'https://www.facebook.com/sharer/sharer.php?t=$summaryText'));
                                //     'https://www.facebook.com/sharer/sharer.php?t=$summaryText');
                                // 'https://www.facebook.com/sharer/sharer.php?t=$summaryText';
                              },
                              child: const Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: 46,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('whatsapp');
                                Uri.parse(
                                    'https://api.whatsapp.com/send?text=$summaryText');
                              },
                              child: const Icon(
                                Icons.whatsapp,
                                color: Colors.green,
                                size: 46,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('email');
                                Uri.parse('mailto:?body=$summaryText');
                              },
                              child: const Icon(
                                Icons.email,
                                color: Colors.green,
                                size: 46,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('linkedin');
                                Uri.parse(
                                    'https://www.linkedin.com/shareArticle?text=$summaryText');
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Image(
                                  image:
                                      AssetImage('assets/images/instagram.png'),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('twitter');
                                Uri.parse(
                                    'https://www.twitter.com/intent/tweet?text=$summaryText');
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Image(
                                  image:
                                      AssetImage('assets/images/twitter.png'),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ]));
        });
  }
}
