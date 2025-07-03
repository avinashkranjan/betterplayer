import 'package:better_player/src/hls/hls_parser/variant_info.dart';
import 'package:collection/collection.dart';

class HlsTrackMetadataEntry {
  HlsTrackMetadataEntry({this.groupId, this.name, this.variantInfos});

  /// The GROUP-ID value of this track, if the track is derived from an EXT-X-MEDIA tag. Null if the
  /// track is not derived from an EXT-X-MEDIA TAG.
  final String? groupId;

  /// The NAME value of this track, if the track is derived from an EXT-X-MEDIA tag. Null if the
  /// track is not derived from an EXT-X-MEDIA TAG.
  final String? name;

  /// The EXT-X-STREAM-INF tags attributes associated with this track.
  /// This field is non-applicable (and therefore empty) if this track is derived from an EXT-X-MEDIA tag.
  final List<VariantInfo>? variantInfos;

  static const _variantInfoEquality = ListEquality<VariantInfo>();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HlsTrackMetadataEntry) return false;

    return other.groupId == groupId &&
        other.name == name &&
        _variantInfoEquality.equals(other.variantInfos, variantInfos);
  }

  @override
  int get hashCode => Object.hash(
        groupId,
        name,
        variantInfos == null ? null : _variantInfoEquality.hash(variantInfos!),
      );
}
