part of 'new_category_bloc.dart';

abstract class NewCategoryState extends Equatable {
  const NewCategoryState();
}

class NewCategoryLoadingState extends NewCategoryState {
  @override
  List<Object> get props => [];
}

class NewCategoryLoadedState extends NewCategoryState {
  List<Datum> data;
  NewCategoryLoadedState(this.data);
  @override
  List<Object> get props => [];
}

class NewCategoryErrorState extends NewCategoryState {
  @override
  List<Object> get props => [];
}
