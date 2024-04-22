import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScroolPart(),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: Color(0xff272B40),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 18, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Draft',
                      style: TextStyle(
                          color: Colors.red, fontFamily: 'GB', fontSize: 20),
                    ),
                    Spacer(),
                    Text(
                      'Gallery',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'GB', fontSize: 20),
                    ),
                    Spacer(),
                    Text(
                      'Take',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'GB', fontSize: 20),
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

Widget_getselectedPosr() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
    height: 394,
    width: double.infinity,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image.asset('images/item8.png'),
      ),
    ),
  );
}

Widget _getWholeScroolPart() {
  return CustomScrollView(slivers: [
    SliverToBoxAdapter(
      child: _getHeader(),
    ),
    SliverToBoxAdapter(
      child: Widget_getselectedPosr(),
    ),
    SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
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
                  ),
              childCount: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10)),
    ),
    SliverPadding(padding: EdgeInsets.only(bottom: 84)),
  ]);
}

Widget _getHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      children: [
        Text(
          'post',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        SizedBox(
          width: 8,
        ),
        Image.asset('images/icon_arrow_down.png'),
        Spacer(),
        Text(
          'Next',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        SizedBox(
          width: 8,
        ),
        Image.asset('images/icon_arrow_right_box.png')
      ],
    ),
  );
}
