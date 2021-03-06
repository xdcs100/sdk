// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../constants/values.dart' show ConstantValue, PrimitiveConstantValue;
import '../elements/entities.dart';
import '../serialization/serialization.dart';
import '../universe/selector.dart';
import 'abstract_value_domain.dart';

class TrivialAbstractValue implements AbstractValue {
  const TrivialAbstractValue();
}

class TrivialAbstractValueDomain implements AbstractValueDomain {
  const TrivialAbstractValueDomain();

  @override
  AbstractValue get dynamicType => const TrivialAbstractValue();

  @override
  void writeAbstractValueToDataSink(DataSink sink, AbstractValue value) {}

  @override
  AbstractValue readAbstractValueFromDataSource(DataSource source) =>
      const TrivialAbstractValue();

  @override
  String getCompactText(AbstractValue value) => '?';

  @override
  AbstractBool isFixedLengthJsIndexable(AbstractValue value) =>
      AbstractBool.Maybe;

  @override
  AbstractBool isJsIndexableAndIterable(AbstractValue value) =>
      AbstractBool.Maybe;

  @override
  AbstractBool isJsIndexable(AbstractValue value) => AbstractBool.Maybe;

  @override
  MemberEntity locateSingleMember(AbstractValue receiver, Selector selector) =>
      null;

  @override
  AbstractBool isIn(AbstractValue subset, AbstractValue superset) =>
      AbstractBool.Maybe;

  @override
  AbstractBool contains(AbstractValue superset, AbstractValue subset) =>
      AbstractBool.Maybe;

  @override
  AbstractBool needsNoSuchMethodHandling(
          AbstractValue receiver, Selector selector) =>
      AbstractBool.Maybe;

  @override
  AbstractBool isTargetingMember(
          AbstractValue receiver, MemberEntity member, Selector selector) =>
      AbstractBool.Maybe;

  @override
  AbstractValue computeReceiver(Iterable<MemberEntity> members) =>
      const TrivialAbstractValue();

  @override
  PrimitiveConstantValue getPrimitiveValue(AbstractValue value) => null;

  @override
  AbstractValue createPrimitiveValue(
          AbstractValue originalValue, PrimitiveConstantValue value) =>
      const TrivialAbstractValue();

  @override
  bool isPrimitiveValue(AbstractValue value) => false;

  @override
  MemberEntity getAllocationElement(AbstractValue value) => null;

  @override
  Object getAllocationNode(AbstractValue value) => null;

  @override
  AbstractValue getGeneralization(AbstractValue value) =>
      const TrivialAbstractValue();

  @override
  bool isSpecializationOf(
          AbstractValue specialization, AbstractValue generalization) =>
      false;

  @override
  AbstractValue getDictionaryValueForKey(AbstractValue value, String key) {
    throw new UnsupportedError(
        "TrivialAbstractValueDomain.getDictionaryValueForKey");
  }

  @override
  bool containsDictionaryKey(AbstractValue value, String key) {
    throw new UnsupportedError(
        "TrivialAbstractValueDomain.containsDictionaryKey");
  }

  @override
  AbstractValue createDictionaryValue(
          AbstractValue originalValue,
          Object allocationNode,
          MemberEntity allocationElement,
          AbstractValue key,
          AbstractValue value,
          Map<String, AbstractValue> mappings) =>
      const TrivialAbstractValue();

  @override
  bool isDictionary(AbstractValue value) => false;

  @override
  AbstractValue getMapValueType(AbstractValue value) {
    throw new UnsupportedError("TrivialAbstractValueDomain.getMapValueType");
  }

  @override
  AbstractValue getMapKeyType(AbstractValue value) {
    throw new UnsupportedError("TrivialAbstractValueDomain.getMapKeyType");
  }

  @override
  AbstractValue createMapValue(
          AbstractValue originalValue,
          Object allocationNode,
          MemberEntity allocationElement,
          AbstractValue key,
          AbstractValue value) =>
      const TrivialAbstractValue();

  @override
  bool isMap(AbstractValue value) => false;

  @override
  int getContainerLength(AbstractValue value) => null;

  @override
  AbstractValue getContainerElementType(AbstractValue value) {
    throw new UnsupportedError(
        "TrivialAbstractValueDomain.getContainerElementType");
  }

  @override
  AbstractValue createContainerValue(
          AbstractValue originalValue,
          Object allocationNode,
          MemberEntity allocationElement,
          AbstractValue elementType,
          int length) =>
      const TrivialAbstractValue();

  @override
  bool isContainer(AbstractValue value) => false;

