import 'package:flutter/material.dart';

import 'models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> _users = <User>[
    User(name: 'Jane Cooper', handle: '@jane.cooper'),
    User(name: 'Ronald Richards', handle: '@ronald_richards'),
    User(name: 'Jacob Jones', handle: '@jacob.jones'),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Following List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          final User user = _users[index];
          final bool isFollowing = user.isFollowing;
          final ColorScheme colorScheme = theme.colorScheme;

          final String initials = user.name.trim().isNotEmpty
              ? user.name.trim()[0].toUpperCase()
              : '?';

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                child: Text(initials),
              ),
              title: Text(user.name),
              subtitle: Text(user.handle),
              trailing: TextButton(
                key: ValueKey<String>('follow-button-$index'),
                onPressed: () {
                  setState(user.toggleFollowing);
                },
                style: TextButton.styleFrom(
                  foregroundColor: isFollowing
                      ? colorScheme.onSurface
                      : colorScheme.onPrimary,
                  backgroundColor:
                      isFollowing ? colorScheme.surfaceVariant : colorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(isFollowing ? 'Following' : 'Follow'),
              ),
            ),
          );
        },
      ),
    );
  }
}
