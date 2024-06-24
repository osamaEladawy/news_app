import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../category/categories_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: ( context , state)  {},
      builder: ( context , state) {
        var list = NewsCubit.get(context).dataItem;
        return SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: AppCubit.get(context).isDark ?Colors.grey : const Color(0xFF43658b),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'latest news from all over the world',
                          style:Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),


                         const CategoriesListView(),


                      ],
                    ),
                  ),
                ),
              ),
              ArticleBuilder(list ,context,state),
            ],

          ),
        );
        // return ArticleBuilder(list ,context,state);
      },

    );
  }
}


