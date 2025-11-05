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
  
  # Includes core files, plus all C source/header files from the protobuf-c dependency
  spec.source_files     = 'Source/**/*.{h,m}', 'Dependencies'
  
  # **THE FIX:** This tells CocoaPods to treat the 'Dependencies' folder as the root for header mapping.
  # This makes the compiler look for headers at: (PODS_ROOT)/PLCrashReporter/Dependencies/protobuf-c/protobuf-c.h
  # ... which satisfies the #include "protobuf-c/protobuf-c.h" statement.
  spec.header_mappings_dir = 'Dependencies/protobuf-c' 
  
  spec.resource_bundles = {
    'PLCrashReporter' => 'Source/Resources/**'
  }

  spec.ios.deployment_target    = '13.0'
  spec.osx.deployment_target    = '11.5'
  spec.tvos.deployment_target   = '12.0'
end
