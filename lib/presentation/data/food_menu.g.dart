// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_menu.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodMenuAdapter extends TypeAdapter<FoodMenu> {
  @override
  final int typeId = 1;

  @override
  FoodMenu read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodMenu(
      menuNames: (fields[0] as List).cast<String>(),
      imagePath: fields[1] as String?,
      totalPrice: fields[2] as double,
      startDate: fields[3] as String,
      members: (fields[4] as List).cast<Member>(),
      categoryID: fields[5] as String,
      key: fields[6] as String?,
      isDeleted: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FoodMenu obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.menuNames)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.totalPrice)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.members)
      ..writeByte(5)
      ..write(obj.categoryID)
      ..writeByte(6)
      ..write(obj.key)
      ..writeByte(7)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodMenuAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
