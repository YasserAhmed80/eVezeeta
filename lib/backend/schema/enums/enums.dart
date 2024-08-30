import 'package:collection/collection.dart';

enum EnumBookHourStatus {
  inActive,
  Active,
  Booked,
  PartiallyBooked,
}

enum EnumSelectedTab {
  doctor_search,
  doctor_new,
  doctor_dashboard,
  dotor_profile,
  customer_list,
  customer_profile,
  customer_search,
  customer_booking,
  doctor_visits,
  customer_add,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (EnumBookHourStatus):
      return EnumBookHourStatus.values.deserialize(value) as T?;
    case (EnumSelectedTab):
      return EnumSelectedTab.values.deserialize(value) as T?;
    default:
      return null;
  }
}
