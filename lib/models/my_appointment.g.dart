// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_appointment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAppointmentAdapter extends TypeAdapter<MyAppointment> {
  @override
  final int typeId = 1;

  @override
  MyAppointment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyAppointment(
      subject: fields[0] as String,
      startTime: fields[1] as DateTime,
      endTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MyAppointment obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAppointmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
