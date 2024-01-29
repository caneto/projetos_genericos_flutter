import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/src/screens/Today.dart';
import 'package:weather/src/screens/Tomarrow.dart';
import 'package:weather/src/screens/ten_days.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final buscaEC = TextEditingController();

  String location = "Rio de Janeiro";

  @override
  Widget build(BuildContext context) {
    const Color myColor = Color(0xff0f9dd5);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: myColor,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark),
          backgroundColor: myColor,
          centerTitle: true,
          title: Container(
            height: 45,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              onSubmitted: (busca) {
                location = busca;
              },
              controller: buscaEC,
              decoration: const InputDecoration(
                hintText: 'Buscar sua Localização',
                prefixIcon: Icon(
                  Icons.search,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    foregroundImage: AssetImage('assets/foto.png'),
                  ),
                ),
              ),
            ),
          ),
          bottom: const TabBar(
              indicatorWeight: 10,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              labelPadding: EdgeInsets.all(5),
              tabs: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  'Tomorrow',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  '10 Days',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Today(location: location,),
            const Tomarro(),
            const TenDays(),
          ],
        ),
      ),
    );
  }
}
