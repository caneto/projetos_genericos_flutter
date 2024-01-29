import 'package:flutter/material.dart';
import '../components/my_list.dart';

class TenDays extends StatefulWidget {
  const TenDays({super.key});

  @override
  State<TenDays> createState() => _TenDaysState();
}

class _TenDaysState extends State<TenDays> {

  @override
  Widget build(BuildContext context) {

    const Color sunColor=Color(0xffFFCC33);

    return  const SingleChildScrollView(
      child: Column(
        children: [
          MyList(title:'Today', subTitle:'Partly cloud', icon:Icons.cloud,iconColor:Colors.grey, day:'30°', night:'18°'),
          Divider(color:Colors.black12,),
          MyList(title:'Monday', subTitle:'Rain', icon:Icons.cloudy_snowing,iconColor:Colors.grey, day:'20°', night:'7°'),
          Divider(color:Colors.black12,),
          MyList(title:'Tuesday', subTitle:'Mostly sunny', icon:Icons.circle,iconColor:sunColor, day:'27°', night:'15°'),
          Divider(color:Colors.black12,),
          MyList(title:'Wednesday', subTitle:'Sunny', icon:Icons.circle,iconColor:sunColor, day:'29°', night:'19°'),
          Divider(color:Colors.black12,),
          MyList(title:'Thursday', subTitle:'Sunny', icon:Icons.circle,iconColor:sunColor, day:'29°', night:'17°'),
          Divider(color:Colors.black12,),
          MyList(title:'Friday', subTitle:'Sunny', icon:Icons.circle,iconColor:sunColor, day:'31°', night:'20°'),
          Divider(color:Colors.black12,),
          MyList(title:'Saturday', subTitle:'Sunny', icon:Icons.circle,iconColor:sunColor, day:'26', night:'12°'),
          Divider(color:Colors.black12,),
          MyList(title:'Sunday', subTitle:'Rain', icon:Icons.cloudy_snowing,iconColor:Colors.grey, day:'17°', night:'9°'),
          Divider(color:Colors.black12,),
          MyList(title:'Monday', subTitle:'Cloud', icon:Icons.cloud,iconColor:Colors.grey, day:'21°', night:'11°')
        ],
      ),
    );
  }
}
