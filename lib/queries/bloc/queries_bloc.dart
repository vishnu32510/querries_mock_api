import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mock_api/queries/models/queries_model.dart';
import 'package:mock_api/queries/view_model/queries.dart';

part 'queries_event.dart';

part 'queries_state.dart';

class QueriesBloc extends Bloc<QueriesEvent, QueriesState> {
  Future<void> onQueriesFetched(
    QueriesFetched event,
    Emitter<QueriesState> emit,
  ) async {
    try {
      if (state.queriesStatus == QueriesStatus.Loading) {
        final queries = await fetchQueries();
        return emit(state.copyWith(
          queriesStatus: QueriesStatus.Success,
          queries: queries,
        ));
      }
    } catch (_) {
      emit(state.copyWith(queriesStatus: QueriesStatus.Failure));
    }
  }

  QueriesBloc() : super(const QueriesState()) {
    on<QueriesFetched>(onQueriesFetched);
  }
}
