#
# Be sure to run `pod lib lint RoundedUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RoundedUI'
  s.version          = '1.0.0'
  s.summary          = 'Configure rounded corners UI components on your Interface Builder.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Hien Pham/RoundedUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'APACHE', :file => 'LICENSE' }
  s.author           = { 'Hien Pham' => 'hienpham@bravesoft.com.vn' }
  s.source           = { :git => 'https://bsvframeworks@bitbucket.org/bravesoftvietnam/roundedui.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RoundedUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RoundedUI' => ['RoundedUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
