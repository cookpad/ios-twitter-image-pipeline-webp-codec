Pod::Spec.new do |s|
  s.name = 'TwitterImagePipelineWebPCodec'
  s.version = '2.25.0'
  s.summary = 'WebP Codec for TwitterImagePipeline using XCFramework bundle of libwebp'
  s.description = 'Workaround for https://github.com/twitter/ios-twitter-image-pipeline/pull/66'
  s.homepage = 'https://github.com/twitter/ios-twitter-image-pipeline'
  s.author = { 'Liam Nichols' => 'liam-nichols@cookpad.jp', 'Twitter' => 'opensource@twitter.com' }
  s.source = { :git => 'https://github.com/cookpad/ios-twitter-image-pipeline-webp-codec.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_versions   = [ 5.0 ]

  s.subspec 'Default' do |s|
    s.source_files = 'Sources/TIPXWebPCodec.{h,m}', 'Sources/TIPXUtils.{h,m}'
    s.public_header_files = 'Sources/TIPXWebPCodec.h'
    s.vendored_frameworks = 'libwebp/1.2.2/WebP.xcframework'
    s.dependency 'TwitterImagePipeline', '~> 2.25.0'
  end

  s.subspec 'Animated' do |s|
    s.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'TIPX_WEBP_ANIMATION_DECODING_ENABLED=1' }
    s.vendored_frameworks = 'libwebp/1.2.2/WebPDemux.xcframework'
    s.dependency 'TwitterImagePipelineWebPCodec/Default'
  end

  s.default_subspec = 'Default'
end
