import 'package:custm_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                primaryColor: Colors.red,
                secondaryColor: Colors.grey,
                primaryGrosor: 10,
                secondaryGrosor: 5
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                primaryColor: Colors.blue,
                secondaryColor: Colors.yellow,
                primaryGrosor: 15,
                secondaryGrosor: 15
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                primaryColor: Colors.purple,
                secondaryColor: Colors.green,
                primaryGrosor: 10,
                secondaryGrosor: 18
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                primaryColor: Colors.orange,
                secondaryColor: Colors.blueAccent,
                primaryGrosor: 15,
                secondaryGrosor: 10
              ),
            ],
          )
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {


  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryGrosor = 10,
    this.secondaryGrosor = 4
  });

  final double porcentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryGrosor;
  final double secondaryGrosor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: RadialProgress(
        porcentaje : porcentaje, 
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        primaryGrosor: primaryGrosor,
        secondaryGrosor: secondaryGrosor
        )
      );
  }
}
