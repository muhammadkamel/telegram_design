import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> with TickerProviderStateMixin {
  bool isMyUser = true;

  bool isLongTaped = false;

  AnimationController _animationBuilder;
  Animation<double> _animation;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  // Animation<double> _animationDouble;

  @override
  void initState() {
    super.initState();
    _animationBuilder = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _animation = CurvedAnimation(
      curve: Curves.decelerate,
      parent: _animationBuilder,
      reverseCurve: Curves.easeInExpo,
    )..addStatusListener((status) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationBuilder.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  _repeatAnimation() {
    if (isLongTaped == false) {
      _animationBuilder.forward();
      isLongTaped = false;
    } else if (isLongTaped == true) {
      _animationBuilder.reverse();
      isLongTaped = true;
    }
  }

  // on refresh
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff151E27),
      appBar: AppBar(
        backgroundColor: Color(0xff212D3B),
        title: Text('Chats'),
      ),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                // overscroll.dispatch(context);
                // overscroll.visitAncestor(context);
                return overscroll.leading;
              },
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                enablePullDown: true,
                enablePullUp: false,
                header: MaterialClassicHeader(
                  color: Colors.white,
                  backgroundColor: Colors.blueGrey,
                ),
                child: ListView.builder(
                  itemCount: 15,
                  // padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          // color: Colors.red,
                          // color: isLongTaped
                          //     ? Colors.blueGrey.withOpacity(0.3)
                          //     : Colors.transparent,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.blueGrey.withOpacity(0.3),
                            onTap: () {
                              print('One tap!');
                              setState(() {
                                // isLongTaped = !isLongTaped;
                                if (isLongTaped) {
                                  _repeatAnimation();
                                  isLongTaped = false;
                                }
                                print(isLongTaped.toString());
                              });
                            },
                            onLongPress: () async {
                              print('Looooong taped');
                              setState(() {
                                _repeatAnimation();
                                isLongTaped = !isLongTaped;
                                print(isLongTaped.toString());
                              });
                            },
                            child: Container(
                              // width: _screenSize.width,
                              // height: 30,
                              // color: Colors.amber,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              // color: Colors.transparent,
                              child: Row(
                                children: [
                                  Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'MK'.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: -3,
                                        child: ScaleTransition(
                                          scale: _animation,
                                          child: SizedBox(
                                            width: 23,
                                            height: 23,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ),
                                            // child: CircleAvatar(
                                            //   backgroundColor: Colors.green,
                                            //   child: Icon(
                                            //     Icons.check,
                                            //     size: 16,
                                            //   ),
                                            // ),
                                          ),
                                          // child: Container(
                                          //   width: 23,
                                          //   height: 23,
                                          //   decoration: const BoxDecoration(
                                          //     color: Colors.green,
                                          //     shape: BoxShape.circle,
                                          //     // border: Border.all(
                                          //     //   width: 1,
                                          //     //   color: Colors.black,
                                          //     // ),
                                          //   ),
                                          // ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Chat Room',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(height: 3.0),
                                      Text(
                                        'Chatttting',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black45,
                          height: 2.3,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
