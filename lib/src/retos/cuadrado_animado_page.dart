import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: _CuadradoAnimado(),
    ));
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    super.key,
  });

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  AnimationController? controller;
  //Animaciones
    Animation<double>? moverDerecha;
    Animation<double>? moverArriba;
    Animation<double>? moverIzquierda;
    Animation<double>? moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moverDerecha = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0, 0.25, curve: Curves.bounceOut))
    );

    moverArriba = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut))
    );

    moverIzquierda = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut))
    );

    moverAbajo = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.75, 1, curve: Curves.bounceOut))
    );

    super.initState();
  }

  @override
    void dispose() {
      controller?.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller?.repeat();
    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (context, child) {
        // return Transform.translate(
        // offset: Offset(moverDerecha!.value, 0),
        // child: Transform.translate(
        //   offset: Offset(0, -moverArriba!.value),
        //   child: Transform.translate(
        //     offset: Offset(-moverIzquierda!.value, 0),
        //     child: Transform.translate(
        //       offset: Offset(0, moverAbajo!.value),
        //       child: child!,
        //     )
        //     )
        //   )
        // );
        return Transform.translate(
          offset: Offset(
            moverDerecha!.value + moverIzquierda!.value, 
            moverAbajo!.value + moverArriba!.value
          ),
          child: child!,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}