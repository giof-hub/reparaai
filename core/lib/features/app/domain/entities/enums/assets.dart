class Assets {
  
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();

}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  String get icIdCard => 'assets/svgs/ic_id.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  String get identidade => 'assets/images/identidade.png';
}

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  String get loadingReparaai => 'assets/animations/loading_reparaai.json';
}