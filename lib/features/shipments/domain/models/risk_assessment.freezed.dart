// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk_assessment.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it.');

RiskAssessment _$RiskAssessmentFromJson(Map<String, dynamic> json) {
  return _RiskAssessment.fromJson(json);
}

mixin _$RiskAssessment {
  String get riskLevel => throw _privateConstructorUsedError;
  List<String> get riskFactors => throw _privateConstructorUsedError;
  String get mitigationStrategy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RiskAssessmentCopyWith<RiskAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $RiskAssessmentCopyWith<$Res> {
  factory $RiskAssessmentCopyWith(
          RiskAssessment value, $Res Function(RiskAssessment) then) =
      _$RiskAssessmentCopyWithImpl<$Res, RiskAssessment>;
  @useResult
  $Res call(
      {String riskLevel, List<String> riskFactors, String mitigationStrategy});
}

class _$RiskAssessmentCopyWithImpl<$Res, $Val extends RiskAssessment>
    implements $RiskAssessmentCopyWith<$Res> {
  _$RiskAssessmentCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskLevel = null,
    Object? riskFactors = null,
    Object? mitigationStrategy = null,
  }) {
    return _then(_value.copyWith(
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
      riskFactors: null == riskFactors
          ? _value.riskFactors
          : riskFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mitigationStrategy: null == mitigationStrategy
          ? _value.mitigationStrategy
          : mitigationStrategy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

abstract class _$$RiskAssessmentImplCopyWith<$Res>
    implements $RiskAssessmentCopyWith<$Res> {
  factory _$$RiskAssessmentImplCopyWith(_$RiskAssessmentImpl value,
          $Res Function(_$RiskAssessmentImpl) then) =
      __$$RiskAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String riskLevel, List<String> riskFactors, String mitigationStrategy});
}

class __$$RiskAssessmentImplCopyWithImpl<$Res>
    extends _$RiskAssessmentCopyWithImpl<$Res, _$RiskAssessmentImpl>
    implements _$$RiskAssessmentImplCopyWith<$Res> {
  __$$RiskAssessmentImplCopyWithImpl(
      _$RiskAssessmentImpl _value, $Res Function(_$RiskAssessmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskLevel = null,
    Object? riskFactors = null,
    Object? mitigationStrategy = null,
  }) {
    return _then(_$RiskAssessmentImpl(
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
      riskFactors: null == riskFactors
          ? _value._riskFactors
          : riskFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mitigationStrategy: null == mitigationStrategy
          ? _value.mitigationStrategy
          : mitigationStrategy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

class _$RiskAssessmentImpl implements _RiskAssessment {
  const _$RiskAssessmentImpl(
      {required this.riskLevel,
      required final List<String> riskFactors,
      required this.mitigationStrategy})
      : _riskFactors = riskFactors;

  factory _$RiskAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskAssessmentImplFromJson(json);

  @override
  final String riskLevel;
  final List<String> _riskFactors;
  @override
  List<String> get riskFactors {
    if (_riskFactors is EqualUnmodifiableListView) return _riskFactors;
    return EqualUnmodifiableListView(_riskFactors);
  }

  @override
  final String mitigationStrategy;

  @override
  String toString() {
    return 'RiskAssessment(riskLevel: $riskLevel, riskFactors: $riskFactors, mitigationStrategy: $mitigationStrategy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskAssessmentImpl &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            const DeepCollectionEquality()
                .equals(other._riskFactors, _riskFactors) &&
            (identical(other.mitigationStrategy, mitigationStrategy) ||
                other.mitigationStrategy == mitigationStrategy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, riskLevel,
      const DeepCollectionEquality().hash(_riskFactors), mitigationStrategy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith =>
      __$$RiskAssessmentImplCopyWithImpl<_$RiskAssessmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskAssessmentImplToJson(this);
  }
}

abstract class _RiskAssessment implements RiskAssessment {
  const factory _RiskAssessment(
      {required final String riskLevel,
      required final List<String> riskFactors,
      required final String mitigationStrategy}) = _$RiskAssessmentImpl;

  factory _RiskAssessment.fromJson(Map<String, dynamic> json) =
      _$RiskAssessmentImpl.fromJson;

  @override
  String get riskLevel;
  @override
  List<String> get riskFactors;
  @override
  String get mitigationStrategy;
  @override
  @JsonKey(ignore: true)
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith;
}
