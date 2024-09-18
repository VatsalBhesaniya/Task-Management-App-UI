import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management/data/tasks.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _index = 0;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Schedule',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _stepDateRange(context),
            _stepper(),
          ],
        ),
      ),
    );
  }

  Widget _stepDateRange(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _selectDate(
            title: 'Start Date',
            onPressed: () async {
              startDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ) ??
                  DateTime.now();
            },
            date: startDate,
          ),
          _selectDate(
            title: 'End Date',
            onPressed: () async {
              endDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ) ??
                  DateTime.now();
            },
            date: endDate,
          ),
        ],
      ),
    );
  }

  Column _selectDate({
    required String title,
    required void Function()? onPressed,
    required DateTime date,
  }) {
    return Column(
      children: [
        Text(title),
        _datePickerButton(
          onPressed: onPressed,
          date: date,
        ),
      ],
    );
  }

  OutlinedButton _datePickerButton({
    required void Function()? onPressed,
    required DateTime date,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            DateFormat('MMM d, y').format(date),
            style: const TextStyle(
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  Stepper _stepper() {
    return Stepper(
      currentStep: _index,
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      physics: const NeverScrollableScrollPhysics(),
      controlsBuilder: (context, details) {
        return _stepControls();
      },
      steps: tasks.map(
        (Task task) {
          return _step(task);
        },
      ).toList(),
    );
  }

  Row _stepControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 8),
        _stepActionButton(
          backgroundColor: Colors.green.shade100,
          icon: Icon(
            Icons.done,
            color: Colors.green.shade900,
          ),
        ),
        const SizedBox(width: 8),
        _stepActionButton(
          backgroundColor: Colors.red.shade100,
          icon: Icon(
            Icons.delete,
            color: Colors.red.shade900,
          ),
        ),
      ],
    );
  }

  IconButton _stepActionButton({
    required Color backgroundColor,
    required Icon icon,
  }) {
    return IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        backgroundColor: backgroundColor,
        child: icon,
      ),
    );
  }

  Step _step(Task task) {
    return Step(
      isActive: true,
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.blueGrey.shade900,
        ),
      ),
      subtitle: Text(
        task.createdAtDate,
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
      content: _taskDescription(task),
    );
  }

  Card _taskDescription(Task task) {
    return Card(
      elevation: 8,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(16),
      )),
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                task.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
