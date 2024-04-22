import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScrean extends StatelessWidget {
  const SearchScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Widget_getSearchBox(),
        ),
        SliverToBoxAdapter(
          child: _getStoryList(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('images/item$index.png'),
                  ),
                ),
              );
            }), childCount: 10),
            gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ]),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/item$index.png'),
                ),
              ),
            );
          }), childCount: 10),
          gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(2, 1),
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ]),
        ),
      ])),
    );
  }

  Widget _getContent() {
    return Column(children: [
      _getStoryList(),
    ]);
  }

  Widget_getSearchBox() {
    return Container(
      margin: EdgeInsets.only(top: 15, right: 18, left: 18),
      height: 46,
      decoration: BoxDecoration(
        color: Color(0xff272B40),
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
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Image.asset('images/icon_scan.png'),
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 23,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  color: Color(0xff272B40),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                  child: Text(
                    'life $index',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'GM', fontSize: 13),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
