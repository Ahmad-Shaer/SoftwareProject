import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timeago/timeago.dart' as Timeago;
import 'package:traveler_nest/model/reservation.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../model/notification.dart';

Widget profileListTile(
    BuildContext context, IconData icon, String title, String value,
    {bool isFirst = false, bool isLast = false}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 2.0),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: isFirst
            ? const BorderRadius.only(
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0),
              )
            : isLast
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(14.0),
                    bottomRight: Radius.circular(14.0),
                  )
                : const BorderRadius.all(Radius.zero),
      ),
      tileColor: Theme.of(context)
          .extension<AppColors>()
          ?.accentColor
          .withOpacity(0.85),
      leading: Icon(
        icon,
        size: 18.0,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 12.0),
      ),
      trailing: Text(
        value,
        style: const TextStyle(fontSize: 12.0, color: Colors.white),
      ),
    ),
  );
}

Widget utilityListTile(BuildContext context, IconData icon, String title,
    {bool isFirst = false,
    bool isLast = false,
    required void Function() onPressed}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 2.0),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: isFirst
            ? const BorderRadius.only(
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0),
              )
            : isLast
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(14.0),
                    bottomRight: Radius.circular(14.0),
                  )
                : const BorderRadius.all(Radius.zero),
      ),
      tileColor: Theme.of(context).extension<AppColors>()?.accentColor,
      leading: Icon(
        icon,
        size: 18.0,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 12.0),
      ),
      trailing: GestureDetector(
        onTap: onPressed,
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
          size: 12.0,
        ),
      ),
    ),
  );
}

Widget notificationListTile(
    {required NotificationInstance notification,
    required void Function() onDelete}) {
  return Slidable(
    key: UniqueKey(),
    enabled: true,
    endActionPane: ActionPane(
      motion: const BehindMotion(),
      extentRatio: 0.25,
      children: [
        SlidableAction(
          spacing: 2,
          backgroundColor: Colors.redAccent,
          borderRadius: BorderRadius.circular(12.0),
          label: 'Delete',
          icon: Icons.delete,
          onPressed: (_) {
            onDelete();
          },
        ),
      ],
    ),
    child: ListTile(
      tileColor: Colors.white,
      leading: const Icon(
        Icons.notifications_active,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notification.title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            Timeago.format(notification.date),
            style: const TextStyle(
              color: Color(0xFFc5c5c6),
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
            ),
          )
        ],
      ),
      subtitle: Text(
        notification.subtitle,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Color(0xFF9d9ca1),
        ),
      ),
      dense: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}

Widget reservationListTile(BuildContext context, Reservation reservation) {
  var dateFormat = DateFormat('dd MMM');

  return ListTile(
    onTap: () {
      showDialog(
        context: context,
        useSafeArea: true,
        builder: (_) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8,
              vertical: MediaQuery.of(context).size.height / 6,
            ),
            color: Colors.white,
            width: 200,
            height: 200,
            child: Text("hi"),
          );
        },
      );
    },
    isThreeLine: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    tileColor: const Color(0xffefefef),
    leading: const Icon(Icons.book),
    title: Text(
      reservation.hotelName,
      style: const TextStyle(
          color: Color(0xFF99663b), fontWeight: FontWeight.bold),
    ),
    horizontalTitleGap: 5,
    iconColor: const Color(0xFF230f04),
    subtitle: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          '${dateFormat.format(reservation.from)} - ${dateFormat.format(reservation.to)}',
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ],
    ),
    minVerticalPadding: 20,
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '₪${reservation.cost.round()}',
          style: const TextStyle(
            color: Color(0xff015607),
            fontSize: 13,
          ),
        ),
      ],
    ),
  );
}
