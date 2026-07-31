// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_summary.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it.');

ShipmentSummary _$ShipmentSummaryFromJson(Map<String, dynamic> json) {
  return _ShipmentSummary.fromJson(json);
}

mixin _$ShipmentSummary {
  Shipment get shipment => throw _privateConstructorUsedError;
  ConversationAnalysis? get conversationAnalysis =>
      throw _privateConstructorUsedError;
  ImageAnalysis? get imageAnalysis => throw _privateConstructorUsedError;
  RiskAssessment get riskAssessment => throw _privateConstructorUsedError;
  Recommendation get recommendation => throw _privateConstructorUsedError;
  double get overallConfidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShipmentSummaryCopyWith<ShipmentSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $ShipmentSummaryCopyWith<$Res> {
  factory $ShipmentSummaryCopyWith(
          ShipmentSummary value, $Res Function(ShipmentSummary) then) =
      _$ShipmentSummaryCopyWithImpl<$Res, ShipmentSummary>;
  @useResult
  $Res call(
      {Shipment shipment,
      ConversationAnalysis? conversationAnalysis,
      ImageAnalysis? imageAnalysis,
      RiskAssessment riskAssessment,
      Recommendation recommendation,
      double overallConfidence});

  $ShipmentCopyWith<$Res> get shipment;
  $ConversationAnalysisCopyWith<$Res>? get conversationAnalysis;
  $ImageAnalysisCopyWith<$Res>? get imageAnalysis;
  $RiskAssessmentCopyWith<$Res> get riskAssessment;
  $RecommendationCopyWith<$Res> get recommendation;
}

class _$ShipmentSummaryCopyWithImpl<$Res, $Val extends ShipmentSummary>
    implements $ShipmentSummaryCopyWith<$Res> {
  _$ShipmentSummaryCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipment = null,
    Object? conversationAnalysis = freezed,
    Object? imageAnalysis = freezed,
    Object? riskAssessment = null,
    Object? recommendation = null,
    Object? overallConfidence = null,
  }) {
    return _then(_value.copyWith(
      shipment: null == shipment
          ? _value.shipment
          : shipment // ignore: cast_nullable_to_non_nullable
              as Shipment,
      conversationAnalysis: freezed == conversationAnalysis
          ? _value.conversationAnalysis
          : conversationAnalysis // ignore: cast_nullable_to_non_nullable
              as ConversationAnalysis?,
      imageAnalysis: freezed == imageAnalysis
          ? _value.imageAnalysis
          : imageAnalysis // ignore: cast_nullable_to_non_nullable
              as ImageAnalysis?,
      riskAssessment: null == riskAssessment
          ? _value.riskAssessment
          : riskAssessment // ignore: cast_nullable_to_non_nullable
              as RiskAssessment,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as Recommendation,
      overallConfidence: null == overallConfidence
          ? _value.overallConfidence
          : overallConfidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipmentCopyWith<$Res> get shipment {
    return $ShipmentCopyWith<$Res>(_value.shipment, (value) {
      return _then(_value.copyWith(shipment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ConversationAnalysisCopyWith<$Res>? get conversationAnalysis {
    if (_value.conversationAnalysis == null) {
      return null;
    }

    return $ConversationAnalysisCopyWith<$Res>(_value.conversationAnalysis!,
        (value) {
      return _then(_value.copyWith(conversationAnalysis: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageAnalysisCopyWith<$Res>? get imageAnalysis {
    if (_value.imageAnalysis == null) {
      return null;
    }

    return $ImageAnalysisCopyWith<$Res>(_value.imageAnalysis!, (value) {
      return _then(_value.copyWith(imageAnalysis: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RiskAssessmentCopyWith<$Res> get riskAssessment {
    return $RiskAssessmentCopyWith<$Res>(_value.riskAssessment, (value) {
      return _then(_value.copyWith(riskAssessment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecommendationCopyWith<$Res> get recommendation {
    return $RecommendationCopyWith<$Res>(_value.recommendation, (value) {
      return _then(_value.copyWith(recommendation: value) as $Val);
    });
  }
}

abstract class _$$ShipmentSummaryImplCopyWith<$Res>
    implements $ShipmentSummaryCopyWith<$Res> {
  factory _$$ShipmentSummaryImplCopyWith(_$ShipmentSummaryImpl value,
          $Res Function(_$ShipmentSummaryImpl) then) =
      __$$ShipmentSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Shipment shipment,
      ConversationAnalysis? conversationAnalysis,
      ImageAnalysis? imageAnalysis,
      RiskAssessment riskAssessment,
      Recommendation recommendation,
      double overallConfidence});

  @override
  $ShipmentCopyWith<$Res> get shipment;
  @override
  $ConversationAnalysisCopyWith<$Res>? get conversationAnalysis;
  @override
  $ImageAnalysisCopyWith<$Res>? get imageAnalysis;
  @override
  $RiskAssessmentCopyWith<$Res> get riskAssessment;
  @override
  $RecommendationCopyWith<$Res> get recommendation;
}

class __$$ShipmentSummaryImplCopyWithImpl<$Res>
    extends _$ShipmentSummaryCopyWithImpl<$Res, _$ShipmentSummaryImpl>
    implements _$$ShipmentSummaryImplCopyWith<$Res> {
  __$$ShipmentSummaryImplCopyWithImpl(_$ShipmentSummaryImpl _value,
      $Res Function(_$ShipmentSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipment = null,
    Object? conversationAnalysis = freezed,
    Object? imageAnalysis = freezed,
    Object? riskAssessment = null,
    Object? recommendation = null,
    Object? overallConfidence = null,
  }) {
    return _then(_$ShipmentSummaryImpl(
      shipment: null == shipment
          ? _value.shipment
          : shipment // ignore: cast_nullable_to_non_nullable
              as Shipment,
      conversationAnalysis: freezed == conversationAnalysis
          ? _value.conversationAnalysis
          : conversationAnalysis // ignore: cast_nullable_to_non_nullable
              as ConversationAnalysis?,
      imageAnalysis: freezed == imageAnalysis
          ? _value.imageAnalysis
          : imageAnalysis // ignore: cast_nullable_to_non_nullable
              as ImageAnalysis?,
      riskAssessment: null == riskAssessment
          ? _value.riskAssessment
          : riskAssessment // ignore: cast_nullable_to_non_nullable
              as RiskAssessment,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as Recommendation,
      overallConfidence: null == overallConfidence
          ? _value.overallConfidence
          : overallConfidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

class _$ShipmentSummaryImpl implements _ShipmentSummary {
  const _$ShipmentSummaryImpl(
      {required this.shipment,
      this.conversationAnalysis,
      this.imageAnalysis,
      required this.riskAssessment,
      required this.recommendation,
      required this.overallConfidence});

  factory _$ShipmentSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentSummaryImplFromJson(json);

  @override
  final Shipment shipment;
  @override
  final ConversationAnalysis? conversationAnalysis;
  @override
  final ImageAnalysis? imageAnalysis;
  @override
  final RiskAssessment riskAssessment;
  @override
  final Recommendation recommendation;
  @override
  final double overallConfidence;

  @override
  String toString() {
    return 'ShipmentSummary(shipment: $shipment, conversationAnalysis: $conversationAnalysis, imageAnalysis: $imageAnalysis, riskAssessment: $riskAssessment, recommendation: $recommendation, overallConfidence: $overallConfidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentSummaryImpl &&
            (identical(other.shipment, shipment) ||
                other.shipment == shipment) &&
            (identical(other.conversationAnalysis, conversationAnalysis) ||
                other.conversationAnalysis == conversationAnalysis) &&
            (identical(other.imageAnalysis, imageAnalysis) ||
                other.imageAnalysis == imageAnalysis) &&
            (identical(other.riskAssessment, riskAssessment) ||
                other.riskAssessment == riskAssessment) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.overallConfidence, overallConfidence) ||
                other.overallConfidence == overallConfidence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shipment, conversationAnalysis,
      imageAnalysis, riskAssessment, recommendation, overallConfidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentSummaryImplCopyWith<_$ShipmentSummaryImpl> get copyWith =>
      __$$ShipmentSummaryImplCopyWithImpl<_$ShipmentSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentSummaryImplToJson(this);
  }
}

abstract class _ShipmentSummary implements ShipmentSummary {
  const factory _ShipmentSummary(
      {required final Shipment shipment,
      final ConversationAnalysis? conversationAnalysis,
      final ImageAnalysis? imageAnalysis,
      required final RiskAssessment riskAssessment,
      required final Recommendation recommendation,
      required final double overallConfidence}) = _$ShipmentSummaryImpl;

  factory _ShipmentSummary.fromJson(Map<String, dynamic> json) =
      _$ShipmentSummaryImpl.fromJson;

  @override
  Shipment get shipment;
  @override
  ConversationAnalysis? get conversationAnalysis;
  @override
  ImageAnalysis? get imageAnalysis;
  @override
  RiskAssessment get riskAssessment;
  @override
  Recommendation get recommendation;
  @override
  double get overallConfidence;
  @override
  @JsonKey(ignore: true)
  _$$ShipmentSummaryImplCopyWith<_$ShipmentSummaryImpl> get copyWith;
}
