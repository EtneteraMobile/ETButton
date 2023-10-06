Pod::Spec.new do |s|
  s.name         = "ETButton"
  s.version      = "1.1"
  s.summary      = ""
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jiri Zoudun" => "jiri.zoudun@etnetera.cz" }
  s.social_media_url   = ""
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "4.0"
  s.tvos.deployment_target = "11.0"
  s.source       = { :git => ".git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
