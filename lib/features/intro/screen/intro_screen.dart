
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/constant.dart';
import '../controller/onboard_model.dart';



class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/intro_3.png',
      text: "EMPLOYEE ATTENDANCE",
      desc:
      "Take a selfie to make attendance.\nSuper easy",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/intro_2.png',
      text: "EMPLOYEE TRACKING",
      desc:
      "Know were your employee location and track them in real time",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/intro_4.png',
      text: "TIMESHEET MANAGEMENT",
      desc:
      "Allows employee to mention their daily work done points/tasks along with time as well as proof of image ( if required).",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/intro_1.png',
      text: "SALARY CALCULATION",
      desc:
      "Auto calculate employees salary as well as export and share pay slip in PDF file ",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    /*  appBar: AppBar(
        centerTitle: true,
       // title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF110C55),
                    Color(0xFF19CDEB),
                    Color(0xFF876CE9)

                  ])
          ),
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          /*decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF110C55),
                  Color(0xFF19CDEB),
                Color(0xFF876CE9)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),*/
          child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          //width: 100.00,
                          height: MediaQuery.of(context).size.height/1.5,
                          decoration: new BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white,
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            image: new DecorationImage(
                              image: ExactAssetImage(screens[index].img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          screens[index].text,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.radioCanada(
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Poppins',
                            color: index % 2 == 0 ? kblack : kblack,
                          ),
                        ),
                        Text(
                            screens[index].desc,
                            textAlign: TextAlign.center,
                            style:GoogleFonts.gruppo(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: index % 2 == 0 ? kblack : kblack,
                            )
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(
                                flex: 1,
                                child:TextButton(
                                    onPressed: () {
                                      _storeOnboardInfo();
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1, animation2) => OnBoard(),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration: Duration.zero,
                                        ),
                                      );
                                      /* Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => OnBoard()));*/
                                    },
                                    child: Container(
                                      height: 55,
                                      width: 55,
                                      padding:     EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: index % 2 == 0 ? kblue : kblue,
                                          borderRadius: BorderRadius.circular(15.0)),
                                      child: Center(
                                          child: Text(
                                            "Skip",
                                            style: GoogleFonts.roboto(
                                              color: currentIndex % 2 == 0 ? kwhite : kwhite,
                                            ),
                                          )
                                      ),

                                    )


                                )
                            ),
                            Expanded(
                                flex:1,
                                child: Container(
                                  // color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child:  Container(
                                      height: 10.0,
                                      child: ListView.builder(
                                        itemCount: screens.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                                                  width: currentIndex == index ? 25 : 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                    color: currentIndex == index
                                                        ? kbrown
                                                        : kbrown300,
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                ),

                                              ]
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: InkWell(
                                  onTap: () async {
                                    print(index);
                                    if (index == screens.length - 1) {
                                      await _storeOnboardInfo();
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1, animation2) => OnBoard(),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration: Duration.zero,
                                        ),
                                      );
                                      /*  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => OnBoard(),
                                      ),
                                  );*/
                                    }

                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 50),
                                      curve: Curves.linearToEaseOut,
                                    );
                                  },
                                  child: Container(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: index % 2 == 0 ? kblue : kblue,
                                        borderRadius: BorderRadius.circular(15.0)),
                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                      Text(
                                        "Next",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16.0,
                                            color: index % 2 == 0 ? kwhite : kwhite),
                                      ),

                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        width:35.0,
                                        height: 35.0,

                                        decoration:  BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white

                                        ),
                                        child:  ClipOval(
                                            child: Icon(
                                              Icons.arrow_forward_sharp,
                                              color: index % 2 == 0 ? kblack : kblack,
                                            )
                                        ),
                                      ),


                                    ]),
                                  ),
                                ),
                              )
                            ),

                          ],
                        )
                      ],
                    )

                  ],
                );
              }),
        )



      ),
    );
  }
}