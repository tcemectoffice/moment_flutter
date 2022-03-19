import 'package:flutter/material.dart';

class EventDetailsCard extends StatelessWidget {
  final List coOrdinatorsList;
  final String eventDate;
  final String lastDate;
  final int membersCount;

  const EventDetailsCard({
    Key? key,
    required this.coOrdinatorsList,
    required this.eventDate,
    required this.lastDate,
    required this.membersCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA7D5FF),
            Color(0xFFEAF6FE),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      // height: 150,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 27,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: DetailsRow(
                fieldName: 'Co-ordinators : ',
                fieldVal:
                    "${coOrdinatorsList[0]} & ${coOrdinatorsList.length - 1} more",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: DetailsRow(
                fieldName: 'Event Date : ',
                fieldVal: eventDate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: DetailsRow(
                fieldName: 'Last Date to Enroll : ',
                fieldVal: lastDate,
              ),
            ),
            Text('$membersCount members Enrolled'),
          ],
        ),
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String fieldName;
  final String fieldVal;

  const DetailsRow({
    Key? key,
    required this.fieldName,
    required this.fieldVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          fieldName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          fieldVal,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
