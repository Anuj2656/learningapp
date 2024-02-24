
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../main.dart';
import '../provider/auth_provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final myitems = [
    Image.asset('assets/img/1.png'),
    Image.asset('assets/img/2.webp'),
    Image.asset('assets/img/3.jpg'),
    Image.asset('assets/img/4.jpg'),
    Image.asset('assets/img/5.jpg'),
    Image.asset('assets/img/6.png'),
  ];

  int myCurrentIndex = 0;

  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();
    final ap = Provider.of<AuthProvider>(context, listen: false);
    void _handleMenuButtonPressed() {
      advancedDrawerController.showDrawer();
    }
    return AdvancedDrawer(
      backdrop: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF4666FF),
              const Color(0xFF4666FF).withOpacity(0.2)
            ],
          ),
        ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(0.8),
                  child: ClipOval(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              ap.userModel.profilePic),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(0.8),
                  child: Text(
                      style: const TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white),
                      ap.userModel.name),
                ),
                const Divider(height: 20.0, color: Colors.black),
              //  const SizedBox(height: 5.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListTileTheme(
                      textColor: Colors.white,
                      iconColor: Colors.black,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.phone_in_talk),
                            title: Text(
                              ap.userModel.phoneNumber,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(height: 10.0, color: Colors.black),
                          const SizedBox(height: 5.0),
                          ListTile(
                            leading: const Icon(
                                Icons.email),
                            title: Text(
                              ap.userModel.email,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(height: 20.0, color: Colors.black),
                          const SizedBox(height: 10.0),
                          ListTile(
                            leading: const Icon(Icons.contacts),
                            title: Text(
                              ap.userModel.bio,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(height: 40.0, color: Colors.black),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    ap.userSignOut().then(
                                          (value) =>
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (
                                                  context) => const homescreen(),
                                            ),

                                          ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0)),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    // Keep the button size minimum
                                    children: [
                                      Icon(
                                        Icons.exit_to_app,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'LOGOUT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                              child: const Text(
                                'Terms of Service | Privacy Policy',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
        //  brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          centerTitle: true,
          flexibleSpace:  Container(
            padding: const EdgeInsets.fromLTRB(5, 25, 5, 0),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF4666FF).withOpacity(0.1)
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black),
                        onPressed: () {
                      _handleMenuButtonPressed();
                        },
                      ),
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Search",style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.black),
                            onPressed: () {
                              // Add the Facebook button's action here
                            },
                          ),
                        ],
                      )
                    ],
                  ),

                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Discounts For Student", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      height: 200,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(seconds: 2),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
                    ),
                    items: myitems,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120.0),
                    child: AnimatedSmoothIndicator(activeIndex: myCurrentIndex,
                      count: myitems.length,
                      effect: WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 10,
                        dotColor: Colors.grey.shade200,
                        activeDotColor: Colors.grey.shade900,
                        paintStyle: PaintingStyle.fill,
                      ),),
                  ),

                   const Divider(),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Category",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        ),
                        Container(
                          height: 180,
                            width : MediaQuery.of(context).size.width,
                          child : Stack(
                            children:[
                              Container(
                                width:MediaQuery.of(context).size.width,
                                margin : const EdgeInsets.only(top:20),
                                height:120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/card.jpg",
                                    ),
                                    fit: BoxFit.fill
                                  ),
                                  boxShadow:  [
                                    BoxShadow(
                                      blurRadius: 40,
                                      offset:const Offset(8,10),
                                      color:const Color(0xFF6985e8).withOpacity(0.3),
                                    ),
                                    BoxShadow(
                                      blurRadius: 10,
                                      offset:const Offset(-1 , -5),
                                      color:const Color(0xFF6985e8).withOpacity(0.3),
                                    )
                                  ]
                                ),
                              ),
                              Container(
                                height: 200,
                                width:MediaQuery.of(context).size.width,
                                margin : const EdgeInsets.only(right:200,bottom:30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/figure.png",
                                        ),
                                    ),
                                ),
                              ),
                               Container(
                                 width:double.infinity,
                                 height: 100,
                                 margin: const EdgeInsets.only(left:150,top:50),
                                 child: Column(
                                   children:[
                                     const Text(
                                       "you are doing great",
                                           style:TextStyle(
                                     fontSize: 18,
                                             fontWeight: FontWeight.bold,
                                             color:Color(0xFF6588f4),
                                 ),
                                     ),
                                     const SizedBox(height: 10,),
                                     RichText(text: const TextSpan(
                                    text: "Keep It Up\n",
                                       style: TextStyle(
                                         color: Color(0xFFa2a2b1),
                                         fontSize: 16,
                                       ),
                                       children: [
                                         TextSpan(
                                         text:"stick to your plan",
                                     )
                                       ]
                                     ))
                                   ],
                                 )
                               )

                            ]
                          )
                        ),
                        const SizedBox(height: 10.0),
                        Column(
                          children: [
                            GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                                mainAxisExtent: 300,
                              ),
                              itemCount: 8,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return  GridB(index);
                              },
                            )
                         ],
                        ),

                      ],
                    ),
                  ),
              ],
          ),
            ),
        ),
      ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  final int index;
  const GridB(this.index,{Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "1st Semester Notes",

      "images":"assets/sem/2nd sem.jpg"
    },
    {
      "title": "2nd Semester Notes" ,
      "images":"assets/sem/1st sem.jpg"
    },
    {
      "title": "3rd Semester Notes ",
      "images":"assets/sem/3rd sem.jpg"
    },
    {
      "title": "4th Semester Notes",
      "images":"assets/sem/4th sem.png"
       },
    {
      "title": "5th Semester Notes",
      "images": "assets/sem/5th sem.jpg" },
    {
      "title": "6th Semester Notes",
      "images":"assets/sem/6th sem.jpg"
        },
    {
      "title": "7th Semester Notes",
      "images":"assets/sem/7th sem.jpg"
       },
    {
      "title": "8th Semester Notes",
      "images":"assets/sem/8th sem.jpg"
    },
  ];
  Future<void> _openScreen() async {
    final selectedGridItem = gridMap.elementAt(widget.index);

    switch (selectedGridItem['title']) {
      case "1st Semester Notes":
        Navigator.pushNamed(context, '/1st sem');
        break;
      case "2nd Semester Notes":
        Navigator.pushNamed(context, '/2nd sem');
        break;
      case "3rd Semester Notes":
        Navigator.pushNamed(context, '/3rd sem');
        break;
      case "4th Semester Notes":
        Navigator.pushNamed(context, '/4th sem');
        break;
      case "5th Semester Notes":
        Navigator.pushNamed(context, '/5th sem');
        break;
      case "6th Semester Notes":
        Navigator.pushNamed(context, '/6th sem');
        break;
      case "7th Semester Notes":
        Navigator.pushNamed(context, '/7th sem');
        break;
      case "8th Semester Notes":
        Navigator.pushNamed(context, '/8th sem');
        break;
      default:
      // Handle cases for other titles if needed
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:_openScreen,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16.0,
          ),
          color: const Color(0xFFD9D9FD),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Image.asset(
                "${gridMap.elementAt(widget.index)['images']}",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment:Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(widget.index)['title']}",
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1!
                          .merge(
                        const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






