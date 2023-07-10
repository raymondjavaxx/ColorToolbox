Pod::Spec.new do |spec|
  spec.name         = "ColorToolbox"
  spec.version      = "1.0.0"
  spec.summary      = "Swift color utilities for UIKit, AppKit and SwiftUI."

  spec.homepage     = "https://github.com/raymondjavaxx/ColorToolbox"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ramon Torres" => "raymondjavaxx@gmail.com" }

  spec.swift_version = "5.7"
  spec.ios.deployment_target = "14.0"
  spec.tvos.deployment_target = "14.0"
  spec.osx.deployment_target = "11.0"
  spec.watchos.deployment_target = "7.0"

  spec.source       = { :git => "https://github.com/raymondjavaxx/ColorToolbox.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/ColorToolbox/**/*.swift"
end
