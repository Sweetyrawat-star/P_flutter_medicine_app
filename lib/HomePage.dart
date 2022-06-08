import 'package:flutter/material.dart';
import 'package:medicine/DetailScreen.dart';
import 'package:medicine/data.dart';
import 'package:medicine/drawerutils.dart';
import 'package:medicine/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar _getTabBar() {
    return TabBar(
      labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
      indicatorColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey[500],
      isScrollable: true,
      tabs: choices.map((Choice choice) {
        return Tab(
          text: choice.title,
          icon: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                //Color(0xff74f5f3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                choice.icon,
                color: Color(0xff5FDECA),
              )),
        );
      }).toList(),
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
          children: tabs,
          controller: tabController,

    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      key: _scaffoldKey,
        drawer: Drawer(
          child: DrawerUtil(),
        ),
        body: ListView(
            children: <Widget>[
      Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0xff74f5f3),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: themeChanger.getTheme() == ThemeData.dark()
                            ? Colors.black12
                            : Colors.white,
                        //Color(0xff74f5f3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Icon(
                          Icons.sort,
                          color: themeChanger.getTheme() == ThemeData.dark()
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 40, right: 40, top: 50.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 8,
                      child: Container(
                        width: 250,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            suffixIcon: Icon(Icons.search,
                                color: themeChanger.getTheme() == ThemeData.dark()
                                    ? Colors.white
                                    : Colors.black, size: 30),
                            hintText: "Search Here",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _getTabBar(),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
        Container(
            height: 660,
            //padding: EdgeInsets.only(bottom: 160.0),
            child: _getTabBarView(
              <Widget>[
                buildMedicine(),
                buildFistAids(),
                buildFindDoctor(),
                buildEmergency(),
              ],
            )),
     // buildMedicine(),
    ]));
  }

  buildMedicine() {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    height: 500,
                    width: 180,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        itemCount: AppData.medicine.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                              children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: 130,
                              width: 160,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      AppData.medicine[index].name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      AppData.medicine[index].category,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Rp ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          AppData.medicine[index].price
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                              image: AppData.medicine[index].image,
                                              text: AppData.medicine[index].name,
                                              price: AppData.medicine[index].price.toString(),
                                              tutorial: AppData.medicine[index].category,
                                            )));
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xff74f5f3),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]);
                        })
                    ))
          ],
        ),
        Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 500,
                width: 180,
                decoration: BoxDecoration(
                  color: Color(0xffDAF8FB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: AppData.medicine.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 130,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Color(0xff74f5f3),
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image:
                                    AssetImage(AppData.medicine[index].image)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 10.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

buildMedicine() {
  return Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 500,
                  width: 180,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: AppData.medicine.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 130,
                                width: 160,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        AppData.medicine[index].name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        AppData.medicine[index].category,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Rp ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            AppData.medicine[index].price
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                                image: AppData.medicine[index].image,
                                                text: AppData.medicine[index].name,
                                                price: AppData.medicine[index].price.toString(),
                                                tutorial: AppData.medicine[index].category,
                                              )));
                                            },
                                            child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff74f5f3),
                                                  borderRadius:
                                                  BorderRadius.circular(10.0),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                      })
              ))
        ],
      ),
      Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 500,
              width: 180,
              decoration: BoxDecoration(
                color: Color(0xffDAF8FB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: AppData.medicine.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xff74f5f3),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image:
                              AssetImage(AppData.medicine[index].image)),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 8.0, right: 10.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    ],
  );
}

buildFistAids() {
  return Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 500,
                  width: 180,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: AppData.fistAids.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 130,
                                width: 160,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        AppData.fistAids[index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.location_on,color: Colors.black,),
                                          Text(
                                            AppData.fistAids[index].category,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Rp ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            AppData.fistAids[index].price,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                                image: AppData.fistAids[index].image,
                                                text: AppData.fistAids[index].name,
                                                price: AppData.fistAids[index].price,
                                                tutorial: AppData.fistAids[index].category,
                                              )));
                                            },
                                            child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff74f5f3),
                                                  borderRadius:
                                                  BorderRadius.circular(10.0),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                      })
              ))
        ],
      ),
      Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 500,
              width: 180,
              decoration: BoxDecoration(
                color: Color(0xffDAF8FB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: AppData.fistAids.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xff74f5f3),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image:
                              AssetImage(AppData.fistAids[index].image),fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 8.0, right: 10.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    ],
  );
}

buildFindDoctor() {
  return Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 500,
                  width: 180,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: AppData.findDoctor.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 130,
                                width: 160,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        AppData.findDoctor[index].name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        AppData.findDoctor[index].category,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Rp ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            AppData.findDoctor[index].price,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                                image: AppData.findDoctor[index].image,
                                                text: AppData.findDoctor[index].name,
                                                price: AppData.findDoctor[index].price,
                                                tutorial: AppData.findDoctor[index].category,
                                              )));
                                            },
                                            child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff74f5f3),
                                                  borderRadius:
                                                  BorderRadius.circular(10.0),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                      })
              ))
        ],
      ),
      Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 500,
              width: 180,
              decoration: BoxDecoration(
                color: Color(0xffDAF8FB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: AppData.findDoctor.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xff74f5f3),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image:
                              AssetImage(AppData.findDoctor[index].image)),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 8.0, right: 10.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    ],
  );
}

buildEmergency() {
  return Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 500,
                  width: 180,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: AppData.emergency.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 130,
                                width: 160,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        AppData.emergency[index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.location_on,color: Colors.black,),
                                          Text(
                                            AppData.emergency[index].category,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 28.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Rp ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            AppData.emergency[index].price
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                                image: AppData.emergency[index].image,
                                                text: AppData.emergency[index].name,
                                                price: AppData.emergency[index].price.toString(),
                                                tutorial: AppData.emergency[index].category,
                                              )));
                                            },
                                            child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff74f5f3),
                                                  borderRadius:
                                                  BorderRadius.circular(10.0),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                      })
              ))
        ],
      ),
      Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 500,
              width: 180,
              decoration: BoxDecoration(
                color: Color(0xffDAF8FB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: AppData.emergency.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xff74f5f3),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image:
                              AssetImage(AppData.emergency[index].image),fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 8.0, right: 10.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    ],
  );
}


class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(
    title: 'Medicine',
    icon: Icons.mouse,
  ),
  const Choice(title: 'Fist Aids', icon: Icons.markunread_mailbox),
  const Choice(title: 'Find Doctor', icon: Icons.group),
  const Choice(title: 'Emergency', icon: Icons.local_hotel),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    //final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: Color(0xff74f5f3)),
            Text(choice.title, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
