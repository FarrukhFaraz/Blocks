import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/category/category_bloc.dart';
import '../../Models/category.dart';
import '../../Models/new_category.dart';

class NewCategoryScreen extends StatelessWidget {
  const NewCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>
          CategoryBloc(
          RepositoryProvider.of<CallCategoryApi>((context))),
      child: Scaffold(
        appBar: AppBar(title: Text('Category Api'),),
         body:BlocBuilder<CategoryBloc,CategoryState>(
           builder: (context,state){
             if(state is CategoryLoadingState)
               {
                 return Center(child: CircularProgressIndicator(),);
               }
             if(state is CategoryLoadedState){
               return ListView.builder(
                   itemCount: state.data.length,
                   itemBuilder: (context,index){
                 return Container(
                   child: Text(state.data[index].title),
                 );
               });

             }
             return Container();
           },
         )
         // SingleChildScrollView(child: Column(children: [
         //
         // ],),)
         // ListView.builder(
         //     itemCount: ,
         //     itemBuilder: (context,index){}),
      ),
    );
  }
}
