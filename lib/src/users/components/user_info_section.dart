import 'package:flutter/material.dart';
import 'package:techjar_task/core/core.dart';

import '../users.dart';

class UserInfoSection extends StatelessWidget {
  final UserModel userInfo;
  final void Function()? onTap;
  const UserInfoSection({super.key, required this.userInfo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userInfo.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('userInfoname: ${userInfo.username}'),
            Text('Email: ${userInfo.email}'),
            Text('Phone: ${userInfo.phone}'),
            Text('Website: ${userInfo.website}'),
            const SizedBox(height: 10.0),
            const Text(
              'Address',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Street: ${userInfo.address!.street}'),
            Text('Suite: ${userInfo.address!.suite}'),
            Text('City: ${userInfo.address!.city}'),
            Text('Zipcode: ${userInfo.address!.zipcode}'),
            Text(
                'Geo: (${userInfo.address!.geo!.lat}, ${userInfo.address!.geo!.lng})'),
            const SizedBox(height: 10.0),
            const Text(
              'Company',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Name: ${userInfo.company!.name}'),
            Text('CatchPhrase: ${userInfo.company!.catchPhrase}'),
            Text('BS: ${userInfo.company!.bs}'),
          ],
        ).paddingAll(20.0),
      ),
    );
  }
}
