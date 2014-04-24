#
#  Be sure to run `pod spec lint DMFoundation.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name = "DMFoundation"
  spec.version = "0.0.1"
  spec.summary = "A collection of utilities and enhancements to the iOS runtime environment."
  spec.description = <<-DESC
    A collection of category-based enhancements to the iOS Foundation classes to include 
    iterators, formatters, digests, encoders, etc.
  DESC
  spec.homepage = "http://github.com/devmode/dm-foundation"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license = "MIT (example)"


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.authors = { 
    "Sean M. Duncan" => "sean@devmode.com",
    "John E. Bailey" => "john@devmode.com"
  }
  spec.social_media_url = "http://twitter.com/DevModeInc"


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform = :ios, 6.0


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source = { :git => "http://github.com/devmode/dm-foundation.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # None


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # None


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.requires_arc = true

end
