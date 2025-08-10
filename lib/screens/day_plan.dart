import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/plan_model.dart';

class DayPlanScreen extends StatelessWidget {
  final int day;
  DayPlanScreen({required this.day});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PlanModel>(context);
    final rides = day == 1 ? model.day1 : model.day2;
    return Scaffold(
      appBar: AppBar(title: Text('Jour $day')),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: rides.length,
        itemBuilder: (_, i) {
          final r = rides[i];
          return Card(
            child: ListTile(
              leading: Checkbox(
                value: r.done,
                onChanged: (_) => model.toggleDone(r),
              ),
              title: Text(r.name),
              subtitle: Text('\${r.zone} • \${r.time} • \${r.intensity}'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // could open details and route to map
              },
            ),
          );
        }
      ),
    );
  }
}
