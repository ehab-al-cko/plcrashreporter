Pod::Spec.new do |spec|
  spec.name             = 'PLCrashReporter'
  spec.version          = '1.12.0'
  # ... (other metadata) ...

  spec.source           = { :git => 'https://github.com/microsoft/plcrashreporter.git', :tag => spec.version }
  
  # Includes core files and the protobuf-c source/header files
  spec.source_files     = 'Source/**/*.{h,m}', 'Dependencies/protobuf-c/**/*.{h,c}'
  
  # 1. (Kept): Creates the "protobuf-c/" folder structure for headers
  spec.header_mappings_dir = 'Dependencies' 
  
  # 2. (NEW/REINTRODUCED FIX): Exposes the resulting header path to the compiler 
  # This setting tells the compiler where to look for the headers imported with <...>
  spec.pod_target_xcconfig = { 
    # Expose the Pod's private headers to itself, where 'Dependencies' is the root 
    # and the files are mapped into the build products directory.
    'HEADER_SEARCH_PATHS' => '$(PODS_TARGET_ROOT)/PLCrashReporter'
  }
  
  spec.resource_bundles = {
    'PLCrashReporter' => 'Source/Resources/**'
  }

  spec.ios.deployment_target    = '13.0'
  spec.osx.deployment_target    = '11.5'
  spec.tvos.deployment_target   = '12.0'
end
