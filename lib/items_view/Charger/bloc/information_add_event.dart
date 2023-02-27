part of 'information_add_bloc.dart';

@immutable
abstract class InformationAddEvent {}

class ChargerAddDetailEvent extends InformationAddEvent {
  ChargerAddDetailEvent({
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
