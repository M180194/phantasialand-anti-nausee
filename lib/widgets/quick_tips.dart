import 'package:flutter/material.dart';

class QuickTipsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Astuces anti-nausée', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height:8),
            Text('• Commence par rides doux\n• Espace au moins 20–30 min entre gros coasters\n• Regarde devant, garde la tête droite\n• Boire petites gorgées, manger léger\n• River Quest est un bon reset'),
          ],
        ),
      ),
    );
  }
}
