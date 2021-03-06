Pod::Spec.new do |spec|
  spec.name         = 'TRZNetworking'
  spec.version      = '1.0.0'
  spec.authors      = { 
    'Borja Sáez de Guinoa Vilaplana' => 'Borja.saezdeguinoa@gmail.com',
  }
  spec.license      = { 
    :type => 'MIT',
    :file => 'LICENSE' 
  }
  spec.homepage     = 'https://github.com/zaehk/TRZNetworking'
  spec.source       = { 
    :git => 'https://github.com/zaehk/TRZNetworking.git', 
    :branch => 'main',
    :tag => 'v1.0.0'
  }
  spec.summary      = 'Straightforward api rest framework'
  spec.source_files = '**/*.swift', '*.swift'
  spec.swift_versions = '5.0'
  spec.ios.deployment_target = '14.5'
end