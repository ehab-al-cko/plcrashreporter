Pod::Spec.new do |spec|
  spec.name             = 'PLCrashReporter'
  spec.version          = '1.12.0'
  spec.summary          = 'Reliable, open-source crash reporting for iOS, macOS and tvOS.'
  # ... (other metadata) ...

  spec.source           = { :git => 'https://github.com/microsoft/plcrashreporter.git', :tag => spec.version }
  
  # Includes core files and the protobuf-c source/header files
  spec.source_files     = 'Source/**/*.{h,m}', 'Dependencies/protobuf-c/**/*.{h,c}'
  
  # 1. FIX: Explicitly define the protobuf-c headers as public
  # This makes them available for angle bracket imports.
  spec.public_header_files = 'Dependencies/protobuf-c/protobuf-c.h' 
  
  # 2. FIX: Preserve the folder structure starting from the 'Dependencies' folder
  # This makes the compiler look for the header at <protobuf-c/protobuf-c.h>
  spec.header_mappings_dir = 'Dependencies' 

  # We are removing the old spec.pod_target_xcconfig line, as the public headers 
  # configuration should take care of the search paths automatically.
  
  spec.resource_bundles = {
    'PLCrashReporter' => 'Source/Resources/**'
  }

  spec.ios.deployment_target    = '13.0'
  spec.osx.deployment_target    = '11.5'
  spec.tvos.deployment_target   = '12.0'
end
