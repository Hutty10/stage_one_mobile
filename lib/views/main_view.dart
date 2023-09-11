import 'package:flutter/material.dart';

import './github_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}
class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile_pic.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _count(5030, 'FOLLOWERS'),
                _count(3050, 'FOLLOWING'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Hutty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                ),
                SizedBox(width: 5),
                Text('Nigeria'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_call),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mail_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const GitHubView(),
                  ),
                ),
                child: const Text('Open GitHub'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _count(int number, String title) {
    return Column(
      children: [
        Text(
          '$number',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(title),
      ],
    );
  }
}