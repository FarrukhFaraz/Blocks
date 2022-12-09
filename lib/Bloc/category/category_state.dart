part of 'category_bloc.dart';
@immutable
abstract class CategoryState {
  // const CategoryState();
}

class CategoryLoadingState extends CategoryState {
  // @override
  // List<Object> get props => [];
}

 class CategoryLoadedState extends CategoryState {
  List<Datum> data;
  //print($data);
  // final String title;
  // final String image;

  CategoryLoadedState(this.data);

  // @override

  // List<Object?> get props => [];
}

class CategoryErrorState extends CategoryState {
  String message;
  CategoryErrorState(this.message);
  // @override
  // // TODO: implement props
  // List<Object?> get props => [];
}
