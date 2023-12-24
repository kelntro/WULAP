import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wulap_application/presentation/notifications_screen/notifications_provider.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_provider.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Ensure that NotificationsProvider is initialized
      future: _initializeProviders(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Notifications'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Notifications'),
            ),
            body: Center(
              child: Text('Error initializing providers: ${snapshot.error}'),
            ),
          );
        } else {
          return _buildMainScreen(context);
        }
      },
    );
  }

  Future<void> _initializeProviders(BuildContext context) async {
    // Initialize ReminderProvider
    await Provider.of<ReminderProvider>(context, listen: false).initialize();

    // Initialize NotificationsProvider with ReminderProvider
    await Provider.of<NotificationsProvider>(context, listen: false)
        .initialize(Provider.of<ReminderProvider>(context, listen: false));
  }

  Widget _buildMainScreen(BuildContext context) {
    print(
      'Number of reminders: ${Provider.of<ReminderProvider>(context).reminders.length}',
    );
    print(
      'Number of notifications: ${Provider.of<NotificationsProvider>(context).notifications.length}',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: _buildNotificationsList(context),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildNotificationsList(BuildContext context) {
    return Consumer<NotificationsProvider>(
      builder: (context, notificationsProvider, child) {
        return _buildNotificationsListView(context, notificationsProvider);
      },
    );
  }

  Widget _buildNotificationsListView(
    BuildContext context,
    NotificationsProvider notificationsProvider,
  ) {
    if (!notificationsProvider.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (notificationsProvider.notifications.isEmpty) {
      print('No notifications available.');
      return Center(
        child: Text('No notifications available.'),
      );
    }

    return _buildDismissableList(context, notificationsProvider);
  }

  Widget _buildDismissableList(
    BuildContext context,
    NotificationsProvider notificationsProvider,
  ) {
    return ListView.builder(
      itemCount: notificationsProvider.notifications.length,
      itemBuilder: (context, index) {
        final reminder = notificationsProvider.notifications[index];

        return Dismissible(
          key: Key(reminder.dateTime.toString()), // Use a unique key
          onDismissed: (direction) {
            // Delete both notification and reminder
            Provider.of<NotificationsProvider>(context, listen: false)
                .deleteNotificationAndReminder(
              index,
              Provider.of<ReminderProvider>(context, listen: false),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                reminder.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                reminder.description,
                style: TextStyle(color: Colors.grey),
              ),
              // Add more details or actions if needed
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      // Implement navigation logic based on the bottom bar item selected
      // Similar to what you did in RemindersListScreen
    });
  }
}
