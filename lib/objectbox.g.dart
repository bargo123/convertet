// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/core/models/country_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 8325328108804318999),
      name: 'CountryResult',
      lastPropertyId: const IdUid(8, 6033535043895616986),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(id: const IdUid(1, 787990348451983005), name: 'id', type: 6, flags: 1),
        ModelProperty(id: const IdUid(2, 2397987294266923416), name: 'alpha3', type: 9, flags: 0),
        ModelProperty(id: const IdUid(3, 2313427835133961727), name: 'currencyId', type: 9, flags: 0),
        ModelProperty(id: const IdUid(4, 3987660651595199137), name: 'currencyName', type: 9, flags: 0),
        ModelProperty(id: const IdUid(5, 3342526436265048159), name: 'currencySymbol', type: 9, flags: 0),
        ModelProperty(
            id: const IdUid(6, 2834446109681202675),
            name: 'uid',
            type: 9,
            flags: 2080,
            indexId: const IdUid(2, 6750833178069626784)),
        ModelProperty(id: const IdUid(7, 5443417581323207372), name: 'name', type: 9, flags: 0),
        ModelProperty(id: const IdUid(8, 6033535043895616986), name: 'image', type: 9, flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 8325328108804318999),
      lastIndexId: const IdUid(2, 6750833178069626784),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [6509655055813645433],
      retiredIndexUids: const [],
      retiredPropertyUids: const [8532979751907238660, 8921258798018016236, 3698642586116934279, 5672967209237382131],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    CountryResult: EntityDefinition<CountryResult>(
        model: _entities[0],
        toOneRelations: (CountryResult object) => [],
        toManyRelations: (CountryResult object) => {},
        getId: (CountryResult object) => object.id,
        setId: (CountryResult object, int id) {
          object.id = id;
        },
        objectToFB: (CountryResult object, fb.Builder fbb) {
          final alpha3Offset = object.alpha3 == null ? null : fbb.writeString(object.alpha3!);
          final currencyIdOffset = object.currencyId == null ? null : fbb.writeString(object.currencyId!);
          final currencyNameOffset = object.currencyName == null ? null : fbb.writeString(object.currencyName!);
          final currencySymbolOffset = object.currencySymbol == null ? null : fbb.writeString(object.currencySymbol!);
          final uidOffset = object.uid == null ? null : fbb.writeString(object.uid!);
          final nameOffset = object.name == null ? null : fbb.writeString(object.name!);
          final imageOffset = object.image == null ? null : fbb.writeString(object.image!);
          fbb.startTable(9);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, alpha3Offset);
          fbb.addOffset(2, currencyIdOffset);
          fbb.addOffset(3, currencyNameOffset);
          fbb.addOffset(4, currencySymbolOffset);
          fbb.addOffset(5, uidOffset);
          fbb.addOffset(6, nameOffset);
          fbb.addOffset(7, imageOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = CountryResult(
              alpha3: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 6),
              currencyId: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 8),
              currencyName: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 10),
              currencySymbol: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 12),
              id: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4),
              name: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 16),
              uid: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 14),
              image: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 18));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [CountryResult] entity fields to define ObjectBox queries.
class CountryResult_ {
  /// see [CountryResult.id]
  static final id = QueryIntegerProperty<CountryResult>(_entities[0].properties[0]);

  /// see [CountryResult.alpha3]
  static final alpha3 = QueryStringProperty<CountryResult>(_entities[0].properties[1]);

  /// see [CountryResult.currencyId]
  static final currencyId = QueryStringProperty<CountryResult>(_entities[0].properties[2]);

  /// see [CountryResult.currencyName]
  static final currencyName = QueryStringProperty<CountryResult>(_entities[0].properties[3]);

  /// see [CountryResult.currencySymbol]
  static final currencySymbol = QueryStringProperty<CountryResult>(_entities[0].properties[4]);

  /// see [CountryResult.uid]
  static final uid = QueryStringProperty<CountryResult>(_entities[0].properties[5]);

  /// see [CountryResult.name]
  static final name = QueryStringProperty<CountryResult>(_entities[0].properties[6]);

  /// see [CountryResult.image]
  static final image = QueryStringProperty<CountryResult>(_entities[0].properties[7]);
}
