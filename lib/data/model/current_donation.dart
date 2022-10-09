class Current {
  final String currentId;
  final String nominal;

  Current({this.currentId, this.nominal});
  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      currentId: json['campaign_id'].toString(),
      nominal: json['current_donation'].toString(),
    );
  }
    String toString() {
    return '{ ${this.currentId}, ${this.nominal},}';
  }
}