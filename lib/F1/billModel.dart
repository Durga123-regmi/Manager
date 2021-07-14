class BillModel {
  String title;
  String category;
  bool paid;

  int ammount;
  DateTime dateTime;

  BillModel(
      {this.title,
      this.ammount,
      this.dateTime,
      this.category,
      this.paid = false});

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
        title: json['title'],
        ammount: json['ammount'],
        dateTime: DateTime.parse(
          json["date"],
        ),
        category: json['category']);
  }
}
