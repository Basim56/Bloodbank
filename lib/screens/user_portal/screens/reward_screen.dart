import 'dart:convert';
import 'package:blood_bank/models/coupon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponScreen> {
  List<Copuon> _couponsRequest = [];
  @override
  void initState() {
    super.initState();
    getRequests();
  }

  void getRequests() async {
    final result =
        await http.get(Uri.parse('http://10.23.42.79:3006/api/coupon'));

    List<dynamic> responseList = json.decode(result.body);
    List<Copuon> couponList = [];

    for (int i = 0; i < responseList.length; i++) {
      Map<String, dynamic> item = responseList[i] as Map<String, dynamic>;

      Copuon copuon = Copuon(
          description: item["description"] ?? "",
          points_required: item["points_required"] ?? "");

      couponList.add(copuon);
    }

    setState(() {
      _couponsRequest = couponList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Coupons'),
      ),
      body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _couponsRequest.length,
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(ZondIcons.trophy),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coupon Description',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ),
                      Text(
                        _couponsRequest[index].description,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'points reqiured :  ${_couponsRequest[index].points_required.toString()}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: ElevatedButton(
                      onPressed: () {}, child: const Text('Redeem'))),
            );
          }),
    );
  }
}
