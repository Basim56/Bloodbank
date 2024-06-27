import 'package:blood_bank/screens/donor_portal/screens/donor_create_request.dart';
import 'package:blood_bank/screens/donor_portal/screens/donor_show_user_requests.dart';
import 'package:blood_bank/screens/donor_portal/screens/donations_request.dart';
import 'package:blood_bank/screens/donor_portal/screens/search.dart';
import 'package:blood_bank/screens/donor_portal/widgets/user_request_item.dart';
import 'package:blood_bank/screens/donor_portal/widgets/home_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

class DonorHomeScreen extends StatelessWidget {
  const DonorHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading:
            Icon(Icons.grid_view, color: Theme.of(context).colorScheme.primary),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context).colorScheme.primary,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
          child: Column(
            children: [
              const MUICarousel(
                images: [
                  'assets/images/home/carousal/carousal_1.jfif',
                  'assets/images/home/carousal/carousal_2.jfif',
                  'assets/images/home/carousal/carousal_3.jfif',
                  'assets/images/home/carousal/carousal_4.jfif',
                ],
                indicatorType: CarouselIndicatorType.dot,
                duration: Duration(seconds: 2),
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeGridItem(
                          image: 'assets/images/home/grid_icon/1__.jpg',
                          text: 'My Requests',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const MyRequests()));
                          }),
                      const SizedBox(
                        width: 20,
                      ),
                      HomeGridItem(
                          image: 'assets/images/home/grid_icon/2__.jpg',
                          text: 'User Request',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>
                                    const DonorShowUserRequests()));
                          }),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeGridItem(
                          image: 'assets/images/home/grid_icon/4__.jpg',
                          text: 'Sent Requests',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const SearchScreen()));
                          }),
                      const SizedBox(
                        width: 20,
                      ),
                      HomeGridItem(
                          image: 'assets/images/home/grid_icon/3__.jpg',
                          text: 'Offer Blood',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>
                                    const DonorCreateRequestScreen()));
                          }),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'User Requests',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black),
                ),
              ),
              const UserRequestItem(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const DonorShowUserRequests()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5,
                          color: const Color.fromARGB(55, 87, 83, 83)),
                      borderRadius: BorderRadius.circular(20)),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('See More'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
