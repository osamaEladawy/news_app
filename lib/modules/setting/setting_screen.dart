import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/cubit/cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});



  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context , state){},
       builder: (context , state)
       {
         bool lights = !AppCubit.get(context).isDark;
         return Scaffold(
           body: Center(child:
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   height: 68,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: AppCubit.get(context).isDark ?   Colors.grey : const Color(0xFF43658b),
                   ),
                   child: Padding(
                     padding: EdgeInsets.symmetric(
                       vertical: 14,
                       horizontal: size.width*0.02,
                     ),
                     child: Row(
                       children: [
                         Text(
                           'DarkMode',
                           style: TextStyle(
                               color:AppCubit.get(context).isDark ?  const Color(0xFF292826):const Color(0xFFFFFFFF),
                               fontSize: 16,
                               fontWeight: FontWeight.bold

                           ),
                         ),
                         const Spacer(),
                         Switch.adaptive(
                             value: lights,
                             onChanged: (bool value){
                               AppCubit.get(context).changeAppMode();
                               setState(() {
                                 lights = value;
                               });
                             })

                       ],
                     ),
                   ),
                 ),
                 const SizedBox(height: 20,),
                 Container(
                   height: 68,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: AppCubit.get(context).isDark ?   Colors.grey : const Color(0xFF43658b),
                   ),
                   child: Padding(
                     padding: EdgeInsets.symmetric(
                       vertical: 14,
                       horizontal: size.width*0.02,
                     ),
                     child: Row(
                       children: [
                         Text(
                           'Country',
                           style: TextStyle(
                               color:AppCubit.get(context).isDark ?  const Color(0xFF292826):const Color(0xFFFFFFFF),
                               fontSize: 16,
                               fontWeight: FontWeight.bold

                           ),
                         ),
                         const Spacer(),
                         // Icon(
                         //   Icons.list,
                         //   color:AppCubit.get(context).isDark ?  Color(0xFF292826):Color(0xFFFFFFFF),
                         // ),
                         PopupMenuButton(
                           // icon: Icon(Icons.confirmation_num_sharp),
                             itemBuilder: (context)=>[
                               const PopupMenuItem(
                               value: 'eg',
                               child: Text('🇪🇬   Egypt'),
                               ),
                               const PopupMenuItem(
                                 value: 'us',
                                 child: Text('🇱🇷   United States'),
                               ),
                               const PopupMenuItem(
                                 value: 'in',
                                 child: Text('🇮🇳   India'),
                               ),
                               const PopupMenuItem(
                                 value: 'jp',
                                 child: Text('🇯🇵   Japan'),
                               ),
                               const PopupMenuItem(
                                 value: 'ua',
                                 child: Text('🇺🇦   Ukraine'),
                               ),
                               const PopupMenuItem(
                                 value: 'ar',
                                 child: Text('🇦🇷   Argentina'),
                               ),
                             ],
                           onSelected: (String newValue){
                             setState(() {
                               NewsCubit.get(context).clicCountry = newValue;
                             });
                             NewsCubit.get(context).getData();
                           },
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),),
         );
       },
    );
  }
}
