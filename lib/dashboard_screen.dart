import 'package:flutter/material.dart';
import 'package:task_management/data/tasks.dart';
import 'package:task_management/progress_pie_chart.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 20),
                _progressCard(),
                const SizedBox(height: 20),
                _title(),
                const SizedBox(height: 20),
                _searchBox(),
                const SizedBox(height: 20),
                _taskListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView _taskListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final Task task = tasks[index];
        return Container(
          margin: const EdgeInsets.only(
            bottom: 16,
          ),
          decoration: _taskContainerDecoration(),
          child: _taskData(task),
        );
      },
    );
  }

  BoxDecoration _taskContainerDecoration() {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 8,
          blurStyle: BlurStyle.normal,
          color: Colors.grey.shade300,
        ),
      ],
      color: Colors.white,
    );
  }

  Padding _taskData(Task task) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          _taskTitle(task),
          const SizedBox(height: 8),
          _taskDescription(task.description),
          _actionButtons(),
        ],
      ),
    );
  }

  Row _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.done_rounded,
            color: Colors.green.shade400,
          ),
          label: Text(
            'Mark as done',
            style: TextStyle(
              color: Colors.green.shade400,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.delete_rounded,
            color: Colors.red.shade400,
          ),
          label: Text(
            'Remove',
            style: TextStyle(
              color: Colors.red.shade400,
            ),
          ),
        ),
      ],
    );
  }

  Padding _taskDescription(String taskDescription) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        taskDescription,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Row _taskTitle(Task task) {
    return Row(
      children: [
        Expanded(
          child: Text(
            task.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        _taskCreatedAt(task.createdAtTime),
      ],
    );
  }

  Row _taskCreatedAt(String createdAt) {
    return Row(
      children: [
        const Icon(
          Icons.schedule_rounded,
          color: Colors.blueGrey,
        ),
        const SizedBox(width: 4),
        Text(
          createdAt,
          style: const TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  TextField _searchBox() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        isDense: true,
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 40,
          color: Colors.blueGrey,
        ),
        hintText: 'Task name',
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _title() {
    return const Text(
      'My to-do list',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Row _header() {
    return Row(
      children: [
        const SizedBox(width: 20),
        const Text(
          'Welcome Amelia',
          style: TextStyle(fontSize: 24),
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              'assets/images/profile.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Card _progressCard() {
    return Card(
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      color: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Today's Progress",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _taskStatus(
                        color: Colors.limeAccent,
                        statusText: 'Done',
                        taskCount: 4,
                      ),
                      _taskStatus(
                        color: Colors.blueAccent,
                        statusText: 'To Do',
                        taskCount: 3,
                      ),
                      _taskStatus(
                        color: Colors.redAccent,
                        statusText: 'Pending',
                        taskCount: 3,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 100,
                    height: 100,
                    child: ProgressPieChart(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _taskStatus({
    required Color color,
    required String statusText,
    required int taskCount,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          const SizedBox(width: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: statusText,
                ),
                const TextSpan(text: ' - '),
                TextSpan(text: '${taskCount.toString()} task'),
              ],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
