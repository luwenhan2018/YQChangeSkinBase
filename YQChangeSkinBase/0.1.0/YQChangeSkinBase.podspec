#
# Be sure to run `pod lib lint YQChangeSkinBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YQChangeSkinBase'
  s.version          = '0.1.0'
  s.summary          = 'A skin switching solution.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/luwenhan2018/YQChangeSkinBase'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luwenhan2018' => '2390775839@qq.com' }
  s.source           = { :git => 'https://github.com/luwenhan2018/YQChangeSkinBase.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YQChangeSkinBase/Classes/YQTheme.h'
  s.public_header_files = 'YQChangeSkinBase/Classes/YQTheme.h'
  
  s.subspec 'Core' do |ss|
    ss.source_files = 'YQChangeSkinBase/Classes/Core/*.{m,h}'
    ss.public_header_files = 'YQChangeSkinBase/Classes/Core/*.h'
  end
  s.subspec 'UIKit' do |ss|
    ss.source_files = 'YQChangeSkinBase/Classes/UIKit/*.{m,h}'
    ss.public_header_files = 'YQChangeSkinBase/Classes/UIKit/*.h'
    ss.dependency 'YQChangeSkinBase/Core'
  end

  
  # s.resource_bundles = {
  #   'YQChangeSkinBase' => ['YQChangeSkinBase/Assets/*.png']
  # }


  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
