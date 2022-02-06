import 'package:mock_api/queries/models/queries_model.dart';
import 'package:mock_api/utils/services.dart';

Future fetchQueries() async {
  var response = await getMethod(
      url:
          "https://7b799511-b5f4-43fb-ae5d-1f65f67dd8d1.mock.pstmn.io/api/v1/home/feed");
  if (response != false) {
    List list = response;
    List<QueriesModel> queries =
        list.map((e) => QueriesModel.fromJson(e)).toList();
    return queries;
  } else {
    return response;
  }
}
