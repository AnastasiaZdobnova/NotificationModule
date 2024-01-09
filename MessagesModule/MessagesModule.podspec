Pod::Spec.new do |s|
  s.name             = 'MessagesModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MessagesModule.'
  s.dependency 'SnapKit', '~> 5.0.0'
  s.dependency 'CommonUI'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/anastasia/MessagesModule'
  s.author           = { 'Anastasia' => 'anastasia.zdobnova.28@gmail.com' }
  s.source           = { :git => 'https://github.com/anastasia/MessagesModule', :tag => s.version.to_s }
  s.ios.deployment_target = '16.0'

  s.source_files = ['MessagesModule/Classes/**/*.{h,m,swift,json,csv,strings,xib,storyboard, xcassets, xcdatamodeld}']
  
  s.resource_bundles = {
      'MessagesModule' => ['MessagesModule/**/*.{xcdatamodeld,csv}']
  }

  s.public_header_files = 'Pod/Classes/**/*.{h,swift}'  
  
end
