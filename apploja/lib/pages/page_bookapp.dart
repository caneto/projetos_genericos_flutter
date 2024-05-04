import 'package:flutter/material.dart';

class PageBookapp extends StatelessWidget {
 PageBookapp({super.key});

 final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.all(2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      backgroundColor: Colors.red,

    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Book Store",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Top Book for this year",
              style: TextStyle(color: Colors.black87, fontSize: 30.0),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "This is a selection of the most rated Book of this year, pick your favorite one",
              style: TextStyle(
                fontSize: 18.0,
                height: 1.5,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/non-fiction-business-kindle-book-cover-design-template-2fac9a2b8a04f729d06c809ad50214b6.jpg?ts=1561422624",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  height: 200.0,
                  width: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Creative Bussines Start up",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        "By Jen Brazel",
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        "8.5/10",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: flatButtonStyle,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Details",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "Top Recommendation",
              style: TextStyle(fontSize: 22.0),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0, top: 8.0, bottom: 8.0),
                    child: SizedBox(
                      height: 80.0,
                      width: 150.0,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTwyQeaqZLovu4Hc5hUjTC2u1mK0h85w4jnZkC8kVT76-skY94v&usqp=CAU",
                        fit: BoxFit.fill,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0, top: 8.0, bottom: 8.0),
                    child: SizedBox(
                      height: 80.0,
                      width: 150.0,
                      child: Image.network(
                        "https://cdn.pastemagazine.com/www/system/images/photo_albums/best-book-covers-july-2019/large/bbcjuly19verynice.jpg?1384968217",
                        fit: BoxFit.fill,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0, top: 8.0, bottom: 8.0),
                    child: SizedBox(
                      height: 80.0,
                      width: 150.0,
                      child: Image.network(
                        "https://bookcoverdesigns.eu/wp-content/uploads/2018/02/Self-Help-003a.jpg",
                        fit: BoxFit.fill,
                        height: 100.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
   
  }
}
