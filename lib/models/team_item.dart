class TeamItem{
  final int id;
  final String team;
  final String group;
  final String flagImage;
  final int voteCount;


  TeamItem({
    required this.id,
    required this.team,
    required this.group,
    required this.flagImage,
    required this.voteCount,
  });

  factory TeamItem.fromJson(Map<String, dynamic> json){
    return new TeamItem(
      id: json['id'],
      team: json['team'],
      group: json['group'],
      flagImage: json['flagImage'],
      voteCount : json['voteCount'],
    );
  }

  // named constructor
  TeamItem.fromJson2(Map<String, dynamic> json)
      : id = json['id'],
        team = json['team'],
        group = json['group'],
        flagImage = json['flagImage'],
        voteCount = json['voteCount'];
}