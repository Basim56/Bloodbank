import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:blood_bank/models/rule.dart';

class ShowBloodPrediction extends StatelessWidget {
  const ShowBloodPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Type Prediction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Blood Type Prediction Chart')),
        body: FutureBuilder<List<Rule>>(
          future: loadRules(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              return BloodTypeChart(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}

Future<List<Rule>> loadRules() async {
  final String response =
      await rootBundle.loadString('assets/rules/rules.json');
  final data = json.decode(response) as List;
  return data.map((rule) => Rule.fromJson(rule)).toList();
}

class BloodTypeChart extends StatelessWidget {
  final List<Rule> rules;

  const BloodTypeChart(this.rules, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Confidence Levels of Predicted Child Blood Types',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: rules.asMap().entries.map((entry) {
                  return BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value.confidence,
                        color: Colors.blue,
                        width: 16,
                        borderRadius: BorderRadius.circular(4),
                      )
                    ],
                    showingTooltipIndicators: [0],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < rules.length) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              '${rules[index].antecedents} -> ${rules[index].consequents}',
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      reservedSize: 60,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toString());
                      },
                      reservedSize: 40,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: true),
                gridData: FlGridData(show: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
