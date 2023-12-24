import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wulap_application/presentation/notifications_screen/NotificationHelper.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_provider.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_screen.dart';
import 'package:wulap_application/routes/app_routes.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

class RemindersListScreen extends StatefulWidget {
  @override
  _RemindersListScreenState createState() => _RemindersListScreenState();
}

class _RemindersListScreenState extends State<RemindersListScreen>
    with TickerProviderStateMixin {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late Ticker _ticker;
  late Future<void> _providerInitialization;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {}); // Rebuild UI on each tick
    });
    _ticker.start();

    // Initialize the ReminderProvider when the screen is created
    _providerInitialization = _initializeReminderProvider();
  }

  Future<void> _initializeReminderProvider() async {
    await Provider.of<ReminderProvider>(context, listen: false).initialize();
  }

  @override
  void dispose() {
    _ticker.dispose();
    // Dispose of other resources if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders List'),
      ),
      body: FutureBuilder(
        future: _providerInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error initializing Reminders List.'),
            );
          } else {
            return _buildRemindersList();
          }
        },
      ),
      floatingActionButton: _buildFloatingActionButton(context),
      bottomNavigationBar: _buildBottomBarSection(),
    );
  }

  Widget _buildRemindersList() {
    return Consumer<ReminderProvider>(
      builder: (context, reminderProvider, child) {
        if (!reminderProvider.isInitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _buildRemindersListView(reminderProvider);
        }
      },
    );
  }

  Widget _buildRemindersListView(ReminderProvider reminderProvider) {
    List<Reminder> reminders = reminderProvider.reminders;

    if (reminders.isEmpty) {
      return Center(
        child: Text('No reminders available.'),
      );
    } else {
      return ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return _buildReminderCard(context, reminders[index], index);
        },
      );
    }
  }

  Widget _buildReminderCard(
      BuildContext context, Reminder reminder, int index) {
    Duration timeDifference = reminder.dateTime.difference(DateTime.now());
    String countdown = _formatDuration(timeDifference);

    if (timeDifference.inSeconds <= 0) {
      // Show notification when the reminder time has come
      NotificationHelper.showNotification(
        index, // Use a unique ID for each notification
        reminder.title,
        reminder.description,
      );

      // Stop the ticker when countdown reaches 0
      _ticker.stop();
    }
    return Dismissible(
      key: Key(index.toString()),
      onDismissed: (direction) {
        // Remove the reminder from the provider and update the UI
        Provider.of<ReminderProvider>(context, listen: false)
            .deleteReminder(index);
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
          trailing: Text(countdown),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inSeconds <= 0) {
      // Stop the ticker when countdown reaches 0
      _ticker.stop();
      return "00:00:00";
    }

    String twoDigits(int n) => n.toString().padLeft(2, "0");

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReminderScreen()),
        );
      },
      child: ClipOval(
        child: Container(
          height: 56,
          width: 56,
          color: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBarSection() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      var currentState = navigatorKey.currentState;
      if (currentState != null) {
        try {
          String route = getCurrentRoute(type);
          currentState.pushNamed(route);
        } catch (e) {
          print("Error while navigating: $e");
        }
      } else {
        print("Error: currentState is null. Navigator state not available.");
      }
    });
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.buyPage;
      case BottomBarEnum.Frame1000002310:
      case BottomBarEnum.Frame1000002311:
      case BottomBarEnum.Notification:
      case BottomBarEnum.Settings:
        return "/";
      default:
        throw Exception("Unexpected BottomBarEnum: $type");
    }
  }
}
