class Bencana {
  final String id;
  final String title;
  final String imageUrl;
  String currentTotal = '0';
  final String dayRemaining;
  final String targetTotal;
  final String detailCampaign;
  final String campaign;

  Bencana({this.id, this.title, this.imageUrl, this.dayRemaining, this.targetTotal, this.detailCampaign, this.campaign, this.currentTotal});
  factory Bencana.fromJson(Map<String, dynamic> json) {
    return Bencana(
      id: json['id'].toString(),
      title: json['judul_campaign'],
     imageUrl: json['foto_campaign'].toString(),
      dayRemaining: json['batas_waktu_campaign'].toString(),
      targetTotal: json['nominal_campaign'].toString(),
      detailCampaign: json['detail_campaign'].toString(),
      campaign: json['kategori_campaign'].toString(),
    ) ?? [];
  }
    String toString() {
    return '{ ${this. id}, ${this.title}, ${this.imageUrl}, ${this.dayRemaining}, ${this.targetTotal}, ${this.detailCampaign}, ${this.campaign}, ${this.currentTotal}}';
  }
}

class IndexCategory {
  final int index;

  IndexCategory(this.index);
}