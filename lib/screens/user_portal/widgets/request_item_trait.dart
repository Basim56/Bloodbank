import 'package:blood_bank/models/donation_request.dart';
import 'package:flutter/material.dart';

class RequestItemTrait extends StatelessWidget {
  const RequestItemTrait({super.key, required this.donationRequest});
  final DonationRequest donationRequest;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border:
              Border.all(width: 5, color: const Color.fromARGB(55, 87, 83, 83)),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: const Color.fromARGB(255, 87, 83, 83)),
                ),
                Text(
                  donationRequest.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  'Location',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: const Color.fromARGB(255, 87, 83, 83)),
                ),
                Text(
                  donationRequest.location,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  'Contact',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: const Color.fromARGB(255, 87, 83, 83)),
                ),
                Text(
                  donationRequest.contactNo.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
            const Spacer(),
            Stack(
              children: [
                Icon(
                  Icons.water_drop_sharp,
                  color: Theme.of(context).colorScheme.primary,
                  size: 60,
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      donationRequest.bloodGroup,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}