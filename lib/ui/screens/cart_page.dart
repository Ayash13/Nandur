import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../checkout.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({Key? key, required this.addedToCartPlants}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Belum ada barang di keranjang',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.addedToCartPlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return PlantWidget(
                            index: index,
                            plantList: widget.addedToCartPlants,
                            isCheckout: false,
                          );
                        }),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Totals',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '\Rp ${widget.addedToCartPlants.map((e) => e.price).reduce((value, element) => value + element)}',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      //Get bottom sheet checkout
                      Get.bottomSheet(
                        Checkout(
                          addedToCartPlants: widget.addedToCartPlants,
                        ),
                        isScrollControlled: true,
                      );
                    },
                    child: Container(
                      width: size.width * 20,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Beli Sekarang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget Checkout({required List<Plant> addedToCartPlants}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Detail Pembelian',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: addedToCartPlants.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return PlantWidget(
                      index: index,
                      plantList: addedToCartPlants,
                      isCheckout: true);
                }),
          ),
          Column(
            children: [
              const Divider(
                thickness: 1.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '\Rp ${addedToCartPlants.map((e) => e.price).reduce((value, element) => value + element)}',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              //Get to checkout page
              Get.to(
                () => PaymentPage(
                  addedToCartPlants: addedToCartPlants,
                  totalPrice: addedToCartPlants.map((e) => e.price).reduce(
                      (value, element) =>
                          value + element == int.parse(value.toString())
                              ? value
                              : value + element),
                ),
              );
            },
            child: Container(
              width: size.width * 20,
              height: 50,
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Checkout',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
