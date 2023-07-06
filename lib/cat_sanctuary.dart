import 'package:equatable/equatable.dart';

class CatSanctuary extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const CatSanctuary({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
      ];
}
