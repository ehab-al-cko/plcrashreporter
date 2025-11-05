Pod::Spec.new do |spec|
  spec.name             = 'PLCrashReporter'
  spec.version          = '1.12.0'
  spec.summary          = 'Reliable, open-source crash reporting for iOS, macOS and tvOS.'
  # ... (other metadata) ...

  spec.source           = { :git => 'https://github.com/microsoft/plcrashreporter.git', :tag => spec.version }
  
  spec.source_files     = 'Source/**/*.{h,m}', 'Dependencies/protobuf-c/**/*.{h,c}'
  
  # 1. Designate the header as public
  spec.public_header_files = 'Dependencies/protobuf-c/protobuf-c.h' 
  
  # 2. Preserve the folder structure
  spec.header_mappings_dir = 'Dependencies' 
  
  # 3. FIX: Explicitly and aggressively set the search path for angle bracket imports
  # This path points to where public headers are typically placed, relative to the target root.
  spec.pod_target_xcconfig = { 
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_ROOT)/PLCrashReporter/Dependencies" '
  }
  
  spec.resource_bundles = {
    'PLCrashReporter' => 'Source/Resources/**'
  }

  spec.ios.deployment_target    = '13.0'
  spec.osx.deployment_target    = '11.5'
  spec.tvos.deployment_target   = '12.0'
end
