Pod::Spec.new do |s|
  s.name         = "UCPlanKit"
  s.version      = "1.0"
  s.summary      = "组件化核心组件"
  s.homepage     = "https://github.com/RPGLiker/UCPlanKit"
  s.license      = "MIT"
  s.author       = { "RPGLiker" => "fanyang_32012@outlook.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/RPGLiker/UCPlanKit.git", :tag => "#{s.version}" }
  s.source_files  = "UCPlanKit/UCPlanKit/**/*.{h,m}"
  s.requires_arc = true
  s.dependency 'YYKit'

end