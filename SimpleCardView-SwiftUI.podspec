#
# Be sure to run `pod lib lint SimpleCardView-SwiftUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleCardView-SwiftUI'
  s.version          = '0.0.4'
  s.summary          = 'SimpleCardView-SwiftUI is a very simple card view written with SwiftUI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  `SimpleCardView-SwiftUI` is a very simple card view written with SwiftUI.
  You can easily create a card view with linear gradient at the background and customize the content of the card with SwiftUI.
  You can also use SwiftUI to create a detail view for the card.
                       DESC

  s.homepage         = 'https://github.com/Tomortec/SimpleCardView-SwiftUI'
  s.screenshots      = './screenshot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tomortec' => 'everything@tomortec.com' }
  s.source           = { :git => 'https://github.com/Tomortec/SimpleCardView-SwiftUI.git', :tag => s.version.to_s }

  s.swift_version = '5.6'
  s.ios.deployment_target = '15.0'

  s.source_files = 'SimpleCardView-SwiftUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SimpleCardView-SwiftUI' => ['SimpleCardView-SwiftUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'SwiftUI'
end
