// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryGrosor;
  final double secondaryGrosor;

  const RadialProgress(
      {super.key,
      @required this.porcentaje,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryGrosor = 10,
      this.secondaryGrosor = 4
      });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double porcentajeAnterior = 0.0;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller?.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                  (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller!.value),
                  widget.primaryColor,
                  widget.secondaryColor,
                  widget.primaryGrosor,
                  widget.secondaryGrosor
                  ),
            ));
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryGrosor;
  final double secondaryGrosor;


  _MiRadialProgress(this.porcentaje, this.primaryColor, this.secondaryColor, this.primaryGrosor, this.secondaryGrosor);

  final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

  final Gradient gradiente = const LinearGradient(colors: [
    Color(0xffC012FF),
    Color(0xff6D05E8),
    Colors.red,
  ]);

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo completo
    final paint = Paint()
      ..strokeWidth = secondaryGrosor
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = primaryGrosor
      ..color = primaryColor
      // ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //Parte que se debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
