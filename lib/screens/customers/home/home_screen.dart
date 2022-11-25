import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/account/account_screen.dart';
import 'package:djuang_lite_app/screens/customers/auth/login_screen.dart';
import 'package:djuang_lite_app/screens/customers/booking/booking_screen.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/circle_component.dart';
import 'package:djuang_lite_app/screens/components/home_feature_component.dart';
import 'package:djuang_lite_app/screens/components/schedule_component.dart';
import 'package:djuang_lite_app/screens/customers/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomerScreen extends StatefulWidget {
  const HomeCustomerScreen({super.key});

  @override
  State<HomeCustomerScreen> createState() => _HomeCustomerScreenState();
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  height: 260,
                  color: Colors.transparent,
                ),

                Container(
                  padding: const EdgeInsets.all(0),
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: ColorPicker.primary
                  ),
                ),

                const Positioned(
                  right: -10,
                  top: -20,
                  child: CircleComponent(height: 150, width: 150),
                ), 

                const Positioned(
                  left: -25,
                  top: 50,
                  child: CircleComponent(height: 100, width: 100),
                ),

                Positioned(
                  left: 25,
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hi, Smith Adam', style: TextStyle(
                        fontFamily: FontPicker.semibold,
                        fontSize: 18,
                        color: ColorPicker.white
                      ),),

                      Text('Lorem ipsum dolor jamet ansu', style: TextStyle(
                        fontFamily: FontPicker.regular,
                        fontSize: 11,
                        color: ColorPicker.white
                      ),),
                    ],
                  ),
                ),

                Positioned(
                  top: 80,
                  right: 25,
                  child: ButtonComponent(
                    button: TextButton(
                      onPressed: () {
                        Get.offAll(const LoginCustomerScreen());
                      },
                      child: const Text('Logout', style: TextStyle(
                        fontFamily: FontPicker.semibold,
                        fontSize: 12,
                        color: ColorPicker.primary
                      ),),
                    ),
                    colors: ColorPicker.white,
                    height: 40,
                    width: 120,
                  ),
                ),

                Positioned(
                  top: 150,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorPicker.white,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorPicker.greyLight,
                          offset: Offset(0, 1),
                          blurRadius: 1
                        )
                      ]
                    ),

                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.offAll(const BookingScreen());
                            },
                            child: const HomeFeatureComponent(icons: 'assets/icons/booking.svg', title: 'Booking')
                          )
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.off(const TransactionScreen());
                            },
                            child: const HomeFeatureComponent(icons: 'assets/icons/transactions.svg', title: 'Transactions')
                          )
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.off(const AccountCustomerScreen());
                            },
                            child: const HomeFeatureComponent(icons: 'assets/icons/accounts.svg', title: 'Account')
                          )
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Schedules', style: TextStyle(
                      fontFamily: FontPicker.semibold,
                      color: ColorPicker.dark,
                      fontSize: 18
                    ),)
                  ),

                  const SizedBox(height: 10,),

                  Row(
                    children: const [
                      ScheduleComponent(),

                      SizedBox(width: 15,),

                      ScheduleComponent(),
                    ],
                  ),

                  const SizedBox(height: 20,),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Histories', style: TextStyle(
                      fontFamily: FontPicker.semibold,
                      color: ColorPicker.dark,
                      fontSize: 18
                    ),)
                  ),

                  const SizedBox(height: 10,),

                  ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorPicker.white,
                          boxShadow: const [
                            BoxShadow(
                              color: ColorPicker.greyLight,
                              offset: Offset(0, 1),
                              blurRadius: 1
                            )
                          ]
                        ),
                        child: ListTile(
                          title: Text('Histories ${index + 1}', style: const TextStyle(
                            fontFamily: FontPicker.medium
                          ),),
                          subtitle: const Text('Lorem ipsum dolor', style: TextStyle(
                            fontFamily: FontPicker.regular,
                            fontSize: 12
                          ),),
                          trailing: (index % 2 == 1 ) ? const Icon(Icons.check_circle_outline, color: ColorPicker.green,) : const Icon(Icons.remove_circle_outline, color: ColorPicker.primary,)
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}