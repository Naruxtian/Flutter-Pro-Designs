import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool dotsAbove;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow({
    super.key, 
    required this.slides,
    this.dotsAbove = false, 
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey, 
    this.primaryBullet = 12, 
    this.secondaryBullet = 12
  });

  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideShowModel>(context).primaryColor = primaryColor;
              Provider.of<_SlideShowModel>(context).secondaryColor = secondaryColor;
              Provider.of<_SlideShowModel>(context).primaryBullet = primaryBullet;
              Provider.of<_SlideShowModel>(context).secondaryBullet = secondaryBullet;

              return _EstructuraSlideShow(dotsAbove: dotsAbove, slides: slides);
            },
          )
        ),
      ),
    );
  }
}

class _EstructuraSlideShow extends StatelessWidget {
  const _EstructuraSlideShow({
    super.key,
    required this.dotsAbove,
    required this.slides,
  });

  final bool dotsAbove;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsAbove) _Dots(slides.length),     

        Expanded(child: _Slides(slides)),
        
        if (!dotsAbove) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index))
      ),
    );
  }
}


class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    // final pageViewIndex = Provider.of<_SlideShowModel>(context).currentPage;
    final ssModel = Provider.of<_SlideShowModel>(context);
    double size = 0;
    Color color;

    if(ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5){
      size = ssModel.primaryBullet;
      color = ssModel.primaryColor;
    } else {
      size = ssModel.secondaryBullet;
      color = ssModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      
      width: size,

      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration:
          BoxDecoration(
            color: color,
            shape: BoxShape.circle
      )
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    

    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}


class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide
    );
  }
}


class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;
  
  double get currentPage => _currentPage;
  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(Color primaryColor) {
    _primaryColor = primaryColor;
  }

  Color get secondaryColor => _secondaryColor;
  set secondaryColor(Color secondaryColor) {
    _secondaryColor = secondaryColor;
  }
  
  double get primaryBullet => _primaryBullet;
  set primaryBullet(double primaryBullet) {
    _primaryBullet = primaryBullet;
  }

  double get secondaryBullet => _secondaryBullet;
  set secondaryBullet(double secondaryBullet) {
    _secondaryBullet = secondaryBullet;
  }

}