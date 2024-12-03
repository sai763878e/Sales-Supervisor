import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class RadialBarChart extends StatelessWidget {
  const RadialBarChart({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: SfRadialGauge(
          axes: [
            RadialAxis(
              radiusFactor: 0.65,
              axisLineStyle:
                  AxisLineStyle(thickness: 25, color: Colors.grey.shade200),
              startAngle: 270,
              endAngle: 270,
              showLabels: false,
              showTicks: false,
              annotations: [
                GaugeAnnotation(
                    widget: Text(
                  '73%',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black),
                ),
                angle: 270,
                  positionFactor: 0.1,
                )
              ],
            ),

            RadialAxis(
              radiusFactor: 0.8,
              pointers: [
                RangePointer(
                  value: 50,
                  width: 55,
                  color: Colors.purple,
                )
              ],
              startAngle: 270,
              endAngle: 270,
              showTicks: false,
              showLabels: false,
              showAxisLine: false,

            ),

            RadialAxis(
              radiusFactor: 0.68,
              pointers: [
                RangePointer(
                  value: 20,
                  color: Colors.blue,
                  width: 35,
                )
              ],
              startAngle: 120,
              endAngle: 120,
              showTicks: false,
              showLabels: false,
              showAxisLine: false,

            ),

            RadialAxis(
              radiusFactor: 0.75,
              pointers: [
                RangePointer(
                  value: 15,
                  color: Colors.yellow,
                  width: 50,
                )
              ],
              startAngle: 90,
              endAngle: 90,
              showTicks: false,
              showLabels: false,
              showAxisLine: false,

            ),

          ],
        ),
      ),
    );
  }
}
