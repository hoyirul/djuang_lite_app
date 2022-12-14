import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/drivers/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class DetailTransactionDriverScreen extends StatefulWidget {
  final String txid, customer, driver, pickupAddress, destinationAddress, pickupReturnAddress, timePickup, timeReturn, start, end, status;
  final double total;
  const DetailTransactionDriverScreen({super.key, required this.txid, required this.customer, required this.driver, required this.pickupAddress, required this.destinationAddress, required this.pickupReturnAddress, required this.timePickup, required this.timeReturn, required this.start, required this.end, required this.total, required this.status});

  @override
  State<DetailTransactionDriverScreen> createState() => _DetailTransactionDriverScreenState();
}

class _DetailTransactionDriverScreenState extends State<DetailTransactionDriverScreen> {

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
                  Get.off(const TransactionDriverScreen());
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
                'Detail Transactions',
                style: TextStyle(fontFamily: FontPicker.bold, fontSize: 25),
              ),

              const SizedBox(
                height: 2,
              ),

              Text(
                'Transaction ID ${widget.txid}',
                style: const TextStyle(
                    fontFamily: FontPicker.regular,
                    fontSize: 14,
                    color: ColorPicker.grey),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorPicker.white,
                  boxShadow: const [
                    BoxShadow(
                      color: ColorPicker.greyLight,
                      offset: Offset(0, 1),
                      blurRadius: 1
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.txid, style: const TextStyle(
                        fontFamily: FontPicker.semibold,
                        fontSize: 14,
                        color: ColorPicker.primary
                      ),)
                    ),
                    
                    const SizedBox(height: 15,),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Date From', style: TextStyle(
                                  fontFamily: FontPicker.medium,
                                  fontSize: 12,
                                  color: ColorPicker.dark
                                ),)
                              ),
                              const SizedBox(height: 2,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.start, style: const TextStyle(
                                  fontFamily: FontPicker.regular,
                                  fontSize: 12,
                                  color: ColorPicker.grey
                                ),)
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text('Date End', style: TextStyle(
                                  fontFamily: FontPicker.medium,
                                  fontSize: 12,
                                  color: ColorPicker.dark
                                ),)
                              ),
                              const SizedBox(height: 2,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(widget.end, style: const TextStyle(
                                  fontFamily: FontPicker.regular,
                                  fontSize: 12,
                                  color: ColorPicker.grey
                                ),)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const Divider(
                      color: ColorPicker.dark,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Customer Name', style: TextStyle(
                                  fontFamily: FontPicker.medium,
                                  fontSize: 12,
                                  color: ColorPicker.dark
                                ),)
                              ),
                              const SizedBox(height: 2,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.customer, style: const TextStyle(
                                  fontFamily: FontPicker.regular,
                                  fontSize: 12,
                                  color: ColorPicker.grey
                                ),)
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text('Driver Name', style: TextStyle(
                                  fontFamily: FontPicker.medium,
                                  fontSize: 12,
                                  color: ColorPicker.dark
                                ),)
                              ),
                              const SizedBox(height: 2,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(widget.driver, style: const TextStyle(
                                  fontFamily: FontPicker.regular,
                                  fontSize: 12,
                                  color: ColorPicker.grey
                                ),)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const Divider(
                      color: ColorPicker.dark,
                    ),

                    DataTable(
                      columns: const [
                        DataColumn(
                          label: Text('Pickup Address'),
                        ),
                      ], 
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('- ${widget.pickupAddress}')),
                        ])
                      ]
                    ),

                    DataTable(
                      columns: const [
                        DataColumn(
                          label: Text('Destination Address'),
                        ),
                      ], 
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('- ${widget.destinationAddress}')),
                        ])
                      ]
                    ),

                    DataTable(
                      columns: const [
                        DataColumn(
                          label: Text('Pickup Return Address'),
                        ),
                      ], 
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('- ${widget.pickupReturnAddress}')),
                        ])
                      ]
                    ),

                    const Divider(
                      color: ColorPicker.grey,
                    ),

                    DataTable(
                      columns: const [
                        DataColumn(
                          label: Text('Pickup Time'),
                        ),
                        DataColumn(
                          label: Text('Return Time'),
                        ),
                      ], 
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('- ${widget.timePickup}')),
                          DataCell(Text('- ${widget.timeReturn}')),
                        ])
                      ]
                    ),

                    const Divider(
                      color: ColorPicker.grey,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Total', style: TextStyle(
                                  fontFamily: FontPicker.bold,
                                  fontSize: 18,
                                  color: ColorPicker.dark
                                ),)
                              ),
                              SizedBox(height: 2,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('', style: TextStyle(
                                  fontFamily: FontPicker.regular,
                                  fontSize: 12,
                                  color: ColorPicker.grey
                                ),)
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('Rp ${intl.NumberFormat.decimalPattern().format(widget.total)}', style: const TextStyle(
                                  fontFamily: FontPicker.bold,
                                  fontSize: 20,
                                  color: ColorPicker.dark
                                ),)
                              ),
                              const SizedBox(height: 2,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(widget.status, style: TextStyle(
                                  fontFamily: FontPicker.regular,
                                  fontSize: 12,
                                  color: (widget.status == 'processing' || widget.status == 'pending') ? ColorPicker.danger : ColorPicker.green
                                ),)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}