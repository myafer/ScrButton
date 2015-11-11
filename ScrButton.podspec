
Pod::Spec.new do |s|

  s.name         = "ScrButton"
  s.platform = :ios
  s.ios.deployment_target = '7.0'
  s.version      = "0.0.2"
  s.summary      = "ScrButton"
  s.description  = <<-DESC
                  wwwwwwwww
                   DESC
  s.homepage     = "https://github.com/myafer"
  s.license      = { :type => "MIT", :file => "license" }
  s.author             = { "ScrButton" => "" }
  s.source       = { :git => "https://github.com/myafer/ScrButton.git", :tag => "0.0.2" }
  s.source_files  = "ScrButton", "ScrButton/ScrButton/**/*"
end
