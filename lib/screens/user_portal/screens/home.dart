import 'dart:convert';
import 'package:blood_bank/screens/user_portal/screens/reward_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:blood_bank/screens/user_portal/screens/choose_request.dart';
import 'package:blood_bank/screens/user_portal/screens/create_request.dart';
import 'package:blood_bank/screens/user_portal/screens/donations_request.dart';
import 'package:blood_bank/screens/user_portal/screens/search.dart';
import 'package:blood_bank/screens/user_portal/screens/show_user_requests.dart';
import 'package:blood_bank/screens/user_portal/widgets/donation_request_item.dart';
import 'package:blood_bank/screens/user_portal/widgets/home_grid_item.dart';
import 'package:blood_bank/screens/user_portal/widgets/main_drawer.dart';
import 'package:modular_ui/modular_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<int> fetchPoints() async {
    final response =
        await http.get(Uri.parse('http://10.23.42.79:3007/api/update_points	'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['points'];
    } else {
      throw Exception('Failed to load points');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.grid_view,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          // FutureBuilder<int>(
          //   future: fetchPoints(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return CircularProgressIndicator(); // Show a loading indicator while waiting
          //     } else if (snapshot.hasError) {
          //       return Icon(Icons.error,
          //           color:
          //               Colors.red); // Show an error icon if there's an error
          //     } else if (snapshot.hasData) {
          //       return Container(
          //         margin:
          //             EdgeInsets.only(right: 20.0), // Adjust margin as needed
          //         child: CircleAvatar(
          //           radius: 20.0, // Adjust radius as needed
          //           backgroundColor: Theme.of(context).colorScheme.primary,
          //           child: Text(
          //             snapshot.data.toString(),
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       );
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
              const SizedBox(height: 20),
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
                              builder: (ctx) => const ShowUserRequests()));
                        },
                      ),
                      const SizedBox(width: 20),
                      HomeGridItem(
                        image: 'assets/images/home/grid_icon/2__.jpg',
                        text: 'Donates',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const DonationsRequest()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeGridItem(
                        image: 'assets/images/home/grid_icon/3__.jpg',
                        text: 'Order Bloods',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const SearchScreen()));
                        },
                      ),
                      const SizedBox(width: 20),
                      HomeGridItem(
                        image: 'assets/images/home/grid_icon/6__.jpg',
                        text: 'Campaign',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const ChooseRequest()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeGridItem(
                        image: 'assets/images/home/grid_icon/5.png',
                        text: 'Rewards',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const CouponScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Donation Request',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black),
                ),
              ),
              const DonationRequestItem(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const DonationsRequest()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: const Color.fromARGB(55, 87, 83, 83),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('See More'),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
