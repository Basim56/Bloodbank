import 'package:blood_bank/models/donor.dart';
import 'package:flutter/material.dart';

class DonorsItem extends StatelessWidget {
  const DonorsItem({super.key, required this.donor});
  final Donor donor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Image.asset(
            donor.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                donor.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                donor.location,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              Icon(
                Icons.water_drop_sharp,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    donor.bloodType,
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
    );
  }
}
