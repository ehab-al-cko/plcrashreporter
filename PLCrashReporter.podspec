Pod::Spec.new do |spec|
  spec.name             = 'PLCrashReporter'
  spec.version          = '1.12.0'
  spec.summary          = 'Reliable, open-source crash reporting for iOS, macOS and tvOS.'
  spec.description      = 'PLCrashReporter is a reliable open source library that provides an in-process live crash reporting framework for use on iOS, macOS and tvOS. The library detects crashes and generates reports to help your investigation and troubleshooting with the information of application, system, process, thread, etc. as well as stack traces.'

  spec.homepage         = 'https://github.com/microsoft/plcrashreporter'
  spec.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  spec.authors          = { 'Microsoft' => 'appcentersdk@microsoft.com' }
  spec.swift_version    = '5.0'

  spec.source           = { :git => 'https://github.com/microsoft/plcrashreporter.git', :tag => spec.version }
  
  # Includes core files and the protobuf-c source/header files
  spec.source_files     = 'Source/**/*.{h,m}', 'Dependencies/protobuf-c/**/*.{h,c}'
  
  # 🔑 THE DEFINITIVE FIX: Manually inject the 'Dependencies' folder into the search path.
  # This ensures the compiler finds the path: Dependencies/protobuf-c/protobuf-c.h 
  spec.pod_target_xcconfig = { 
    # $(inherited) ensures existing paths are not overwritten.
    # $PODS_ROOT is used for the absolute path to the Pods directory.
    'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/PLCrashReporter/Dependencies"'
  }
  
  spec.resource_bundles = {
    'PLCrashReporter' => 'Source/Resources/**'
  }

  spec.ios.deployment_target    = '13.0'
  spec.osx.deployment_target    = '11.5'
  spec.tvos.deployment_target   = '12.0'
end
