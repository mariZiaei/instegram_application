import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_instegram/screens/bottemSheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1F2E),
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/mood.png'),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      var bottom2 = MediaQuery.of(context).viewInsets.bottom;
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: DraggableScrollableSheet(
                            initialChildSize: 0.4,
                            maxChildSize: 0.6,
                            minChildSize: 0.2,
                            builder: (Context, controler) {
                              return bottemSheet(
                                controller: controler,
                              );
                            }),
                      );
                    });
              },
              child: Text('BottemShet'),
            ),
          ),
          SliverToBoxAdapter(
            child: _getStoryList(),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  _getHeaderIcon(),
                  SizedBox(
                    height: 10,
                  ),
                  _getPostContent(),
                ],
              );
            },
            childCount: 30,
          ))
        ]),
      ),
    );
  }
}

Widget _getStoryList() {
  return Container(
    height: 130,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getaddStoryBox() : _getStoryListBox();
        }),
  );
}

Widget _getPostList() {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            _getHeaderIcon(),
            SizedBox(
              height: 10,
            ),
            _getPostContent(),
          ],
        );
      });
}

Widget _getPostContent() {
  return Container(
      height: 490,
      width: 360,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Positioned(
          top: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('images/post_cover.png'),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Image.asset('images/icon_video.png'),
        ),
        Positioned(
            bottom: 60,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 300,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('images/icon_hart.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('2.5K'),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('images/icon_comments.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('1.5K'),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('images/icon_share.png'),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('images/icon_save.png'),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ]));
}

Widget _getHeaderIcon() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      children: [
        _getStoryBox(),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AmirahmadAdibi',
                style: TextStyle(
                    fontFamily: 'GB', fontSize: 12, color: Colors.white),
              ),
              Text(
                'برنامه نویس موبایل',
                style: TextStyle(
                    fontFamily: 'SM', fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        Spacer(),
        Image.asset('images/icon_menu.png'),
      ],
    ),
  );
}

Widget _getStoryBox() {
  return DottedBorder(
    borderType: BorderType.RRect,
    radius: Radius.circular(12),
    padding: EdgeInsets.all(6),
    color: Color(0xffF38353),
    strokeWidth: 2,
    dashPattern: [50, 10],
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
        height: 40,
        width: 40,
        child: Image.asset('images/profile.png'),
      ),
    ),
  );
}

Widget _getStoryListBox() {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(6),
            color: Color(0xffF38353),
            strokeWidth: 2,
            dashPattern: [50, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: 60,
                width: 60,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Test1',
            style: TextStyle(color: const Color.fromARGB(255, 203, 191, 205)),
          )
        ],
      ));
}

Widget _getaddStoryBox() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
    child: Column(
      children: [
        Container(
          width: 64,
          height: 70,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 237, 237),
              borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset('images/icon_plus.png'),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'add Story',
          style: TextStyle(color: const Color.fromARGB(255, 203, 191, 205)),
        )
      ],
    ),
  );
}