  @override
  AbstractValue computeAbstractValueForConstant(ConstantValue value) =>
      const TrivialAbstractValue();

  @override
  AbstractBool containsAll(AbstractValue a) => AbstractBool.Maybe;

  @override
  AbstractBool areDisjoint(AbstractValue a, AbstractValue b) =>
      AbstractBool.Maybe;

  @override
  AbstractValue intersection(AbstractValue a, AbstractValue b) =>
      const TrivialAbstractValue();

  @override
  AbstractValue unionOfMany(Iterable<AbstractValue> values) =>
      const TrivialAbstractValue();

  @override
  AbstractValue union(AbstractValue a, AbstractValue b) =>
      const TrivialAbstractValue();

  @override
  AbstractBool isPrimitiveOrNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isStringOrNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isString(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isBooleanOrNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isBoolean(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isDoubleOrNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isDouble(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isNumberOrNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isNumber(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isIntegerOrNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isPositiveIntegerOrNull(AbstractValue value) =>
      AbstractBool.Maybe;

  @override
  AbstractBool isPositiveInteger(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isUInt31(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isUInt32(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isInteger(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isInterceptor(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isPrimitiveString(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isArray(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isMutableIndexable(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isMutableArray(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isExtendableArray(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isFixedArray(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isIndexablePrimitive(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isPrimitiveArray(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isPrimitiveBoolean(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isPrimitiveNumber(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isPrimitive(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  ClassEntity getExactClass(AbstractValue value) => null;

  @override
  AbstractBool isExactOrNull(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isExact(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isEmpty(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isInstanceOf(AbstractValue value, ClassEntity cls) =>
      AbstractBool.Maybe;

  @override
  AbstractBool isInstanceOfOrNull(AbstractValue value, ClassEntity cls) =>
      AbstractBool.Maybe;

  @override
  AbstractBool containsOnlyType(AbstractValue value, ClassEntity cls) =>
      AbstractBool.Maybe;

  @override
  AbstractBool containsType(AbstractValue value, ClassEntity cls) =>
      AbstractBool.Maybe;

  @override
  AbstractValue includeNull(AbstractValue value) =>
      const TrivialAbstractValue();

  @override
  AbstractValue excludeNull(AbstractValue value) =>
      const TrivialAbstractValue();

  @override
  AbstractBool couldBeTypedArray(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractBool isTypedArray(AbstractValue value) => AbstractBool.Maybe;

  @override
  AbstractValue createNullableSubtype(ClassEntity cls) =>
      const TrivialAbstractValue();

  @override
  AbstractValue createNonNullSubtype(ClassEntity cls) =>
      const TrivialAbstractValue();

  @override
  AbstractValue createNonNullSubclass(ClassEntity cls) =>
      const TrivialAbstractValue();

  @override
  AbstractValue createNullableExact(ClassEntity cls) =>
      const TrivialAbstractValue();

  @override
  AbstractValue createNonNullExact(ClassEntity cls) =>
      const TrivialAbstractValue();

  @override
  AbstractValue get asyncStarStreamType => const TrivialAbstractValue();

  @override
  AbstractValue get asyncFutureType => const TrivialAbstractValue();

  @override
  AbstractValue get syncStarIterableType => const TrivialAbstractValue();

  @override
  AbstractValue get emptyType => const TrivialAbstractValue();

  @override
  AbstractValue get constMapType => const TrivialAbstractValue();

  @override
  AbstractValue get constListType => const TrivialAbstractValue();

  @override
  AbstractValue get positiveIntType => const TrivialAbstractValue();

  @override
  AbstractValue get uint32Type => const TrivialAbstractValue();

  @override
  AbstractValue get uint31Type => const TrivialAbstractValue();

  @override
  AbstractValue get fixedListType => const TrivialAbstractValue();

  @override
  AbstractValue get growableListType => const TrivialAbstractValue();

  @override
  AbstractValue get nullType => const TrivialAbstractValue();

  @override
  AbstractValue get nonNullType => const TrivialAbstractValue();

  @override
  AbstractValue get mapType => const TrivialAbstractValue();

  @override
  AbstractValue get listType => const TrivialAbstractValue();

  @override
  AbstractValue get stringType => const TrivialAbstractValue();

  @override
  AbstractValue get numType => const TrivialAbstractValue();

  @override
  AbstractValue get doubleType => const TrivialAbstractValue();

  @override
  AbstractValue get intType => const TrivialAbstractValue();

  @override
  AbstractValue get boolType => const TrivialAbstractValue();

  @override
  AbstractValue get functionType => const TrivialAbstractValue();

  @override
  AbstractValue get typeType => const TrivialAbstractValue();
}
