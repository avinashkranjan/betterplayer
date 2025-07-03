import 'dart:typed_data';
import 'package:collection/collection.dart';

class SchemeData {
  SchemeData({
    this.licenseServerUrl,
    required this.mimeType,
    this.data,
    this.requiresSecureDecryption,
  });

  final String? licenseServerUrl;
  final String mimeType;
  final Uint8List? data;
  final bool? requiresSecureDecryption;

  static const _dataEquality = ListEquality<int>();

  SchemeData copyWithData(Uint8List? data) => SchemeData(
        licenseServerUrl: licenseServerUrl,
        mimeType: mimeType,
        data: data,
        requiresSecureDecryption: requiresSecureDecryption,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SchemeData) return false;

    return other.mimeType == mimeType &&
        other.licenseServerUrl == licenseServerUrl &&
        other.requiresSecureDecryption == requiresSecureDecryption &&
        _dataEquality.equals(other.data, data);
  }

  @override
  int get hashCode => Object.hash(
        licenseServerUrl,
        mimeType,
        // hash the bytes by content, or null if no data
        data == null ? null : _dataEquality.hash(data!),
        requiresSecureDecryption,
      );
}
