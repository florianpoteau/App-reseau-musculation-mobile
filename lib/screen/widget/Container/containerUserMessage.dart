import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';

class ContainerUserMessage extends StatelessWidget {
  const ContainerUserMessage({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(10.0), // Ajoutez ici le rayon souhaité
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.1,
        color: CustomTheme.Colorblue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.white,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                username,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
