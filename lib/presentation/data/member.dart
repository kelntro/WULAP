import 'package:hive/hive.dart';

part 'member.g.dart';

@HiveType(typeId: 2)
class Member {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String phoneNumber;

  @HiveField(3)
  late String address;

  @HiveField(4)
  late String facebookName;

  @HiveField(5)
  late String monthRecieve;

  @HiveField(6)
  late DateTime contributionDate;

  Member({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.facebookName,
    required this.monthRecieve,
    required this.contributionDate, // Include contribution date in the constructor
  });

  // Copy constructor to create a new instance from an existing one
  Member.from(Member other)
      : name = other.name,
        email = other.email,
        phoneNumber = other.phoneNumber,
        address = other.address,
        facebookName = other.facebookName,
        monthRecieve = other.monthRecieve,
        contributionDate = other
            .contributionDate; // Include contribution date in the copy constructor
}
