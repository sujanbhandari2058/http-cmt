import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as api;
import 'package:https_api/model/jsonToDart.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var url = 'https://jsonplaceholder.typicode.com/comments';
  List<post> ResData = [];

  @override
  void initState() {
    super.initState();
    getComments();
    setState(() {});
  }

  getComments() {
    Uri uri = Uri.parse(url);
    api.get(uri).then((res) {
      List decodeData = jsonDecode(res.body);

      ResData = decodeData.map<post>((item) {
        final convertedList = post.jsonToDart(item);
        return convertedList;
      }).toList();
    }).catchError((onError) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Get'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ResData.length,
          itemBuilder: (BuildContext context, int index) {
            var item = ResData[index];
            print(item);
            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.7)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(item.body),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email = ' + item.email,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
