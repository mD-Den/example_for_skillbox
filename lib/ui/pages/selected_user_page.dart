import 'package:flutter/material.dart';

import '../widgets/selected_user_card_widget.dart';

class SelectedUserPage extends StatelessWidget {
  const SelectedUserPage({Key? key, required this.selectedUsers})
      : super(key: key);

  final List<dynamic> selectedUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, i) => SelectedUserCard(
          isGreenBackground:
              selectedUsers[i].toString().contains('completed: true'),
          title: selectedUsers[i]['title'],
          id: selectedUsers[i]['id'],
          userId: selectedUsers[i]['userId'],
          completed: selectedUsers[i]['completed'],
        ),
        itemCount: selectedUsers.length,
      ),
    );
  }
}
