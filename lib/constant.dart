import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sabeel/db/db_function.dart';

Widget SpaceBar() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20,
      right: 20,
      bottom: 10,
    ),
    child: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Center(
        child: TextField(
          textAlign: TextAlign.left,
          onChanged: (String? value) {
            if (value == null) return;
            search2(value);
          },
          cursorColor: Colors.black45,
          decoration: InputDecoration(
            focusColor: Colors.blue,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black45,
              size: 24,
            ),
            hintText: 'search_by_title'.tr(),
            hintStyle: TextStyle(color: Colors.black45, fontSize: 18),
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}
