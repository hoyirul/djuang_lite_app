import 'package:djuang_lite_app/controllers/drivers/schedule_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/components/schedule_component.dart';
import 'package:djuang_lite_app/screens/drivers/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleDriverScreen extends StatefulWidget {
  const ScheduleDriverScreen({super.key});

  @override
  State<ScheduleDriverScreen> createState() => _ScheduleDriverScreenState();
}

class _ScheduleDriverScreenState extends State<ScheduleDriverScreen> {
  ScheduleController scheduleController = Get.put(ScheduleController());

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
                  Get.off(const HomeDriverScreen());
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
                'List Schedules',
                style: TextStyle(fontFamily: FontPicker.bold, fontSize: 25),
              ),

              const SizedBox(
                height: 2,
              ),

              const Text(
                'Enjoy with Djuang Lite',
                style: TextStyle(
                    fontFamily: FontPicker.regular,
                    fontSize: 14,
                    color: ColorPicker.grey),
              ),

              const SizedBox(
                height: 20,
              ),

              Obx((() {
                if(scheduleController.isLoading.value){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: scheduleController.scheduleList.length,
                    itemBuilder: (context, index) {
                      var row = scheduleController.scheduleList[index];
                      return (scheduleController.scheduleList.isEmpty) ? const Center(child: Text('Data is empty!'),) : ScheduleComponent(time: row.timePickup.toString(), pickup: row.pickupAddress.toString(), destination: row.destinationAddress);
                    },
                  );
                }  
              })),

              // ListView.builder(
              //   padding: const EdgeInsets.all(0),
              //   shrinkWrap: true,
              //   scrollDirection: Axis.vertical,
              //   itemCount: scheduleController.scheduleList.length,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       margin: const EdgeInsets.only(bottom: 10),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: ColorPicker.white,
              //           boxShadow: const [
              //             BoxShadow(
              //                 color: ColorPicker.greyLight,
              //                 offset: Offset(0, 1),
              //                 blurRadius: 1)
              //           ]),
              //       child: ListTile(
              //           title: Text(
              //             'Monday ${index + 1}',
              //             style: const TextStyle(fontFamily: FontPicker.medium),
              //           ),
              //           subtitle: const Text(
              //             'Lorem ipsum dolor',
              //             style: TextStyle(
              //                 fontFamily: FontPicker.regular, fontSize: 12),
              //           ),
              //           trailing: Wrap(
              //             children: const [
              //               Text('Today ', style: TextStyle(
              //                 color: ColorPicker.grey,
              //               ),),
              //               Icon(
              //                   Icons.warning_amber_rounded,
              //                   color: ColorPicker.orange,
              //                   size: 18,
              //                 )
              //             ],
              //           )
              //         )
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
