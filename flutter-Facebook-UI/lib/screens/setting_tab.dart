import 'package:facebook/components/menu_container.dart';
import 'package:facebook/components/my_container.dart';
import 'package:facebook/screens/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEef5f6),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu',
                  style: TextStyle(fontSize: 27),
                ),
                Row(
                  children: [
                    MyContainer(icon: Icons.settings),
                    SizedBox(width: 10),
                    MyContainer(icon: FontAwesomeIcons.magnifyingGlass)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 5),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfileTab()));
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black26,
                              border: Border.all(color: Colors.black12),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/profilePic.jpg'))),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Noman Khan',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const MyContainer(icon: FontAwesomeIcons.angleDown)
                ],
              ),
            ),
          ),
          const Text('All shortcuts'),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuContainer(
                        icon: FontAwesomeIcons.tv,
                        iconColor: Colors.blue,
                        text: 'Video on Watch'),
                    MenuContainer(
                        icon: FontAwesomeIcons.bookmark,
                        iconColor: Colors.pink,
                        text: 'Saved'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuContainer(
                        icon: FontAwesomeIcons.clapperboard,
                        iconColor: Colors.deepOrange,
                        text: 'Reels'),
                    MenuContainer(
                        icon: FontAwesomeIcons.userGroup,
                        iconColor: Colors.lightBlueAccent,
                        text: 'Groups'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuContainer(
                        icon: FontAwesomeIcons.users,
                        iconColor: Colors.blue,
                        text: 'Friends'),
                    MenuContainer(
                        icon: FontAwesomeIcons.calendarCheck,
                        iconColor: Colors.cyanAccent,
                        text: 'Feeds'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuContainer(
                        icon: FontAwesomeIcons.store,
                        iconColor: Colors.green,
                        text: 'Marketplace'),
                    MenuContainer(
                        icon: FontAwesomeIcons.clockRotateLeft,
                        iconColor: Colors.pink,
                        text: 'Memories'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuContainer(
                        icon: FontAwesomeIcons.gauge,
                        iconColor: Colors.orange,
                        text: 'Dashboard'),
                    MenuContainer(
                        icon: FontAwesomeIcons.calendar,
                        iconColor: Colors.lightBlueAccent,
                        text: 'Events'),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text('See more'),
                  ),
                ),
              ),
              //logout
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text('Log Out'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
