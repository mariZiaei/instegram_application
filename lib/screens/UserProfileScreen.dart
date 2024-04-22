import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1C1F2E),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, isScrold) {
                return [
                  SliverAppBar(
                    backgroundColor: Color(0xff1C1F2E),
                    toolbarHeight: 50,
                    pinned: true,
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(top: 18, right: 18),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      )
                    ],
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(15),
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                              color: Color(0xff1C1F2E),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                        )),
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                      'images/item1.png',
                      fit: BoxFit.cover,
                    )),
                  ),
                  SliverToBoxAdapter(
                    child: _getHeadr(),
                  ),
                  SliverPersistentHeader(
                      floating: false,
                      pinned: false,
                      delegate: TabBarViewDelegated(TabBar(
                        indicatorColor: Colors.pink,
                        indicatorWeight: 5,
                        tabs: [
                          Tab(
                            icon: Image.asset('images/icon_tab_bookmark.png'),
                          ),
                          Tab(
                            icon: Image.asset('images/icon_tab_posts.png'),
                          )
                        ],
                      )))
                ];
              },
              body: TabBarView(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                        sliver: SliverGrid(
                          delegate:
                              SliverChildBuilderDelegate(((context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(2, 2),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                                QuiltedGridTile(1, 1),
                              ]),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.blueAccent,
                  ),
                ],
              )),
        ));
  }

  Widget _getHeadr() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 70,
          height: 70,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Image.asset('images/profile.png'),
          ),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.pink),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'امیر احمد ادیبی',
                    style: TextStyle(
                        fontFamily: 'SM', fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'amirAhmad Adibi',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            )),
        Spacer(),
        Image.asset('images/icon_profile_edit.png'),
      ]),
    );
  }
}

class TabBarViewDelegated extends SliverPersistentHeaderDelegate {
  TabBarViewDelegated(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height + 8;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
