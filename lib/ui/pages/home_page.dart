import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/user_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _urlFirstList = 'https://jsonplaceholder.typicode.com/users/';
  final _urlSecondList = 'https://jsonplaceholder.typicode.com/todos/';
  var _isCircle = true;
  List<dynamic> _users = [];
  List<dynamic> _selectedUsers = [];

  @override
  void initState() {
    super.initState();

    _getUsers();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isCircle = false;
      });
    });
  }

  Future<void> _getUsers() async {
    var responseUsers = await http.get(Uri.parse(_urlFirstList));
    var responseSelectedUsers = await http.get(Uri.parse(_urlSecondList));

    _users = jsonDecode(responseUsers.body);
    _selectedUsers = jsonDecode(responseSelectedUsers.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCircle
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, i) {
                int indexSpace = _users[i]['name'].toString().indexOf(' ');
                List<dynamic> trueList = [];
                _selectedUsers.where((element) {
                  if (element.toString().contains('userId: $i')) {
                    trueList.add(element.toString());
                  }
                  return element;
                });
                return UserCardWidget(
                  email: _users[i]['email'],
                  name: _users[i]['name'].toString().substring(0, indexSpace),
                  initials:
                      '${_users[i]['name'].toString()[0]}${_users[i]['name'].toString()[indexSpace + 1]}',
                  indexCard: i + 1,
                  selectedUsers: _selectedUsers,
                );
              },
              itemCount: _users.length,
            ),
    );
  }
}
