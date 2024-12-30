import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/task_item_widget.dart';
import 'package:task_manager/ui/widgets/task_status_summary_counter_widget.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildTaskListView(),
        ),
      ),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const TaskItemWidget();
      },
    );
  }
}
