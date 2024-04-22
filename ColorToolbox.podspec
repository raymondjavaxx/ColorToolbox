Pod::Spec.new do |spec|
  spec.name         = "ColorToolbox"
  spec.version      = "1.1.0"
  spec.summary      = "Swift color utilities for UIKit, AppKit and SwiftUI."

  spec.homepage     = "https://github.com/raymondjavaxx/ColorToolbox"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ramon Torres" => "raymondjavaxx@gmail.com" }

  spec.swift_version = "5.9"
  spec.ios.deployment_target = "13.0"
  spec.tvos.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"
  spec.watchos.deployment_target = "6.0"
  spec.visionos.deployment_target = "1.0"

  spec.source       = { :git => "https://github.com/raymondjavaxx/ColorToolbox.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/ColorToolbox/**/*.swift"
end
