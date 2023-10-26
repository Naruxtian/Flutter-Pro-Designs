import 'package:flutter/material.dart';
import 'package:custm_painter/src/pages/slideshow_page.dart';
// import 'package:custm_painter/src/labs/slideshow_page.dart';
// import 'package:custm_painter/src/pages/graficas_circulaes_page.dart';
// import 'package:custm_painter/src/pages/animaciones_page.dart';
// import 'package:custm_painter/src/pages/header_pages.dart';
// import 'package:custm_painter/src/retos/cuadrado_animado_page.dart';
// import 'package:custm_painter/src/labs/circular_progress_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diseños App',
      // home: AnimacionesPage(),
      // home: CuadradoAnimadoPage(),
      // home: GraficasCircularesPage(),
      home: SlideshowPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}