import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TextEditingController _searchController = TextEditingController();
  String name = '';

  // initalSearch() async {
  //   if (name == '') {
  //     print('I am null - search box');
  //   } else if (name != null) {
  //     print('I am from firebase');
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('name', isEqualTo: name)
  //         .get()
  //         .then((val) {
  //       setState(() {
  //         _querySnapshot = val;
  //       });
  //     });
  //   }
  // }

  // setSearchParam(String caseNumber) {
  //   List<String> caseSearchList = List();
  //   String temp = "";
  //   for (int i = 0; i < caseNumber.length; i++) {
  //     temp = temp + caseNumber[i];
  //     caseSearchList.add(temp);
  //   }
  //   return caseSearchList;
  // }

  @override
  void initState() {
    super.initState();
    // initalSearch();
  }

  @override
  void dispose() {
    // _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    var appBarSize = _screenSize.height * 0.10;
    var listViewSize = _screenSize.height * 0.86;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _screenSize.width,
              height: appBarSize,
              // color: Color(0xffe0e0e0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: _screenSize.width * 0.95,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: _screenSize.width * 0.70,
                          child: TextFormField(
                            // controller: _searchController,
                            onChanged: (String val) {
                              setState(() {
                                if (val == null || val == '') {
                                  print('Nullllll');
                                  name = '';
                                }
                                name = val;
                                // getCasesDetailList(val);
                                // setSearchParam(val);
                              });
                            },
                            decoration: kInputDecoration.copyWith(
                                hintText: 'Search...'),
                          ),
                        ),
                        Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () async {
                              // initalSearch();
                              // if (_searchController.text == '') {
                              //   print('I am null - search box');
                              // } else if (_searchController.text != null) {
                              //   print('I am from firebase');
                              //   await FirebaseFirestore.instance
                              //       .collection('users')
                              //       .where('name',
                              //           isEqualTo: _searchController.text)
                              //       .get()
                              //       .then((val) {
                              //     setState(() {
                              //       _querySnapshot = val;
                              //     });
                              //   });
                              // }
                            },
                            icon: Icon(Icons.search),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Container(
              color: Colors.white,
              height: listViewSize,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SearchTile(
                      //   userName: _querySnapshot.docs[index].get('name'),
                      //   userEmail:
                      //       _querySnapshot.docs[index].get('email'),
                      // ),
                      StreamBuilder(
                        // stream: _getStream(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            // if (name == '') {
                            //   print('HI ${snapshot.data.docs}');
                            // }
                            // initalSearch();
                            return Container(
                              height: _screenSize.height * 0.68,
                              child: ListView.builder(
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    return name != ''
                                        ? Container(
                                            height: 75,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 21),
                                            decoration: BoxDecoration(
                                              color: Color(0xfff2f3f0),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(7.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                snapshot.data.docs[index]
                                                    .get('name'),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          )
                                        : Text('');
                                  }),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        //   body: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Container(
        //             width: _screenSize.width * 0.70,
        //             child: TextFormField(
        //               controller: _searchController,
        //               decoration:
        //                   kInputDecoration.copyWith(hintText: 'Search...'),
        //             ),
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               initalSearch();
        //             },
        //             icon: Icon(Icons.search),
        //           ),
        //         ],
        //       ),
        //       StreamBuilder(
        //         stream:
        //             FirebaseFirestore.instance.collection('users').snapshots(),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData) {
        //             return Center(
        //               child: Text(
        //                 snapshot.data.docs[0]['name'],
        //               ),
        //             );
        //           } else {
        //             return Center(
        //               child: CircularProgressIndicator(),
        //             );
        //           }
        //         },
        //       ),
        //     ],
        //   ),
      ),
    );
  }
}
