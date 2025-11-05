Pod::Spec.new do |spec|
  spec.name        = 'PLCrashReporter'
  spec.version     = '1.12.0'
  spec.summary     = 'Reliable, open-source crash reporting for iOS, macOS and tvOS.'
  spec.description = 'PLCrashReporter is a reliable open source library that provides an in-process live crash reporting framework for use on iOS, macOS and tvOS. The library detects crashes and generates reports to help your investigation and troubleshooting with the information of application, system, process, thread, etc. as well as stack traces.'

  spec.homepage    = 'https://github.com/microsoft/plcrashreporter'
  spec.license     = { :type => 'MIT', :file => 'LICENSE.txt' }
  spec.authors     = { 'Microsoft' => 'appcentersdk@microsoft.com' }

  spec.source      = { :http     => "https://github.com/microsoft/plcrashreporter/releases/download/#{spec.version}/PLCrashReporter-XCFramework-#{spec.version}.zip",
                       :flatten  => true }

  spec.resource_bundle = { 'PLCrashReporter' => 'CrashReporter.xcframework/PrivacyInfo.xcprivacy' }

  spec.ios.deployment_target    = '13.0'
  spec.osx.deployment_target    = '11.5'
  spec.tvos.deployment_target   = '12.0'
  spec.vendored_frameworks = "CrashReporter.xcframework"
  spec.libraries = 'c++'

spec.user_target_xcconfig = {
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 x86_64',
    'VALID_ARCHS' => 'arm64'
  }

  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 x86_64',
    'VALID_ARCHS' => 'arm64',
    'OTHER_LDFLAGS' => '-lc++' 
  }
end
