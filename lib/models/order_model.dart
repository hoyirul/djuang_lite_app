import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
    OrderModel({
        required this.id,
        required this.customerId,
        required this.driverId,
        required this.scheduleId,
        required this.orderDate,
        required this.total,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.schedule,
    });

    String id;
    int customerId;
    int driverId;
    int scheduleId;
    DateTime orderDate;
    int total;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    Schedule schedule;

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        customerId: json["customer_id"],
        driverId: json["driver_id"],
        scheduleId: json["schedule_id"],
        orderDate: DateTime.parse(json["order_date"]),
        total: json["total"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        schedule: Schedule.fromJson(json["schedule"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "driver_id": driverId,
        "schedule_id": scheduleId,
        "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "total": total,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "schedule": schedule.toJson(),
    };
}

class Schedule {
    Schedule({
        required this.id,
        required this.dateStart,
        required this.dateEnd,
        required this.pickupAddress,
        required this.destinationAddress,
        required this.pickupReturnAddress,
        required this.timePickup,
        required this.timeReturn,
        required this.information,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    DateTime dateStart;
    DateTime dateEnd;
    String pickupAddress;
    String destinationAddress;
    String pickupReturnAddress;
    String timePickup;
    String timeReturn;
    String information;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
        pickupAddress: json["pickup_address"],
        destinationAddress: json["destination_address"],
        pickupReturnAddress: json["pickup_return_address"],
        timePickup: json["time_pickup"],
        timeReturn: json["time_return"],
        information: json["information"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date_start": "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
        "date_end": "${dateEnd.year.toString().padLeft(4, '0')}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}",
        "pickup_address": pickupAddress,
        "destination_address": destinationAddress,
        "pickup_return_address": pickupReturnAddress,
        "time_pickup": timePickup,
        "time_return": timeReturn,
        "information": information,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
