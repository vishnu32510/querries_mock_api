part of 'queries_bloc.dart';

enum QueriesStatus { Loading, Success, Failure }

@immutable
class QueriesState extends Equatable {
  final QueriesStatus queriesStatus;
  final List<QueriesModel> queries;

  const QueriesState(
      {this.queriesStatus = QueriesStatus.Loading,
      this.queries = const <QueriesModel>[]});

  QueriesState copyWith(
      {QueriesStatus? queriesStatus, List<QueriesModel>? queries}) {
    return QueriesState(
        queries: queries ?? this.queries,
        queriesStatus: queriesStatus ?? this.queriesStatus);
  }

  @override
  String toString() {
    return 'QueriesState{queriesStatus: $queriesStatus, queries: $queries}';
  }

  @override
  List<Object> get props => [queriesStatus, queries];
}
