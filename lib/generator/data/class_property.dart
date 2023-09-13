// @dart = 3.1

import 'package:artemis/generator/data/definition.dart';
import 'package:artemis/generator/data_printer.dart';
import 'package:artemis/generator/helpers.dart';
// ignore: unused_import
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

/// Define a property (field) from a class.
class ClassProperty extends Definition with DataPrinter {
  @override
  final ClassPropertyName name;

  /// The property type.
  final TypeName type;

  /// Some other custom annotation.
  final List<String> annotations;

  /// Whether this parameter is required
  final bool isNonNull;

  /// Whether this parameter corresponds to the __resolveType (or equivalent)
  final bool isResolveType;

  /// Instantiate a property (field) from a class.
  ClassProperty({
    required this.type,
    this.annotations = const [],
    this.isNonNull = false,
    this.isResolveType = false,
    required this.name,
  })  : assert(hasValue(type) && hasValue(name)),
        super(name: name);

  /// If property is an override from super class.
  bool get isOverride => annotations.contains('override');

  /// Creates a copy of [ClassProperty] without modifying the original.
  ClassProperty copyWith({
    TypeName? type,
    ClassPropertyName? name,
    List<String>? annotations,
    bool? isNonNull,
    bool? isResolveType,
  }) =>
      ClassProperty(
        type: type ?? this.type,
        name: name ?? this.name,
        annotations: annotations ?? this.annotations,
        isNonNull: isNonNull ?? this.isNonNull,
        isResolveType: isResolveType ?? this.isResolveType,
      );

  @override
  Map<String, Object> get namedProps => {
        'type': type,
        'name': name,
        'annotations': annotations,
        'isNonNull': isNonNull,
        'isResolveType': isResolveType,
      };
}

/// Class property name
class ClassPropertyName extends Name with DataPrinter {
  /// Instantiate a class property name definition.
  ClassPropertyName({required String name}) : super(name: name);

  @override
  String normalize(String name) {
    final normalized = super.normalize(name);
    final suffix = RegExp(r'.*(_+)$').firstMatch(normalized)?.group(1) ?? '';
    return ReCase(super.normalize(name)).camelCase + suffix;
  }

  @override
  Map<String, Object> get namedProps => {
        'name': name,
      };
}

const _camelCaseTypes = {'bool', 'double', 'int'};

/// Type name
class TypeName extends Name with DataPrinter {
  /// Instantiate a type name definition.
  TypeName({required String name}) : super(name: name);

  @override
  Map<String, Object> get namedProps => {
        'name': name,
      };

  @override
  String normalize(String name) {
    final normalized = super.normalize(name);
    if (_camelCaseTypes.contains(normalized)) return normalized;

    return ReCase(normalized).pascalCase;
  }
}
