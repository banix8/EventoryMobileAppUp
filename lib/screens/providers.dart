import 'package:flutter/material.dart';
import 'package:Eventory/util/providers_data.dart'; //reference
import 'package:Eventory/widgets/providers_format.dart';  //format
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

     @override
  void initState() {
    //added by Jhunes
    super.initState();
    getData();
  } //added by Jhunes

  String name = '';

  

  String phone = '';
  String address = '';
  String bio = "";
  String category = '';
  String srate ='';
  String yearsxp = '';
  String fbpage = '';

 Future<List> getData() async {
    final response = await http.post("http://192.168.1.11/eventory_updated/login.php", body: {
      "event": "profile",
    });
     print(response.body);
     
     var datauser = json.decode(response.body); 

    
    setState(() {
        // image = datauser[0]['image'];
        phone = datauser[0]['supplierPhone'];
        address = datauser[0]['supplierAddress'];
        bio = datauser[0]['supplierBio'];
        category = datauser[0]['supplierCategory'];
        srate = datauser[0]['supplierRate'];
        yearsxp = datauser[0]['supplierYears'];
        fbpage = datauser[0]['supplierFacebook'];
       
      });
     return json.decode(response.body);
     
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "All Suppliers",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            


            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: suppliers == null ? 0 : suppliers.length, //the source of data
              itemBuilder: (BuildContext context, int index) {
                Map supplier = suppliers[index]; //the source of data

                return GridProduct(
                  img: supplier['img'],
                  name: supplier['name'],
                  scategory: supplier['scategory'],
                  srate: supplier['srate'],
                
                );
              },
            ),

//DISPLAY OF DATA ENDED HERE

          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
