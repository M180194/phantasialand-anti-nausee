import 'package:flutter/material.dart';
import 'day_plan.dart';
import 'map_screen.dart';
import '../widgets/quick_tips.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phantasialand Anti-Nausée'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Prêt pour Phantasialand ?', style: Theme.of(context).textTheme.headline6),
          SizedBox(height:12),
          ElevatedButton.icon(
            icon: Icon(Icons.calendar_today),
            label: Text('Jour 1 - Itinéraire'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DayPlanScreen(day:1))),
          ),
          SizedBox(height:8),
          ElevatedButton.icon(
            icon: Icon(Icons.calendar_today_outlined),
            label: Text('Jour 2 - Itinéraire'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DayPlanScreen(day:2))),
          ),
          SizedBox(height:8),
          ElevatedButton.icon(
            icon: Icon(Icons.map),
            label: Text('Carte & Localisation'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MapScreen())),
          ),
          SizedBox(height:16),
          QuickTipsCard(),
        ],
      ),
    );
  }
}
