import 'package:final_630710663/models/team_item.dart';
import 'package:flutter/material.dart';

class VoteResult extends StatelessWidget {

  final TeamItem teamItem;

  const VoteResult({Key? key, required this.teamItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VOTE RESULT'),),
      //body: ListView.builder(itemBuilder: itemBuilder)
    );
  }
}
