import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/constants/custom_text.dart';

class EventStream extends StatelessWidget {
  const EventStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> eventStream =
        FirebaseFirestore.instance.collection('events').snapshots();
    return StreamBuilder(
      stream: eventStream,
      builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.03,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03,
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      data['eventName'],
                      style: CustomTextClass.h3(context, textColor),
                    ),
                    subtitle: Text(
                      data['eventId'],
                      style: CustomTextClass.h3(context, textColor),
                    ),
                    trailing: Column(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['eventLocation'],
                          style: CustomTextClass.h3(context, textColor),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
