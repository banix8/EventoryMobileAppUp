import 'package:flutter/material.dart';
//import 'package:Eventory/util/providers_data.dart'; //reference
import 'package:Eventory/podo/note.dart'; //reference
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:Eventory/screens/provider_info.dart'; //destination

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  

  


  List<Note> _notes = List<Note>();
  List<Note> _notesForDisplay = List<Note>();

  Future<List<Note>> fetchNotes() async {
    var url = "http://192.168.1.9/eventory_updated/login.php";
    var response = await http.post(url, body: {"event": "search"});
    
    var notes = List<Note>();
    
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index-1);
        },
        itemCount: _notesForDisplay.length+1,
      )
    );
  }



  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.category.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _notesForDisplay[index].category,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              _notesForDisplay[index].category,
              style: TextStyle(
                color: Colors.grey.shade600
              ),
            ),
          ],
        ),
      ),
    );
  }
}

