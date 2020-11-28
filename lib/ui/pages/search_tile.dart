import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';

class SearchTile extends StatelessWidget {
  SearchTile({@required this.userName, @required this.userEmail});
  final String userName;
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$userName'),
              Text('$userEmail'),
            ],
          ),
          Spacer(),
          FlatButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatRoom(),
                ),
              );
            },
            child: Text(
              'Message',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Container(
          //   width: 100,
          //   height: 37,
          //   padding: EdgeInsets.all(7.0),
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(22),
          //     ),
          //   ),
          //   child: Center(
          //     child: Text(
          //       'Message',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
