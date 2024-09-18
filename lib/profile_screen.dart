import 'package:flutter/material.dart';
import 'package:task_management/progress_bar_chart.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _content(),
          ],
        ),
      ),
    );
  }

  Container _header() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.redAccent,
      child: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              right: 0,
              child: Icon(
                Icons.edit,
                size: 28,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _user(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _user() {
    return Row(
      children: [
        _userProfile(),
        const SizedBox(width: 20),
        _username(),
      ],
    );
  }

  CircleAvatar _userProfile() {
    return const CircleAvatar(
      radius: 80,
      backgroundImage: AssetImage(
        'assets/images/profile.jpg',
      ),
    );
  }

  Column _username() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Amelia Madison',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Photographer',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Padding _content() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _title(),
          const SizedBox(height: 16),
          _performanceCard(),
          const SizedBox(height: 20),
          _settings(),
          const SizedBox(height: 20),
          _logoutButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Text _title() {
    return const Text(
      'Weekly Performance',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _performanceCard() {
    return SizedBox(
      height: 250,
      child: ProgressBarChart(),
    );
  }

  Column _settings() {
    return Column(
      children: [
        _settingsItem(
          icon: const Icon(
            Icons.alarm_on_outlined,
            color: Colors.blueGrey,
          ),
          title: 'Reminders',
          switchValue: true,
        ),
        _settingsItem(
          icon: const Icon(
            Icons.notifications_active_outlined,
            color: Colors.blueGrey,
          ),
          title: 'Task Notifications',
          switchValue: false,
        ),
        _settingsItem(
          icon: const Icon(
            Icons.schedule_send_outlined,
            color: Colors.blueGrey,
          ),
          title: 'Schedule Notifications',
          switchValue: false,
        ),
        _settingsItem(
          icon: const Icon(
            Icons.show_chart,
            color: Colors.blueGrey,
          ),
          title: 'Display Progress',
          switchValue: true,
        ),
      ],
    );
  }

  ListTile _settingsItem({
    required Icon icon,
    required String title,
    required bool switchValue,
  }) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: Switch(
        value: switchValue,
        onChanged: (bool value) {},
        activeColor: Colors.green,
      ),
    );
  }

  Center _logoutButton() {
    return Center(
      child: FilledButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout_rounded),
        style: FilledButton.styleFrom(
          backgroundColor: Colors.redAccent,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
