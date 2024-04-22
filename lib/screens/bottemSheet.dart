import 'dart:ui';

import 'package:flutter/material.dart';

class bottemSheet extends StatelessWidget {
  const bottemSheet({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 0.09),
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 300,
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CustomScrollView(controller: controller, slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 32),
                  height: 5,
                  width: 68,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'share',
                      style: TextStyle(
                          fontFamily: 'GB', fontSize: 32, color: Colors.white),
                    ),
                    Image.asset('images/icon_share_bottomsheet.png'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('images/icon_search_navigation.png'),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: 'search User',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return _getItemGrid();
            })),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 110),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 50))
        ]),
        Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {},
                  child: Text(
                    'share',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )),
            )),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset('images/profile.png'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'AmirAhmad Adibi',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'GB', fontSize: 13, color: Colors.white),
        ),
      ],
    );
  }
}
