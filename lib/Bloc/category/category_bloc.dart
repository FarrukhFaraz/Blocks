import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:iyoutrader/Models/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CallCategoryApi _callcategories;
  CategoryBloc(this._callcategories) : super(CategoryLoadingState()) {
    emit(CategoryLoadingState());
    on<LoadApiEvent>((event, emit) async {
      final activity = await _callcategories.getcategories();
      print('mm==='+activity.data.toString());
      emit(CategoryLoadedState(activity.data));
    });
  }
}
