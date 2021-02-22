import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pages_event.dart';

part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  PagesBloc() : super(PagesInitial());

  @override
  Stream<PagesState> mapEventToState(
    PagesEvent event,
  ) async* {
    if (event is PagesMoved) {
      yield* _mapPageEventToState(event);
    }
  }

  Stream<PagesState> _mapPageEventToState(PagesMoved event) async* {
    yield PagesOnMove(pages: event.pages);
  }
}
