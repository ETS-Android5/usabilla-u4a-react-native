require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "9.0"

  s.swift_version = "4.0"
  s.source       = { :git => "https://github.com/usabilla/usabilla-u4a-react-native.git", :tag => "v#{s.version}" }
  s.source_files = "ios/**/*.{h,m,swift}"

  s.dependency 'React'
  s.dependency 'Usabilla', '~> 6.5'
  
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
