// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:superv/UpdatingApi/update.dart';
import 'package:superv/models/modelClassAppi.dart';

class ApiYesterday extends StatefulWidget {
  const ApiYesterday({Key key}) : super(key: key);

  @override
  State<ApiYesterday> createState() => _ApiYesterdayState();
}

class _ApiYesterdayState extends State<ApiYesterday> {
  var users = [];
  getUser() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://magentix.ch/api/get_order/yesterday"));
    var jsonData = jsonDecode(response.body);
    
    for (var i in jsonData) {
      UserModel user =
          UserModel(i['id'], i['order_number'], i['total'], i['order_status']);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yesterday Orders"),
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Text("Loading ......."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text('  ID\n' + snapshot.data[i].id.toString()),
                      ),
                      title: Text(snapshot.data[i].order_number),
                      subtitle: Text(snapshot.data[i].order_status),
                      trailing: Text("Total = " + snapshot.data[i].total),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Updating(userid: users[i]);
                        }));
                      },
                    );
                  });
            }
          }),
    );
  }
}
