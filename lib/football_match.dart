class FootballMatch {
  final String id;
  final String team1Name;
  final String team2Name;
  final String winnerTeam;
  final int team1Score;
  final int team2Score;
  final bool isRunning;

  FootballMatch({
    required this.id,
    required this.team1Name,
    required this.team2Name,
    required this.winnerTeam,
    required this.team1Score,
    required this.team2Score,
    required this.isRunning,
  });

  factory FootballMatch.fromJson(String id, Map<String, dynamic> json) {
    return FootballMatch(
      id: id,
      team1Name: json['team1_name'],
      team2Name: json['team2_name'],
      winnerTeam: json['winner_team'],
      team1Score: json['team1_score'],
      team2Score: json['team2_score'],
      isRunning: json['isRunning'],
    );
  }
}
