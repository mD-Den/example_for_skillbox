import 'package:flutter/material.dart';

import '../../models/selected_cards.dart';
import '../pages/selected_user_page.dart';

class UserCardWidget extends StatefulWidget {
  const UserCardWidget({
    Key? key,
    required this.email,
    required this.name,
    required this.initials,
    required this.indexCard,
    required this.selectedUsers,
  }) : super(key: key);

  final String email;
  final String name;
  final String initials;
  final int indexCard;
  final List<dynamic> selectedUsers;

  @override
  State<UserCardWidget> createState() => _UserCardWidgetState();
}

class _UserCardWidgetState extends State<UserCardWidget> {
  late bool isSelected;
  var selectedUser = 0;
  List<dynamic> userForSpend = [];

  @override
  void initState() {
    super.initState();

    if (SelectedCards.selectedCards.contains(widget.indexCard)) {
      isSelected = true;
    } else {
      isSelected = false;
    }
  }

  void _chooseUsers() {
    for (var i = 0; i < 20; i++) {}
    if (SelectedCards.selectedCards.contains(widget.indexCard)) {
      SelectedCards.selectedCards.remove(widget.indexCard);
    } else {
      SelectedCards.selectedCards.add(widget.indexCard);
    }
    setState(() {
      isSelected = true;
      switch (widget.indexCard) {
        case 1:
          selectedUser = 0;
          break;
        case 2:
          selectedUser = 20;
          break;
        case 3:
          selectedUser = 40;
          break;
        case 4:
          selectedUser = 60;
          break;
        case 5:
          selectedUser = 80;
          break;
        case 6:
          selectedUser = 100;
          break;
        case 7:
          selectedUser = 120;
          break;
        case 8:
          selectedUser = 140;
          break;
        case 9:
          selectedUser = 160;
          break;
        case 10:
          selectedUser = 180;
          break;
      }
    });
    userForSpend = [];
    for (var i = selectedUser; i < selectedUser + 20; i++) {
      userForSpend.add(widget.selectedUsers[i]);
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SelectedUserPage(
              selectedUsers: userForSpend,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _chooseUsers,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: Colors.blue)
                : Border.all(color: Colors.white),
          ),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.email,
                  ),
                  Text(
                    widget.name,
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      100.0,
                    ),
                  ),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    widget.initials,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
