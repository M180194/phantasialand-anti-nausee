import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ride {
  final String id;
  final String name;
  final String zone;
  final String intensity; // low/medium/high
  final String time; // recommended time slot
  bool done;
  Ride({required this.id, required this.name, required this.zone, required this.intensity, required this.time, this.done = false});

  Map<String,dynamic> toMap() => {'id':id,'name':name,'zone':zone,'intensity':intensity,'time':time,'done':done};
  factory Ride.fromMap(Map<String,dynamic> m) => Ride(id:m['id'], name:m['name'], zone:m['zone'], intensity:m['intensity'], time:m['time'], done:m['done'] ?? false);
}

class PlanModel extends ChangeNotifier {
  List<Ride> day1 = [];
  List<Ride> day2 = [];

  PlanModel() {
    _initDefault();
  }

  void _initDefault() {
    day1 = [
      Ride(id:'m1', name:'Maus au Chocolat', zone:'Fantasy', intensity:'low', time:'09:00'),
      Ride(id:'w1', name:'Winja\'s Fear & Force', zone:'Wuze Town', intensity:'medium', time:'09:20'),
      Ride(id:'c1', name:'Colorado Adventure', zone:'Mexico', intensity:'medium', time:'10:00'),
      Ride(id:'t1', name:'Taron', zone:'Klugheim', intensity:'high', time:'10:45'),
      Ride(id:'r1', name:'River Quest', zone:'Klugheim', intensity:'low', time:'11:15'),
      Ride(id:'bm1', name:'Black Mamba', zone:'Deep in Africa', intensity:'high', time:'14:30'),
    ];
    day2 = [
      Ride(id:'c2', name:'Colorado Adventure', zone:'Mexico', intensity:'medium', time:'09:00'),
      Ride(id:'t2', name:'Taron', zone:'Klugheim', intensity:'high', time:'09:30'),
      Ride(id:'bm2', name:'Black Mamba', zone:'Deep in Africa', intensity:'high', time:'13:00'),
      Ride(id:'rq2', name:'River Quest', zone:'Klugheim', intensity:'low', time:'13:30'),
    ];
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    // load saved checklists if exist (simple implementation)
    // omitted for brevity — can be expanded
    notifyListeners();
  }

  void toggleDone(Ride ride) {
    ride.done = !ride.done;
    notifyListeners();
    _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    // saving is left minimal for demo
  }
}
