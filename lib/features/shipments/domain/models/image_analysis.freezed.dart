// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_analysis.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it.');

ImageAnalysis _$ImageAnalysisFromJson(Map<String, dynamic> json) {
  return _ImageAnalysis.fromJson(json);
}

mixin _$ImageAnalysis {
  String get imagePath => throw _privateConstructorUsedError;
  String get detectedObject => throw _privateConstructorUsedError;
  String? get extractedText => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageAnalysisCopyWith<ImageAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $ImageAnalysisCopyWith<$Res> {
  factory $ImageAnalysisCopyWith(
          ImageAnalysis value, $Res Function(ImageAnalysis) then) =
      _$ImageAnalysisCopyWithImpl<$Res, ImageAnalysis>;
  @useResult
  $Res call(
      {String imagePath,
      String detectedObject,
      String? extractedText,
      double qualityScore});
}

class _$ImageAnalysisCopyWithImpl<$Res, $Val extends ImageAnalysis>
    implements $ImageAnalysisCopyWith<$Res> {
  _$ImageAnalysisCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? detectedObject = null,
    Object? extractedText = freezed,
    Object? qualityScore = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      detectedObject: null == detectedObject
          ? _value.detectedObject
          : detectedObject // ignore: cast_nullable_to_non_nullable
              as String,
      extractedText: freezed == extractedText
          ? _value.extractedText
          : extractedText // ignore: cast_nullable_to_non_nullable
              as String?,
      qualityScore: null == qualityScore
          ? _value.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

abstract class _$$ImageAnalysisImplCopyWith<$Res>
    implements $ImageAnalysisCopyWith<$Res> {
  factory _$$ImageAnalysisImplCopyWith(_$ImageAnalysisImpl value,
          $Res Function(_$ImageAnalysisImpl) then) =
      __$$ImageAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imagePath,
      String detectedObject,
      String? extractedText,
      double qualityScore});
}

class __$$ImageAnalysisImplCopyWithImpl<$Res>
    extends _$ImageAnalysisCopyWithImpl<$Res, _$ImageAnalysisImpl>
    implements _$$ImageAnalysisImplCopyWith<$Res> {
  __$$ImageAnalysisImplCopyWithImpl(
      _$ImageAnalysisImpl _value, $Res Function(_$ImageAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? detectedObject = null,
    Object? extractedText = freezed,
    Object? qualityScore = null,
  }) {
    return _then(_$ImageAnalysisImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      detectedObject: null == detectedObject
          ? _value.detectedObject
          : detectedObject // ignore: cast_nullable_to_non_nullable
              as String,
      extractedText: freezed == extractedText
          ? _value.extractedText
          : extractedText // ignore: cast_nullable_to_non_nullable
              as String?,
      qualityScore: null == qualityScore
          ? _value.qualityScore
          : qualityScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

class _$ImageAnalysisImpl implements _ImageAnalysis {
  const _$ImageAnalysisImpl(
      {required this.imagePath,
      required this.detectedObject,
      this.extractedText,
      required this.qualityScore});

  factory _$ImageAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageAnalysisImplFromJson(json);

  @override
  final String imagePath;
  @override
  final String detectedObject;
  @override
  final String? extractedText;
  @override
  final double qualityScore;

  @override
  String toString() {
    return 'ImageAnalysis(imagePath: $imagePath, detectedObject: $detectedObject, extractedText: $extractedText, qualityScore: $qualityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageAnalysisImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.detectedObject, detectedObject) ||
                other.detectedObject == detectedObject) &&
            (identical(other.extractedText, extractedText) ||
                other.extractedText == extractedText) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, imagePath, detectedObject, extractedText, qualityScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageAnalysisImplCopyWith<_$ImageAnalysisImpl> get copyWith =>
      __$$ImageAnalysisImplCopyWithImpl<_$ImageAnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageAnalysisImplToJson(this);
  }
}

abstract class _ImageAnalysis implements ImageAnalysis {
  const factory _ImageAnalysis(
      {required final String imagePath,
      required final String detectedObject,
      final String? extractedText,
      required final double qualityScore}) = _$ImageAnalysisImpl;

  factory _ImageAnalysis.fromJson(Map<String, dynamic> json) =
      _$ImageAnalysisImpl.fromJson;

  @override
  String get imagePath;
  @override
  String get detectedObject;
  @override
  String? get extractedText;
  @override
  double get qualityScore;
  @override
  @JsonKey(ignore: true)
  _$$ImageAnalysisImplCopyWith<_$ImageAnalysisImpl> get copyWith;
}
