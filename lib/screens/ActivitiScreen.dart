import 'package:flutter/material.dart';
import 'package:flutter_instegram/screens/modal/enum/ActivitiStatos.dart';

class ActivitiScreen extends StatefulWidget {
  const ActivitiScreen({super.key});

  @override
  State<ActivitiScreen> createState() => _ActivitiScreenState();
}

class _ActivitiScreenState extends State<ActivitiScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              color: Color(0xff1C1F2E),
              child: TabBar(
                  labelStyle: TextStyle(
                      fontFamily: 'GB', fontSize: 20, color: Colors.white),
                  controller: _tabController,
                  indicatorColor: Colors.pink,
                  indicatorWeight: 4,
                  tabs: [
                    Tab(
                      text: ('you'),
                    ),
                    Tab(
                      text: ('flowing'),
                    ),
                  ]),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                getSampelLis(),
                getSampelLis(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget getSampelLis() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'new',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => getRow(ActivitiStatus.likes),
              childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'Today',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => getRow(ActivitiStatus.followBack),
              childCount: 3),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'this weak',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => getRow(ActivitiStatus.following),
              childCount: 5),
        )
      ],
    );
  }

  Widget getRow(ActivitiStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/pr.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "AmirAhmadAdibi",
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Start Following",
                    style: TextStyle(
                        fontFamily: 'GM', fontSize: 9, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "you",
                    style: TextStyle(
                        fontFamily: 'GM', fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "3 min",
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget getActionActivityRow(ActivitiStatus status) {
    switch (status) {
      case ActivitiStatus.following:
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
            onPressed: () {},
            child: Text(
              'follow',
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'GB'),
            ));
      case ActivitiStatus.followBack:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item1.png'),
            ),
          ),
        );
      case ActivitiStatus.likes:
        return OutlinedButton(
            onPressed: () {},
            child: Text(
              'Massage',
              style: TextStyle(fontFamily: 'GB', fontSize: 10),
            ),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))));

      default:
        return OutlinedButton(
            onPressed: () {},
            child: Text(
              'Massage',
              style: TextStyle(fontFamily: 'GB', fontSize: 10),
            ),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))));
    }
  }
}
