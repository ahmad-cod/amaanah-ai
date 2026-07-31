// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_analysis.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it.');

ConversationAnalysis _$ConversationAnalysisFromJson(
    Map<String, dynamic> json) {
  return _ConversationAnalysis.fromJson(json);
}

mixin _$ConversationAnalysis {
  String get rawText => throw _privateConstructorUsedError;
  String get intent => throw _privateConstructorUsedError;
  List<String> get extractedEntities => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationAnalysisCopyWith<ConversationAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $ConversationAnalysisCopyWith<$Res> {
  factory $ConversationAnalysisCopyWith(ConversationAnalysis value,
          $Res Function(ConversationAnalysis) then) =
      _$ConversationAnalysisCopyWithImpl<$Res, ConversationAnalysis>;
  @useResult
  $Res call(
      {String rawText,
      String intent,
      List<String> extractedEntities,
      double confidence});
}

class _$ConversationAnalysisCopyWithImpl<$Res,
        $Val extends ConversationAnalysis>
    implements $ConversationAnalysisCopyWith<$Res> {
  _$ConversationAnalysisCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawText = null,
    Object? intent = null,
    Object? extractedEntities = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      rawText: null == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String,
      intent: null == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String,
      extractedEntities: null == extractedEntities
          ? _value.extractedEntities
          : extractedEntities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

abstract class _$$ConversationAnalysisImplCopyWith<$Res>
    implements $ConversationAnalysisCopyWith<$Res> {
  factory _$$ConversationAnalysisImplCopyWith(
          _$ConversationAnalysisImpl value,
          $Res Function(_$ConversationAnalysisImpl) then) =
      __$$ConversationAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String rawText,
      String intent,
      List<String> extractedEntities,
      double confidence});
}

class __$$ConversationAnalysisImplCopyWithImpl<$Res>
    extends _$ConversationAnalysisCopyWithImpl<$Res, _$ConversationAnalysisImpl>
    implements _$$ConversationAnalysisImplCopyWith<$Res> {
  __$$ConversationAnalysisImplCopyWithImpl(_$ConversationAnalysisImpl _value,
      $Res Function(_$ConversationAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawText = null,
    Object? intent = null,
    Object? extractedEntities = null,
    Object? confidence = null,
  }) {
    return _then(_$ConversationAnalysisImpl(
      rawText: null == rawText
          ? _value.rawText
          : rawText // ignore: cast_nullable_to_non_nullable
              as String,
      intent: null == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String,
      extractedEntities: null == extractedEntities
          ? _value._extractedEntities
          : extractedEntities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

class _$ConversationAnalysisImpl implements _ConversationAnalysis {
  const _$ConversationAnalysisImpl(
      {required this.rawText,
      required this.intent,
      required final List<String> extractedEntities,
      required this.confidence})
      : _extractedEntities = extractedEntities;

  factory _$ConversationAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationAnalysisImplFromJson(json);

  @override
  final String rawText;
  @override
  final String intent;
  final List<String> _extractedEntities;
  @override
  List<String> get extractedEntities {
    if (_extractedEntities is EqualUnmodifiableListView)
      return _extractedEntities;
    return EqualUnmodifiableListView(_extractedEntities);
  }

  @override
  final double confidence;

  @override
  String toString() {
    return 'ConversationAnalysis(rawText: $rawText, intent: $intent, extractedEntities: $extractedEntities, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationAnalysisImpl &&
            (identical(other.rawText, rawText) || other.rawText == rawText) &&
            (identical(other.intent, intent) || other.intent == intent) &&
            const DeepCollectionEquality()
                .equals(other._extractedEntities, _extractedEntities) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rawText, intent,
      const DeepCollectionEquality().hash(_extractedEntities), confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationAnalysisImplCopyWith<_$ConversationAnalysisImpl>
      get copyWith =>
          __$$ConversationAnalysisImplCopyWithImpl<_$ConversationAnalysisImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationAnalysisImplToJson(this);
  }
}

abstract class _ConversationAnalysis implements ConversationAnalysis {
  const factory _ConversationAnalysis(
      {required final String rawText,
      required final String intent,
      required final List<String> extractedEntities,
      required final double confidence}) = _$ConversationAnalysisImpl;

  factory _ConversationAnalysis.fromJson(Map<String, dynamic> json) =
      _$ConversationAnalysisImpl.fromJson;

  @override
  String get rawText;
  @override
  String get intent;
  @override
  List<String> get extractedEntities;
  @override
  double get confidence;
  @override
  @JsonKey(ignore: true)
  _$$ConversationAnalysisImplCopyWith<_$ConversationAnalysisImpl>
      get copyWith;
}
