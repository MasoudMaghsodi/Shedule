// ایمپورت کتابخانه‌های ضروری
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shedule/gen/assets.gen.dart';
import 'package:shedule/model/shedule_model.dart';

// ثابت‌های پروژه - رنگ‌ها و اندازه‌ها
const _kPrimaryColor = Color(0xFF00664F); // رنگ اصلی سبز تیره
const _kSecondaryColor = Color(0xFF4DC591); // رنگ ثانویه سبز روشن
const _kAccentColor = Color(0xFFFF7648); // رنگ آکسان نارنجی
const _kInactiveIconColor = Color(0xFF88889D); // رنگ آیکون غیرفعال
const _kTextColor = Color(0xFF212523); // رنگ متن اصلی
const _kSubTextColor = Color(0xFFBCC1CD); // رنگ متن فرعی
const _kCardSize = Size(149, 119); // اندازه کارت درس‌ها
const _kHorizontalPadding = 32.0; // فاصله افقی استاندارد

// کلاس اصلی صفحه برنامه‌ریزی
class MainScheduleScreen extends StatelessWidget {
  const MainScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildBackground(), // بخش پس‌زمینه سبز رنگ
            _MainContent(), // محتوای اصلی صفحه
            _Decorations(), // تزئینات و تصاویر
          ],
        ),
      ),
    );
  }

  // ساخت بخش پس‌زمینه بالایی
  Widget _buildBackground() => Container(
        height: 360,
        color: _kPrimaryColor,
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: _kHorizontalPadding),
            child: InkWell(
              onTap: () => debugPrint('Search'), // کلیک روی دکمه جستجو
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1), // شفافیت 10%
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(CupertinoIcons.search, color: Colors.white),
              ),
            ),
          ),
        ),
      );
}

// کلاس محتوای اصلی زیر بخش سبز رنگ
class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45)), // گوشه گرد بالایی
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                  'Subjects', 'Recommendations for you'), // عنوان بخش درس‌ها
              _CourseList(), // لیست کارت‌های درسی
              const _SectionHeader(
                  'Your Schedule', 'Next lessons'), // عنوان بخش برنامه
              const _NextLessonCard(), // کارت درس بعدی
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ویجت سربرگ بخش‌های مختلف
class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeader(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(_kHorizontalPadding, 12, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _headerTextStyle), // عنوان اصلی
          const SizedBox(height: 4),
          Text(subtitle, style: _subHeaderTextStyle), // توضیحات
        ],
      ),
    );
  }

  // استایل‌های متنی
  static const _headerTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: _kTextColor,
  );

  static const _subHeaderTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _kSubTextColor,
  );
}

// لیست افقی کارت‌های درسی
class _CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kCardSize.height,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: _kHorizontalPadding, right: 16),
        scrollDirection: Axis.horizontal, // لیست افقی
        physics: const BouncingScrollPhysics(), // افکت اسکرول
        itemCount: sheduleModel.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 16), // فاصله بین آیتم‌ها
        itemBuilder: (_, index) =>
            _CourseCard(sheduleModel[index]), // ساخت هر کارت
      ),
    );
  }
}

// کارت تک درس
class _CourseCard extends StatelessWidget {
  final SheduleModel course;

  const _CourseCard(this.course);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // کلیک روی کارت
      child: Stack(
        children: [
          // بدنه اصلی کارت
          Container(
            width: _kCardSize.width,
            decoration: BoxDecoration(
              color: course.colorMain,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                course.icon, // آیکون درس
                Text(
                  course.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // ... برای متن طولانی
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // بخش کناری کارت
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 68,
              height: 50,
              decoration: BoxDecoration(
                color: course.boxCornerColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(60),
                ),
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  // آیکون سه نقطه
                  Assets.img.shedule.ellipsisV2.path,
                  width: 30,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// کارت درس بعدی
class _NextLessonCard extends StatelessWidget {
  const _NextLessonCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _kHorizontalPadding),
      child: Container(
        height: 137,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _kSecondaryColor,
        ),
        child: const Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _kHorizontalPadding),
              child: _LessonDetails(), // جزئیات درس
            ),
            _WaveDecoration(), // تزئین موجی شکل
          ],
        ),
      ),
    );
  }
}

// جزئیات درس داخل کارت
class _LessonDetails extends StatelessWidget {
  const _LessonDetails();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Biology', style: _titleStyle), // نام درس
        SizedBox(height: 8),
        Text('Chapter 3: Animal Kingdom', style: _subtitleStyle), // فصل
        SizedBox(height: 8),
        Row(children: [
          Icon(Icons.place_outlined,
              color: Colors.white, size: 16), // آیکون مکان
          SizedBox(width: 4),
          Text('Room 2-168', style: _locationStyle), // محل کلاس
        ]),
      ],
    );
  }

  // استایل‌های متنی
  static const _titleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const _subtitleStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const _locationStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    color: Colors.white,
  );
}

// تزئین موجی شکل در کارت
class _WaveDecoration extends StatelessWidget {
  const _WaveDecoration();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => debugPrint('Wave tapped'),
        child: Container(
          width: 120,
          height: 90,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(12)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.img.shedule.wave.path), // تصویر موج
            ),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Assets.img.shedule.ellipsisV2.svg(
                // آیکون سه نقطه
                fit: BoxFit.cover,
                width: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// بخش تزئینات صفحه
class _Decorations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 60,
          right: 0,
          child: _DecorationImage(
            // تصویر وکتور
            asset: Assets.img.shedule.vector,
            width: 350,
          ),
        ),
        Positioned(
          top: 100,
          right: 0,
          child: _DecorationImage(
            // تصویر اصلی
            asset: Assets.img.shedule.hero,
            width: 200,
          ),
        ),
      ],
    );
  }
}

// ویجت نمایش تصاویر تزئینی
class _DecorationImage extends StatelessWidget {
  final AssetGenImage asset;
  final double width;

  const _DecorationImage({required this.asset, required this.width});

  @override
  Widget build(BuildContext context) {
    return asset.image(fit: BoxFit.cover, width: width); // نمایش تصویر
  }
}

// نوار ناوبری پایینی
class ScheduleBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const ScheduleBottomNav({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        children: _navItems
            .map((item) => _NavItem(
                  // ساخت هر آیتم ناوبری
                  asset: item.asset,
                  isActive: currentIndex == item.index,
                  onTap: () => onChanged(item.index),
                ))
            .toList(),
      ),
    );
  }

  // لیست آیتم‌های ناوبری
  static final _navItems = [
    _NavData(0, Assets.img.shedule.home.path), // خانه
    _NavData(1, Assets.img.shedule.notes.path), // یادداشت‌ها
    _NavData(2, Assets.img.shedule.comment.path), // نظرات
    _NavData(3, Assets.img.shedule.user.path), // پروفایل
  ];
}

// مدل داده برای آیتم‌های ناوبری
class _NavData {
  final int index;
  final String asset;

  _NavData(this.index, this.asset);
}

// آیتم تک‌تک بخش‌های ناوبری
class _NavItem extends StatelessWidget {
  final dynamic asset;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.asset,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onTap,
            icon: SvgPicture.asset(
              asset.path,
              colorFilter: ColorFilter.mode(
                // تغییر رنگ آیکون
                isActive ? _kAccentColor : _kInactiveIconColor,
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
          ),
          if (isActive) _ActiveIndicator(), // نشانگر فعال
        ],
      ),
    );
  }
}

// نقطه نشانگر فعال در ناوبری
class _ActiveIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: _kAccentColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
