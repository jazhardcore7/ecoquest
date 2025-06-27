import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoquest/data/models/quest.dart';
import 'package:ecoquest/viewmodel/quest_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questViewModel = Provider.of<QuestViewModel>(context, listen: false);

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('quests').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Belum ada misi tersedia.'));
          }

          final quests = snapshot.data!.docs.map((doc) => Quest.fromFirestore(doc)).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: quests.length,
            itemBuilder: (context, index) {
              final quest = quests[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(quest.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 4),
                      Text(quest.description, style: const TextStyle(color: Colors.black54)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('+${quest.xp} XP', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade900)),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final error = await questViewModel.completeQuest(quest.xp);
                              if (context.mounted) {
                                if (error == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selamat! Misi "${quest.title}" selesai!'), backgroundColor: Colors.green,));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red,));
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('Selesaikan'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
