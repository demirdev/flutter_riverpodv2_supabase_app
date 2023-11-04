import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `country.dart` with the code generated
// by freezed
part 'country.freezed.dart';
// optional: since our [Country] class is serialisable,
// we must add this line. but if [Country] was not serialisable,
// we could skip it.
part 'country.g.dart';

@freezed
class Country with _$Country {
  const factory Country({
    /// Documentation for your parameter
    int? id,
    required String name,
  }) = _Country;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const Country._();

  /// Converts a JSON [Map] into a [Country] instance
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
