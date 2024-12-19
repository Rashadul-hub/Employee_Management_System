import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../data/services/notify_helper_services.dart';



class CalendarProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  final Map<DateTime, List<String>> _reminders = {};

  DateTime get selectedDate => _selectedDate;

  Map<DateTime, List<String>> get reminders => _reminders;

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void addReminder(String reminder) {
    if (_reminders[_selectedDate] == null) {
      _reminders[_selectedDate] = [];
    }
    _reminders[_selectedDate]!.add(reminder);
    notifyListeners();
  }
}

// class MainDashboard extends StatefulWidget {
//   const MainDashboard({super.key});
//
//   @override
//   State<MainDashboard> createState() => _MainDashboardState();
// }
//
// class _MainDashboardState extends State<MainDashboard> {
//
//   final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeNotifications();
//   }
//
//   void _initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//
//     await _notificationsPlugin.initialize(initializationSettings);
//   }
//
//   void _scheduleNotification(DateTime date, String reminder) async {
//     final tz.TZDateTime tzDateTime = tz.TZDateTime.from(date, tz.local);
//
//     await _notificationsPlugin.zonedSchedule(
//       0,
//       'Reminder',
//       reminder,
//       tzDateTime,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'reminder_channel',
//           'Reminders',
//           importance: Importance.high,
//           priority: Priority.high,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
//
//   Future<void> _addReminderDialog(BuildContext context, CalendarProvider provider) async {
//     final TextEditingController _controller = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Reminder'),
//           content: TextField(
//             controller: _controller,
//             decoration: const InputDecoration(hintText: 'Enter reminder'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (_controller.text.isNotEmpty) {
//                   provider.addReminder(_controller.text);
//                   _scheduleNotification(
//                       provider.selectedDate.add(const Duration(seconds: 5)),
//                       _controller.text);
//                   Navigator.pop(context);
//                 }
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CalendarProvider(),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               Consumer<CalendarProvider>(
//                 builder: (context, provider, child) {
//                   return TableCalendar(
//                     focusedDay: provider.selectedDate,
//                     firstDay: DateTime.utc(2000, 1, 1),
//                     lastDay: DateTime.utc(2100, 12, 31),
//                     selectedDayPredicate: (day) => isSameDay(provider.selectedDate, day),
//                     onDaySelected: (selectedDay, focusedDay) {
//                       provider.updateSelectedDate(selectedDay);
//                     },
//                     calendarStyle: const CalendarStyle(
//                       selectedDecoration: BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                       todayDecoration: BoxDecoration(
//                         color: Colors.orange,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               Consumer<CalendarProvider>(
//                 builder: (context, provider, child) {
//                   return Column(
//                     children: [
//                       const Text(
//                         'Reminders',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       ...?provider.reminders[provider.selectedDate]
//                           ?.map((reminder) => ListTile(
//                         title: Text(reminder),
//                       ))
//                           .toList(),
//                       ElevatedButton(
//                         onPressed: () {
//                           _addReminderDialog(context, provider);
//                         },
//                         child: const Text('Add Reminder'),
//                       )
//                     ],
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {

  var notifyHelper;
  @override
  void initState() {
     super.initState();
     notifyHelper = NotifyHelper();
     notifyHelper.requestIOSPermissions();
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
