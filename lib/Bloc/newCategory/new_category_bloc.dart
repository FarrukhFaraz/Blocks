import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/new_category.dart';

part 'new_category_event.dart';
part 'new_category_state.dart';

class NewCategoryBloc extends Bloc<NewCategoryEvent, NewCategoryState> {
  final classApi _callapi;
  NewCategoryBloc(this._callapi) : super(NewCategoryLoadindState()) {
    //emit(NewCategoryLoadindState());
    on<ApiEvent>((event, emit) async{
      final activity= await _callapi.getApi();
      emit(NewCategoryLoadedState(activity.data!));
    });
  }
}
