import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyoutrader/Bloc/new_category/new_category_bloc.dart';
import 'package:iyoutrader/Models/new_cat_model.dart';

class NewCatScreen extends StatelessWidget {
  const NewCatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                NewCategoryBloc(RepositoryProvider.of<getCatApi>(context))
                  ..add(FetchNewCatEvent())),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Its Category'),
        ),
        body: BlocBuilder<NewCategoryBloc, NewCategoryState>(
          builder: (context, state) {
            if (state is NewCategoryLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NewCategoryErrorState) {
              return Center(
                child: Text('No Category Found!'),
              );
            }
            if (state is NewCategoryLoadedState) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Image.network(
                          'https://accountpos.shoaibkanwalacademy.com/mandi_master_admin/public/image/' +
                              state.data[index].image.toString()),
                    );
                  });
            }
            return Text('Its Loading....');
          },
        ),
      ),
    );
  }
}
