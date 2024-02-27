import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widget/app_large_text.dart';
import 'detailPage2.dart';
import 'detail_page.dart';
import 'explore.dart';
import 'google_signin.dart';
import 'main_page.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  final user=FirebaseAuth.instance.currentUser!;
  late TabController _tabController;
  bool _isBookmarked = false;

  final String category = 'historical and cultural';

  Future<List<Map<String, dynamic>>> fetchImages(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }



  }
  final String category2 = 'religious';

  Future<List<Map<String, dynamic>>> fetchImages2(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(
        Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }
  }
  final String category3 = 'landscapes';

  Future<List<Map<String, dynamic>>> fetchImages3(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }

  }
  final String category4 = 'hotels';
  Future<List<Map<String, dynamic>>> fetchImages4(String categoryParam) async {
    final String serverUrl = 'https://ethiotravelapp.000webhostapp.com/place/index.php';
    final response = await http.get(Uri.parse('$serverUrl?category=$categoryParam'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<Map<String, dynamic>> images = [];
      for (final data in jsonData) {
        final dynamic picUrl = data['PIC_URL'];
        final dynamic id = int.parse(data['ID'].toString());
        if (picUrl != null) {
          images.add({
            'url': picUrl.toString(),
            'id': id,
          });
        }
      }
      return images;
    } else {
      throw Exception('Failed to fetch images');
    }

  }


  final List<String> images = [
    "images/categories/Hist&cal/lalibela.jpg",
    "images/categories/Hist&cal/fassil.jpg",
    "images/categories/Hist&cal/sof-omar.jpg",
    "images/categories/landscapes/blue-1.jpg",
    "images/categories/landscapes/danakil-2.jpg",
    "images/categories/landscapes/Simien_Mountain.jpg",

  ];



  final List<String> names = [
    "Lalibela",
    "Gonder",
    "sof-omar",
    "Blue Nile",
    "Danakil",
    "Simien_Mountain",
  ];
  final List<String> locations= [
    " North Wollo",
    " Amhara",
    "East of Ginnir",
    "Tigray Region ",
    "Afar Region",
    "Amhara Region",
  ];
  final List<String> map=[


  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set the height of the AppBar
          child: AppBar(
            backgroundColor: Colors.teal, // Set the background color of the AppBar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          //  title: Center(child: Text('Discover Ethiopia')),
          ),
        ),
      body:SingleChildScrollView(

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Container(
                    // padding: const EdgeInsets.only(top: 70, left: 10),
                    child: Row(
                      children: [
                        // Builder(
                        //   builder: (context) => IconButton(
                        //     icon: Icon(Icons.menu),
                        //     onPressed: () {
                        //       Scaffold.of(context).openDrawer();
                        //     },
                        //   ),
                        // ),
                        // Expanded(child: Container()),
                        // Text("Hello, "+user.displayName!,
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.teal,
                        //   ),),
                        // Container(
                        //   width: 50,
                        //   height: 50,
                        //   margin: const EdgeInsets.only(right: 20),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.grey.withOpacity(0.5),
                        //     image: DecorationImage(
                        //       image: NetworkImage(
                        //         user.photoURL!,
                        //       ),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover".tr(), color: Colors.black54),
                  ),
                  SizedBox(height: 30),
                  // tabbar
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 20, right: 20,),
                        controller: _tabController,
                        labelColor: Colors.teal,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(color: Colors.teal, radius: 5),
                        tabs: [
                          Tab(text: "Historical and cultural places"),
                          Tab(text: "Religious"),
                          Tab(text: "landscapes"),
                          Tab(text: "Hotel and resorts"),
                          // Tab(text: "rural"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 250,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages(category),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages2(category2),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages3(category3),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchImages4(category4),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                final List<Map<String, dynamic>> images = snapshot.data!;
                                return Row(
                                  children: images.map((image) {
                                    final String imageUrl = image['url'];
                                    final int imageId = image['id'];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15, top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DetailPage(id: imageId,),)
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            imageUrl,
                                            width: 250,
                                            height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),



                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AppLargeText(text: "Popular sites", size: 22, color: Colors.teal),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.7,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage2(
                                  image: images[index], // Pass the image asset path as a parameter
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                AppText(
                                  text: names[index],
                                  color: Colors.black87,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        // Icon(
                                        //   Icons.location_on,
                                        //   color: Colors.grey,
                                        // ),
                                        SizedBox(width: 5),

                                           AppText(
                                            text:locations[index],
                                            color: Colors.grey,
                                            size: 16,
                                          ),

                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]

            ),


      ),



        drawer: Drawer(
          child: Container(
            color: Colors.teal,
            child: Column(
              children: <Widget>[
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(user.photoURL!) as ImageProvider<Object>,
                      ),
                      SizedBox(height: 10),
                      // Text(
                      //   'User Name',
                      //   style: TextStyle(
                      //     color: Colors.teal[900],
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      SizedBox(height: 5),
              Text("Hello "+user.displayName!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),),]
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Bookmarks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to Bookmarks screen
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to Settings screen
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Developers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to Settings screen
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        final provider =
                        Provider.of<GoogleSign>(context, listen: false);
                        provider.logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Explore()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
  );

  }
}

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  AppText({
    required this.text,
    this.color = Colors.black,
    this.size = 16,
    this.weight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color , required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
// TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }
}

class _CirclePainter extends BoxPainter {
  @override
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset CircleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + CircleOffset, radius, _paint);
  }
}
// SizedBox(
//   height: 20,
// ),
// ListTile(
//   leading: Icon(Icons.gps_fixed),
//   title: Text('Map'),
//   onTap: () {
//     Navigator.push(
//       context,
//       // MaterialPageRoute(builder: (context) => MapPage(ID: id,)),
//     );
//   },
// ),