import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/new_cat_model.dart';

part 'new_category_event.dart';
part 'new_category_state.dart';

class NewCategoryBloc extends Bloc<NewCategoryEvent, NewCategoryState> {
  final getCatApi _catApi;
  NewCategoryBloc(this._catApi) : super(NewCategoryLoadingState()) {
    on<FetchNewCatEvent>((event, emit) async {
      emit(NewCategoryLoadingState());
      final activity = await _catApi.getapiCategories();
      activity == null
          ? emit(NewCategoryErrorState())
          : emit(NewCategoryLoadedState(activity.data));
    });
  }
}
