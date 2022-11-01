import 'package:final_630710663/models/team_item.dart';
import 'package:final_630710663/pages/vote_result.dart';
import 'package:final_630710663/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamsName extends StatefulWidget {
  const TeamsName({Key? key}) : super(key: key);

  @override
  State<TeamsName> createState() => _TeamsNameState();
}

class _TeamsNameState extends State<TeamsName> {
  List<TeamItem>? _teamList;

  @override
  void initState() {
    super.initState();
    _fetchFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    height: 120.0,
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      height: 80.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    if (_teamList != null)
                      ListView.builder(
                        itemBuilder: _buildListItem,
                        itemCount: _teamList!.length,
                      ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ElevatedButton(
                      onPressed: (){
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VoteResult(teamItem: teamItem),
                            )
                        );*/
                      },
                      child: Text(
                        'VIEW RESULT',
                        style: GoogleFonts.roboto(
                          color: Colors.redAccent[700],
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _fetchFoodData() async {
    /*setState(() {
      _isLoading = true;
    });*/

    var data = await Api().fetch('');
    setState(() {
      _teamList = data.map<TeamItem>((item) => TeamItem.fromJson(item)).toList();
      //_isLoading = false;
    });

    /*try {
      var data = await Api().fetch('');
      setState(() {
        _teamList = data
            .map<TeamItem>((item) => TeamItem.fromJson(item))
            .toList();
        //_isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isLoading = false;
      });
    }*/
  }

  Widget _buildListItem(BuildContext context, int index) {
    var teamItem = _teamList![index];

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(
                  teamItem.flagImage,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8.0),
                Column(
                  children: [
                    Text(
                      teamItem.team,
                      style: GoogleFonts.roboto(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'GROUP ${teamItem.group}',
                      style: GoogleFonts.roboto(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){},
              child: Text('VOTE',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent[700]),
                padding: MaterialStateProperty.all(EdgeInsets.all(6.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
