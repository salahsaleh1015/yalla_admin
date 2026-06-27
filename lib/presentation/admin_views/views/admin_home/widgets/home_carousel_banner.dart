




import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';

class HomeCarouselBanner extends StatefulWidget {
  const HomeCarouselBanner(
      {super.key, required this.bannersLength, required this.banners});
  final int bannersLength;
  final List<HomeBannerEntity> banners;

  @override
  State<HomeCarouselBanner> createState() => _HomeCarouselBannerState();
}

class _HomeCarouselBannerState extends State<HomeCarouselBanner> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 170.h,
          child: CarouselSlider.builder(
            itemCount: widget.bannersLength,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                    image: NetworkImage(
                      widget.banners[itemIndex].bannerImage,
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.fill,
                  ));
            },
            options: CarouselOptions(
                aspectRatio: 16 / 7,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
                onPageChanged: (i, reason) {
                  setState(() {
                    currentIndex = i;
                  });
                }),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),

      ],
    );
  }
}