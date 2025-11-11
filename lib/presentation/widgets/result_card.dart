import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultCard extends StatelessWidget {
  final double riskLevel; // 0 = Low, 1 = High

  const ResultCard({super.key, required this.riskLevel});

  @override
  Widget build(BuildContext context) {
    final isHighRisk = riskLevel >= 0.5;
    final color = isHighRisk ? Colors.red : Colors.green;
    final label = isHighRisk
        ? "High Risk / Diabetes"
        : "Low Risk / No Diabetes";

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Diabetes Risk Level",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 0,
                    maximum: 1,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.1,
                      color: Colors.grey,
                      thicknessUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: 0.5,
                        color: Colors.greenAccent,
                        startWidth: 0.1,
                        endWidth: 0.1,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                      GaugeRange(
                        startValue: 0.5,
                        endValue: 1,
                        color: Colors.redAccent,
                        startWidth: 0.1,
                        endWidth: 0.1,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ],
                    pointers: [
                      MarkerPointer(
                        value: riskLevel,
                        markerType: MarkerType.triangle,
                        color: color,
                        markerHeight: 20,
                        markerWidth: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${(riskLevel * 100).round()}%",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
