final List<Task> tasks = [
  Task(
    title: 'Get some exercise',
    description:
        'Do 4 sets of the following exercises. \n 1. Lunges \n 2. Squats \n 3. Pushups \n 4. Single-leg deadlifts',
    createdAtTime: '7:00 AM',
    createdAtDate: 'April 16, 2023',
  ),
  Task(
    title: 'Take a cold shower',
    description: 'Take a cold shower after doing exercise.',
    createdAtTime: '8:00 AM',
    createdAtDate: 'April 10, 2023',
  ),
  Task(
    title: 'Prepare goals for the next day',
    description:
        'Prepare list of tasks to do for next few days and create a schedule.',
    createdAtTime: '9:00 AM',
    createdAtDate: 'April 10, 2023',
  ),
  Task(
    title: 'Meeting with Jhon',
    description: 'Discuss about the next steps.',
    createdAtTime: '3:20 PM',
    createdAtDate: 'April 8, 2023',
  ),
  Task(
    title: 'Go for a walk',
    description: 'Go for a walk on street for 45 minutes.',
    createdAtTime: '8:00 PM',
    createdAtDate: 'April 4, 2023',
  ),
];

class Task {
  String title;
  String description;
  String createdAtTime;
  String createdAtDate;

  Task({
    required this.title,
    required this.description,
    required this.createdAtTime,
    required this.createdAtDate,
  });
}
