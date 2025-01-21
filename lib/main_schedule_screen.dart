import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shedule/gen/assets.gen.dart';
import 'package:shedule/model/shedule_model.dart';

class MainScheduleScreen extends StatelessWidget {
  const MainScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 385,
                  ),
                  Container(
                    height: 359,
                    decoration: BoxDecoration(
                      color: Color(0xff00664F),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32, left: 32),
                    child: InkWell(
                      onTap: () {
                        debugPrint('hi');
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(
                              0xffffffff,
                            ).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Assets.img.shedule.vector
                        .image(fit: BoxFit.cover, width: 350),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Assets.img.shedule.hero.image(
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScheduleTitleHandler(
                      title: 'Subjects',
                      description: 'Recommendations for you'),
                  SizedBox(
                    height: 119,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: sheduleModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                              index == 0 ? 32 : 0, 0, 16, 0),
                          child: CourseItem(
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ScheduleTitleHandler(
                      title: 'Your Schedule', description: 'Next lessons'),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 137,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff4DC591),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Biology',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Chapter 3: Animal Kingdom',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.place_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Room 2-168',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                debugPrint('');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                width: 120,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      Assets.img.shedule.wave.path,
                                    ),
                                  ),
                                ),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Assets.img.shedule.ellipsisV2
                                          .svg(fit: BoxFit.cover, width: 30),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SheduleBottomNavigation extends StatelessWidget {
  const SheduleBottomNavigation({
    super.key,
    required this.changePage,
    required this.selectedIndex,
  });

  final Function(int page) changePage;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavigationItem(
            iconName: Assets.img.shedule.home.path,
            onTap: () => changePage(0),
            isSelected: selectedIndex == 0,
          ),
          BottomNavigationItem(
            iconName: Assets.img.shedule.notes.path,
            onTap: () => changePage(1),
            isSelected: selectedIndex == 1,
          ),
          BottomNavigationItem(
            iconName: Assets.img.shedule.comment.path,
            onTap: () => changePage(2),
            isSelected: selectedIndex == 2,
          ),
          BottomNavigationItem(
            iconName: Assets.img.shedule.user.path,
            onTap: () => changePage(3),
            isSelected: selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.iconName,
    required this.onTap,
    required this.isSelected,
  });
  final String iconName;
  final Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onTap,
            icon: SvgPicture.asset(
              iconName,
              colorFilter: ColorFilter.mode(
                  isSelected ? Color(0xffFF7648) : Color(0xff88889D),
                  BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          ),
          isSelected
              ? Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Color(0xffFF7648),
                      borderRadius: BorderRadius.circular(100)),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final int index;
  const CourseItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 119,
            width: 149,
            decoration: BoxDecoration(
              color: sheduleModel[index].colorMain,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Positioned(left: 18, top: 18, child: sheduleModel[index].icon),
        Positioned(
            bottom: 18,
            left: 18,
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              sheduleModel[index].name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 68,
            height: 50,
            decoration: BoxDecoration(
              color: sheduleModel[index].boxCornerColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  12,
                ),
                bottomLeft: Radius.circular(60),
              ),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.img.shedule.ellipsisV2.path,
                  width: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ScheduleTitleHandler extends StatelessWidget {
  const ScheduleTitleHandler(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 12, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff212523),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffBCC1CD),
            ),
          )
        ],
      ),
    );
  }
}

class MainShedule extends StatefulWidget {
  const MainShedule({super.key});

  @override
  State<MainShedule> createState() => _MainSheduleState();
}

class _MainSheduleState extends State<MainShedule> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: page,
          children: [
            MainScheduleScreen(),
            SheduleNoteScreen(),
          ],
        ),
        bottomNavigationBar: SheduleBottomNavigation(
          selectedIndex: page,
          changePage: (pageItem) => setState(() {
            page = pageItem;
          }),
        ),
      ),
    );
  }
}

class SheduleNoteScreen extends StatelessWidget {
  const SheduleNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('note'),
        ],
      ),
    );
  }
}
