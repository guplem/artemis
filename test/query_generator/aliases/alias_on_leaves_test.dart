// @dart = 3.1.1

import 'package:artemis/generator/data/data.dart';
import 'package:artemis/generator/data/enum_value_definition.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  group('On aliases', () {
    test(
      'Leaves can be aliased',
      () async => testGenerator(
        query: query,
        schema: r'''
          schema {
            query: Response
          }

          type Response {
            s: String
            o: SomeObject
            ob: [SomeObject]
          }

          type SomeObject {
            e: MyEnum
          }
          
          enum MyEnum {
            A
            B
          }
        ''',
        libraryDefinition: libraryDefinition,
        generatedFile: generatedFile,
      ),
    );
  });
}

const query = r'''
        query some_query {
          thisIsAString: s
          o {
            thisIsAnEnum: e
          }
        }
        ''';

final LibraryDefinition libraryDefinition =
    LibraryDefinition(basename: r'query.graphql', queries: [
  QueryDefinition(
      name: QueryName(name: r'SomeQuery$_Response'),
      operationName: r'some_query',
      classes: [
        EnumDefinition(name: EnumName(name: r'MyEnum'), values: [
          EnumValueDefinition(
            name: EnumValueName(name: r'A'),
          ),
          EnumValueDefinition(
            name: EnumValueName(name: r'B'),
          ),
          EnumValueDefinition(
            name: EnumValueName(name: r'ARTEMIS_UNKNOWN'),
          ),
        ]),
        ClassDefinition(
            name: ClassName(name: r'SomeQuery$_Response$_SomeObject'),
            properties: [
              ClassProperty(
                  type: TypeName(name: r'MyEnum'),
                  name: ClassPropertyName(name: r'thisIsAnEnum'),
                  annotations: [
                    r'JsonKey(unknownEnumValue: MyEnum.artemisUnknown)'
                  ],
                  isNonNull: false,
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: TypeName(name: r'__typename'),
            isInput: false),
        ClassDefinition(
            name: ClassName(name: r'SomeQuery$_Response'),
            properties: [
              ClassProperty(
                  type: TypeName(name: r'String'),
                  name: ClassPropertyName(name: r'thisIsAString'),
                  isNonNull: false,
                  isResolveType: false),
              ClassProperty(
                  type: TypeName(name: r'SomeQuery$_Response$_SomeObject'),
                  name: ClassPropertyName(name: r'o'),
                  isNonNull: false,
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: TypeName(name: r'__typename'),
            isInput: false)
      ],
      generateHelpers: false,
      suffix: r'Query')
]);

const generatedFile = r'''// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class SomeQuery$Response$SomeObject with EquatableMixin {
  SomeQuery$Response$SomeObject();

  factory SomeQuery$Response$SomeObject.fromJson(Map<String, dynamic> json) =>
      _$SomeQuery$Response$SomeObjectFromJson(json);

  @JsonKey(unknownEnumValue: MyEnum.artemisUnknown)
  MyEnum thisIsAnEnum;

  @override
  List<Object> get props => [thisIsAnEnum];
  Map<String, dynamic> toJson() => _$SomeQuery$Response$SomeObjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SomeQuery$Response with EquatableMixin {
  SomeQuery$Response();

  factory SomeQuery$Response.fromJson(Map<String, dynamic> json) =>
      _$SomeQuery$ResponseFromJson(json);

  String thisIsAString;

  SomeQuery$Response$SomeObject o;

  @override
  List<Object> get props => [thisIsAString, o];
  Map<String, dynamic> toJson() => _$SomeQuery$ResponseToJson(this);
}

enum MyEnum {
  @JsonValue('A')
  a,
  @JsonValue('B')
  b,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
''';
