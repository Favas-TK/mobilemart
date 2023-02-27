part of 'headphone_bloc.dart';

@immutable
abstract class HeadphoneEvent {}

class AddDetailsEvent extends HeadphoneEvent {
  AddDetailsEvent({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
  });

  List<XFile?>? image;
  String name;
  String description;
  String price;
  String count;
}