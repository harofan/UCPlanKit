Pod::Spec.new do |s|
  s.name         = "UCPlanKit"
  s.version      = "1.1"
  s.summary      = "组件化核心组件"
  s.homepage     = "https://github.com/RPGLiker/UCPlanKit"
  s.license      = "MIT"
  s.author       = { "RPGLiker" => "fanyang_32012@outlook.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/RPGLiker/UCPlanKit.git", :tag => "#{s.version}" , :submodules => true}
  s.requires_arc = true
  s.dependency 'YYKit'
  s.source_files  = "UCPlanKit/UCPlanKit/UCPlanKit.h"

  s.subspec "Category" do |ss|
    # ss.source_files = "UCPlanKit/UCPlanKit/Category/UIWebView+UCPlanKitExtra.{h,m}", "UCPlanKit/UCPlanKit/Category/UILabel+UCPlanKitExtra.{h.m}", "UCPlanKit/UCPlanKit/Category/UIColor+UCPlanKitExtra.{h.m}", "UCPlanKit/UCPlanKit/Category/UIImage+UCPlanKitExtra.{h.m}", "UCPlanKit/UCPlanKit/Category/UIFont+UCPlanKitExtra.{h.m}", "UCPlanKit/UCPlanKit/Category/UIView+UCPlanKitExtra.{h.m}", ""
    ss.source_files = "UCPlanKit/UCPlanKit/Category/**/*.{h,m}"
  end

  s.subspec "SomeObj" do |ss|
    ss.source_files = "UCPlanKit/UCPlanKit/SomeObj/**/*.{h,m}"
    end

  s.subspec "Protocol" do |ss|
    ss.source_files = "UCPlanKit/UCPlanKit/Protocol/**/*.{h,m}"
    # ss.dependency "UCPlanKit/SomeObj"
    end

  s.subspec "Macro" do |ss|
    ss.source_files = "UCPlanKit/UCPlanKit/Macro/**/*.{h,m}"
    end
  s.subspec "Resource" do |ss|
    ss.source_files = "UCPlanKit/UCPlanKit/Resource/**/*.{h,m}"
    end

  s.subspec "Mediator" do |ss|
    ss.source_files = "UCPlanKit/UCPlanKit/Mediator/**/*.{h,m}"
    # ss.dependency "UCPlanKit/SomeObj"
    end

end