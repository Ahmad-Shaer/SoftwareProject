import 'package:flutter/material.dart';

import '../main.dart';

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
      tileColor: Theme.of(context).extension<AppColors>()?.accentColor,
      leading: Icon(
        icon,
        size: 18.0,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white60, fontSize: 12.0),
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
        style: const TextStyle(color: Colors.white60, fontSize: 12.0),
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
