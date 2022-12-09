part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class LoadApiEvent extends CategoryEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
