import 'package:custm_painter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow()),
        ],
      ),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      slides: [
        SvgPicture.asset('assets/svgs/Slider-1.svg'),
        SvgPicture.asset('assets/svgs/Slider-2.svg'),
        SvgPicture.asset('assets/svgs/Slider-3.svg'),
        SvgPicture.asset('assets/svgs/Slider-4.svg'),
        SvgPicture.asset('assets/svgs/Slider-5.svg'),
      ],
      dotsAbove: false,
      primaryColor: Colors.red,
      secondaryColor: Colors.black,
      primaryBullet: 15,
      secondaryBullet: 10,
    );
  }
}
