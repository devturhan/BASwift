Pod::Spec.new do |s|
  s.name             = 'BASwift'
  s.version          = '0.0.1'
  s.summary          = 'BA Development Team Swift Framework'
 

#   s.description      = <<-DESC
# This fantastic view changes its color gradually makes your app look fantastic!
#                        DESC
 
  s.homepage         = 'https://bitbucket.org/baswiftteam/baswift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Burak AKKAYA' => 'brk.akkaya@gmail.com' }
  s.source           = { :git => 'https://bitbucket.org/baswiftteam/baswift', :tag => s.version.to_s }
 
 `echo "4.0" > .swift-version`

  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  
  s.source_files = 'BASwift/Core/**/*.swift', 'BASwift/Core/**/**/*.swift', 'BASwift/Core/**/**/**/*.swift', 'BASwift/UI/**/*.swift', 'BASwift/UI/**/**/*.swift'

  s.dependency 'Swinject', '~> 2.1.0'
  s.dependency 'ReactiveCocoa', '7.0.0-alpha.2'
  s.dependency 'NVActivityIndicatorView'
  s.dependency 'SwiftyJSON', '~> 3.1'
  s.dependency 'Alamofire', '~> 4.4'
  s.dependency 'SDWebImage', '~> 4.0'
end