import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';
import '../../shared/cubit/cubit.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Container(
                    height: 165,
                    // color: NewsCubit.get(context).isDark ? Color(0xFF43658b) : Colors.grey,
                    color: AppCubit.get(context).isDark ?    Colors.grey : Color(0xFF43658b),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Explore',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          defaultFormField(
                            //autofocus: true,
                            controller:searchController ,
                            type: TextInputType.text,
                            onChanged: (value)
                            {
                              NewsCubit.get(context).getSearch(value);
                            },//557395
                            validate: (String? value){
                              if(value!.isEmpty){
                                return'search must not be empty';
                              }else{
                                return null;
                              }
                            },
                            label: 'What are you looking for?',
                            prefix: Icons.search,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ArticleBuilder(list,state, context,isSearch: true),
              ],
            ),
          ),
        );
      },

    );
  }
}
