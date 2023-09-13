// @dart = 3.1.1

import 'package:artemis/generator/data/class_property.dart';
import 'package:artemis/generator/data/definition.dart';
import 'package:artemis/generator/data_printer.dart';
import 'package:artemis/generator/helpers.dart';
import 'package:meta/meta.dart';

/// Define a query/mutation input parameter.
class QueryInput extends Definition with DataPrinter {
  @override
  final QueryInputName name;

  /// The input type.
  final TypeName type;

  /// Whether this parameter is required
  final bool isNonNull;

  /// Some other custom annotation.
  final List<String> annotations;

  /// Instantiate an input parameter.
  QueryInput({
    required this.type,
    this.isNonNull = false,
    this.annotations = const [],
    required this.name,
  })  : assert(hasValue(type) && hasValue(name)),
        super(name: name);

  @override
  Map<String, Object> get namedProps => {
        'type': type,
        'name': name,
        'isNonNull': isNonNull,
        'annotations': annotations,
      };
}

///
class QueryInputName extends Name {
  ///
  QueryInputName({required String name}) : super(name: name);

  @override
  Map<String, Object> get namedProps => {
        'name': name,
      };
}
