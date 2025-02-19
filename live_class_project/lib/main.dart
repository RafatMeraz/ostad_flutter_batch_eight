import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_class_project/score.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LiveScoreListScreen(),
    );
  }
}

class LiveScoreListScreen extends StatefulWidget {
  const LiveScoreListScreen({super.key});

  @override
  State<LiveScoreListScreen> createState() => _LiveScoreListScreenState();
}

class _LiveScoreListScreenState extends State<LiveScoreListScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FootballScore> _footballScoreList = [];
  bool _getFootScoreInProgress = false;

  @override
  void initState() {
    super.initState();
    _getLiveScoreList();
  }

  Future<void> _getLiveScoreList() async {
    _getFootScoreInProgress = true;
    setState(() {});
    _footballScoreList.clear();
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await db.collection('football').get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshots.docs) {
      _footballScoreList.add(FootballScore.fromJson(doc.data(), doc.id));
    }
    _getFootScoreInProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score List'),
      ),
      body: Visibility(
        visible: _getFootScoreInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: _footballScoreList.length,
          itemBuilder: (context, index) {
            FootballScore score = _footballScoreList[index];
            return ListTile(
              title: Text(score.matchName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${score.team1Name} vs ${score.team2Name}'),
                  if (score.isRunning == false)
                    Text('Winner team is ${score.winnerTeam}')
                ],
              ),
              trailing: Text(
                '${score.team1Score}-${score.team2Score}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundColor: score.isRunning ? Colors.green : Colors.grey,
                radius: 8,
              ),
            );
          },
        ),
      ),
    );
  }
}
