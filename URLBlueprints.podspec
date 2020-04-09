Pod::Spec.new do |spec|
  spec.name         = "URLBlueprints"
  spec.version      = "0.0.1"
  spec.summary      = "URLBlueprints is a multiplatform tool for dynamic deeplinks handling & routing."
  spec.description = <<-DESC
  URLBlueprints is a multiplatform tool for deeplinks handling & routing. It allows to define and register blueprints that acts as pattern for deeplink matching.
  DESC
  spec.homepage     = "https://github.com/lewandowskit93/URLBlueprints"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author       = { "Tomasz Lewandowski" => "tomasz.t.lewandowski@gmail.com" }
  spec.source       = { :git => "https://github.com/lewandowskit93/URLBlueprints.git", :tag => "#{spec.version}" }
  spec.source_files  = "URLBlueprints/**/*.swift"
  spec.swift_versions = "5.1"
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.tvos.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
end