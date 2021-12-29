// ignore_for_file: dead_code, unused_local_variable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:superv/models/modelClassAppi.dart';
import 'package:http/http.dart' as http;
import 'package:superv/printer/printpage.dart';

class Updating extends StatefulWidget {
  final UserModel userid;
  const Updating({Key key, this.userid}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Updating> createState() => _UpdatingState(userid);
}

class _UpdatingState extends State<Updating> {
  bool changepage = true;
  final UserModel userid;
  _UpdatingState(this.userid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Updation of Api ..."),
        centerTitle: true,
      ),
      body: Center(
        child: changepage
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          changepage = false;
                        });
                      },
                      child: Text("Allow")),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Denied"),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        http.Response response;
                        response = await http.get(Uri.parse(
                            "https://magentix.ch/api/get_order/result/${userid.id.toString()}/15"));
                        Navigator.pop(context);
                      },
                      child: Text("15")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        http.Response response;
                        response = await http.get(Uri.parse(
                            "https://magentix.ch/api/get_order/result/${userid.id.toString()}/30"));
                        Navigator.pop(context);
                      },
                      child: Text("30")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        http.Response response;
                        response = await http.get(Uri.parse(
                            "https://magentix.ch/api/get_order/result/${userid.id.toString()}/60"));
                        Navigator.pop(context);
                      },
                      child: Text("60")),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PrintPage(user: userid);
          }));
        },
        child: Icon(Icons.print),
      ),
    );
  }
}
