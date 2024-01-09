Pod::Spec.new do |s|
  s.name             = 'NotificationModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BottomSheet.'
  s.dependency 'SnapKit', '~> 5.0.0'
  s.dependency 'CommonUI'
  s.dependency 'BottomSheet'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/naariman/NotificationModule'
  s.author           = { 'Nariman' => 'pticafugu@gmail.com' }
  s.source           = { :git => 'https://github.com/pticafugu/NotificationModule', :tag => s.version.to_s }
  s.ios.deployment_target = '16.0'

  s.source_files = ['NotificationModule/Classes/**/*.{h,m,swift,json,csv,strings,xib,storyboard, xcassets, xcdatamodeld}']
  
  s.resource_bundles = {
      'CommonUI' => ['NotificationModule/**/*.{xcdatamodeld,csv}']
  }

  s.public_header_files = 'Pod/Classes/**/*.{h,swift}'  
  
end