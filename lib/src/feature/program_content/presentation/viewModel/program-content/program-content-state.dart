import 'package:equatable/equatable.dart';

class ProgramContentState extends Equatable {
  final int tab;

  const ProgramContentState({
    this.tab = 0,
  });

  ProgramContentState copyWith({
    int? tab,
  }) {
    return ProgramContentState(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object> get props => [tab];
}