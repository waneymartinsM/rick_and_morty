import 'package:rick_and_morty/domain/models/entity/location_entity.dart';

class LocationDto extends LocationEntity {
  LocationDto({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory LocationDto.fromJson(Map<String, dynamic> json) => LocationDto(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
