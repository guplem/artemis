// @dart = 3.1.1

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratorOptions _$GeneratorOptionsFromJson(Map json) {
  bool generateHelpers = json['generate_helpers'] as bool? ?? true;

  // SCALAR MAPPING
  List<ScalarMap>? scalar_mapping;
  if (json.containsKey("scalar_mapping")) {
    final valueScalars = json['scalar_mapping'];
    final scalars = valueScalars as List<Map<String, String>>;
    scalars.removeWhere((element) => element.isEmpty || element == null);
    scalar_mapping = List.from(scalars.map((e) => ScalarMap.fromJson(e)));
  }
  List<ScalarMap> scalarMapping = scalar_mapping ?? [];

  // FRAGMENTS GLOB
  String? fragments_glob;
  if (json.containsKey("fragments_glob")) {
    fragments_glob = json['fragments_glob'] as String;
  }
  String? fragmentsGlob = fragments_glob;

  // SCHEMA MAPPING
  List<SchemaMap>? schema_mapping;
  if (json.containsKey("schema_mapping")) {
    final valueSchemas = json['schema_mapping'];
    final schemas = valueSchemas as List<Map<String, String>>;
    schemas.removeWhere((element) => element.isEmpty || element == null);
    schema_mapping = List.from(schemas.map((e) => SchemaMap.fromJson(e)));
  }
  List<SchemaMap> schemaMapping = schema_mapping ?? [];

  // IGNORE FOR FILE
  List<String>? ignore_for_file;
  if (json.containsKey("ignore_for_file")) {
    ignore_for_file = (json['ignore_for_file'] as List<String>);
  }
  List<String> ignoreForFile = ignore_for_file ?? [];

  // return
  return GeneratorOptions(
    generateHelpers: generateHelpers,
    scalarMapping: scalarMapping,
    fragmentsGlob: fragmentsGlob,
    schemaMapping: schemaMapping,
    ignoreForFile: ignoreForFile,
  );
}

Map<String, dynamic> _$GeneratorOptionsToJson(GeneratorOptions instance) =>
    <String, dynamic>{
      'generate_helpers': instance.generateHelpers,
      'scalar_mapping': instance.scalarMapping,
      'fragments_glob': instance.fragmentsGlob,
      'schema_mapping': instance.schemaMapping,
      'ignore_for_file': instance.ignoreForFile,
    };

DartType _$DartTypeFromJson(Map<String, dynamic> json) {
  assert(json.containsKey("name"));
  assert(json.containsKey("imports"));

  return DartType(
    name: json['name'] as String,
    imports: (json['imports'] as List)?.map((e) => e as String)?.toList() ?? [],
  );
}

Map<String, dynamic> _$DartTypeToJson(DartType instance) => <String, dynamic>{
      'name': instance.name,
      'imports': instance.imports,
    };

ScalarMap _$ScalarMapFromJson(Map<String, dynamic> json) {
  return ScalarMap(
    graphQLType: json['graphql_type'] as String,
    dartType:
        json['dart_type'] == null ? null : DartType.fromJson(json['dart_type']),
    customParserImport: json['custom_parser_import'] as String,
  );
}

Map<String, dynamic> _$ScalarMapToJson(ScalarMap instance) => <String, dynamic>{
      'graphql_type': instance.graphQLType,
      'dart_type': instance.dartType,
      'custom_parser_import': instance.customParserImport,
    };

SchemaMap _$SchemaMapFromJson(Map<String, dynamic> json) {
  return SchemaMap(
    output: json['output'] as String,
    schema: json['schema'] as String,
    queriesGlob: json['queries_glob'] as String,
    typeNameField: json.containsKey("type_name_field")
        ? json['type_name_field'] as String
        : '__typename',
    namingScheme: _$enumDecodeNullable(
        _$NamingSchemeEnumMap, json['naming_scheme'],
        unknownValue: NamingScheme.pathedWithTypes),
  );
}

Map<String, dynamic> _$SchemaMapToJson(SchemaMap instance) => <String, dynamic>{
      'output': instance.output,
      'schema': instance.schema,
      'queries_glob': instance.queriesGlob,
      'type_name_field': instance.typeNameField,
      'naming_scheme': _$NamingSchemeEnumMap[instance.namingScheme],
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source,
    {T? unknownValue}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value =
      enumValues.entries.singleWhereOrNull((e) => e.value == source)?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue!;
}

T? _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source,
    {T? unknownValue}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$NamingSchemeEnumMap = {
  NamingScheme.pathedWithTypes: 'pathedWithTypes',
  NamingScheme.pathedWithFields: 'pathedWithFields',
  NamingScheme.simple: 'simple',
};
