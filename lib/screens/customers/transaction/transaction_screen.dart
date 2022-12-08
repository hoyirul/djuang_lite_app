import 'package:djuang_lite_app/controllers/customers/order_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/home/home_screen.dart';
import 'package:djuang_lite_app/screens/customers/transaction/detail_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionCustomerScreen extends StatefulWidget {
  const TransactionCustomerScreen({super.key});

  @override
  State<TransactionCustomerScreen> createState() => _TransactionCustomerScreenState();
}

class _TransactionCustomerScreenState extends State<TransactionCustomerScreen> {
  OrderController orderController= Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),

              InkWell(
                onTap: () {
                  Get.off(const HomeCustomerScreen());
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text('Back'),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                'List Transactions',
                style: TextStyle(fontFamily: FontPicker.bold, fontSize: 25),
              ),

              const SizedBox(
                height: 2,
              ),

              const Text(
                'Enjoy with our service',
                style: TextStyle(
                    fontFamily: FontPicker.regular,
                    fontSize: 14,
                    color: ColorPicker.grey),
              ),

              const SizedBox(
                height: 20,
              ),

              Obx((){
                if(orderController.isLoading.value){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: orderController.orderList.length,
                    itemBuilder: (context, index) {
                      final row = orderController.orderList[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorPicker.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: ColorPicker.greyLight,
                                  offset: Offset(0, 1),
                                  blurRadius: 1)
                            ]),
                        child: InkWell(
                          onTap: () async {
                            if(row.driverId == 0){
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return const SimpleDialog(
                                    title: Text('Warning', style: TextStyle(
                                      color: ColorPicker.warning,
                                      fontFamily: FontPicker.medium
                                    ),),
                                    contentPadding: EdgeInsets.all(20),
                                    children: [Text('Your transaction still in process!')],
                                  );
                                },
                              );
                            }else{
                              Get.off(DetailTransactionCustomerScreen(
                                txid: row.id.toString(),
                                customer: row.customer.name,
                                driver: row.driver.name,
                                pickupAddress: row.schedule.pickupAddress,
                                destinationAddress: row.schedule.destinationAddress,
                                pickupReturnAddress: row.schedule.pickupReturnAddress,
                                timePickup: row.schedule.timePickup,
                                timeReturn: row.schedule.timeReturn,
                                start: row.schedule.dateStart.toString(),
                                end: row.schedule.dateEnd.toString(),
                                total: int.parse(row.total),
                                status: row.status,
                              ));
                            }
                          },
                          child: ListTile(
                              title: Text(row.id,
                                style: const TextStyle(fontFamily: FontPicker.medium),
                              ),
                              subtitle: Text(
                                '${row.schedule.pickupAddress} ',
                                style: const TextStyle(
                                    fontFamily: FontPicker.regular, fontSize: 12),
                              ),
                              trailing: Wrap(
                                children: [
                                  Text('${row.status} ', style: const TextStyle(
                                    color: ColorPicker.grey,
                                  ),),
                                  
                                  (row.status == 'paid') ? const Icon(
                                    Icons.check_circle_outline,
                                    color: ColorPicker.green,
                                    size: 18,
                                  ) : Icon(
                                    Icons.pending_actions,
                                    color: (row.status == 'processing') ? ColorPicker.warning : ColorPicker.danger,
                                    size: 18,
                                  )
                                ],
                              )
                            ),
                        )
                        );
                      },
                    );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
