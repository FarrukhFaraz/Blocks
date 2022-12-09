part of 'new_category_bloc.dart';

abstract class NewCategoryState extends Equatable {
  const NewCategoryState();
}

class NewCategoryLoadindState extends NewCategoryState {
  @override
  List<Object> get props => [];
}
class NewCategoryLoadedState extends NewCategoryState{
  List<Datummm> data;
  NewCategoryLoadedState(this.data);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class NewCategoryErrorState extends NewCategoryState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

