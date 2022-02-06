import 'package:equatable/equatable.dart';

class QueriesModel extends Equatable{
  int? queryId;
  String? queryText;
  int? comments;
  String? date;
  String? location;

  QueriesModel(
      {this.queryId, this.queryText, this.comments, this.date, this.location});

  QueriesModel.fromJson(Map<String, dynamic> json) {
    queryId = json['query_id'];
    queryText = json['query_text'];
    comments = json['comments'];
    date = json['date'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query_id'] = this.queryId;
    data['query_text'] = this.queryText;
    data['comments'] = this.comments;
    data['date'] = this.date;
    data['location'] = this.location;
    return data;
  }

  @override
  List<Object?> get props => [queryId,queryText,comments,date,location];
}
