Pod::Spec.new do |spec|
  spec.name         = "DeeplinkBlueprints"
  spec.version      = "0.0.1"
  spec.summary      = "DeeplinkBlueprints is a multiplatform tool for dynamic deeplinks handling."
  spec.description = <<-DESC
  DeeplinkBlueprints is a multiplatform tool for deeplinks handling. It allows to define and register blueprints that acts as pattern for deeplink matching.
  DESC
  spec.homepage     = "https://github.com/lewandowskit93/DeeplinkBlueprints"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author       = { "Tomasz Lewandowski" => "tomasz.t.lewandowski@gmail.com" }
  spec.source       = { :git => "https://github.com/lewandowskit93/DeeplinkBlueprints.git", :tag => "#{spec.version}" }
  spec.source_files  = "DeeplinkBlueprints/**/*.swift"
  spec.swift_versions = "5.2"
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.tvos.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
end