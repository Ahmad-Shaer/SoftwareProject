import 'package:flutter/material.dart';

import '../main.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  var _selectedRange = const RangeValues(0, 2000);
  var _rateRange = const RangeValues(1, 5);
  String _selectedValue = "Nablus";
  List<String> cities = [
    "Nablus",
    "Jerusalem",
    "Jericho",
    "Ramallah",
    "Qalqilya",
    "Hebron",
    "Tulkarem",
    "Jenin",
    "Al-Birah",
    "Tubas"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 32,
          vertical: MediaQuery.of(context).size.height / 7),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Filter",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 30),
          const Row(
            children: [
              Icon(
                Icons.location_city_rounded,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                "Hotel City",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedValue,
              dropdownColor: Colors.white,
              items: cities
                  .map(
                    (String value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _selectedValue = val!;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(
                Icons.price_change_rounded,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                "Price Range",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          RangeSlider(
            values: _selectedRange,
            onChanged: (RangeValues newRange) {
              setState(() {
                _selectedRange = newRange;
              });
            },
            activeColor: Colors.black87,
            inactiveColor: Colors.grey.withOpacity(0.6),
            divisions: 20,
            labels: RangeLabels('₪${_selectedRange.start.round()}',
                '₪${_selectedRange.end.round()}'),
            min: 0,
            max: 2000,
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              Text(
                "Rate Range",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          RangeSlider(
            values: _rateRange,
            onChanged: (RangeValues newRange) {
              setState(() {
                _rateRange = newRange;
              });
            },
            activeColor: Colors.black87,
            inactiveColor: Colors.grey.withOpacity(0.6),
            divisions: 16,
            labels: RangeLabels('★${_rateRange.start}', '★${_rateRange.end}'),
            min: 1,
            max: 5,
          ),
          const SizedBox(height: 15),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.black87),
                  ),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context, [_selectedValue, _selectedRange, _rateRange]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).extension<AppColors>()?.accentColor,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.black87),
                  ),
                ),
                child: const Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<List<dynamic>> showFilterDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: FilterDialog(),
      );
    },
  );
}
