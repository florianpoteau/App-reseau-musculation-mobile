import 'package:flutter/material.dart';
import 'package:renconsport/screen/widget/Modale/modalUser.dart';

class ContainerMessagerie extends StatelessWidget {
  final String username;
  final int age;
  final int? id;

  const ContainerMessagerie(
      {Key? key, required this.username, required this.age, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ModalUser(
              id: id,
              username: username,
              age: age,
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Row(
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
            ),
            SizedBox(width: 15),
            Text(
              username,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
      ),
    );
  }
}
