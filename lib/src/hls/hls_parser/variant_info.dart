class VariantInfo {
  VariantInfo({
    this.bitrate,
    this.videoGroupId,
    this.audioGroupId,
    this.subtitleGroupId,
    this.captionGroupId,
  });

  final int? bitrate;
  final String? videoGroupId;
  final String? audioGroupId;
  final String? subtitleGroupId;
  final String? captionGroupId;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VariantInfo) return false;

    return other.bitrate == bitrate &&
        other.videoGroupId == videoGroupId &&
        other.audioGroupId == audioGroupId &&
        other.subtitleGroupId == subtitleGroupId &&
        other.captionGroupId == captionGroupId;
  }

  @override
  int get hashCode => Object.hash(
        bitrate,
        videoGroupId,
        audioGroupId,
        subtitleGroupId,
        captionGroupId,
      );
}
