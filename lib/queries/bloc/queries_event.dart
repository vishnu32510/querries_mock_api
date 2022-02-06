part of 'queries_bloc.dart';

@immutable
abstract class QueriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QueriesFetched extends QueriesEvent {}
