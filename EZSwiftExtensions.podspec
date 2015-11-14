Pod::Spec.new do |s|
s.name             = "EZSwiftExtensions"
s.version          = "0.2"
s.summary          = ":smirk: How Swift standard types and classes were supposed to work"
s.description      = ":smirk: How Swift standard types and classes were supposed to work."
s.homepage         = "https://github.com/goktugyil/EZSwiftExtensions"
s.license          = 'MIT'
s.author           = { "goktugyil" => "gok-2@hotmail.com" }
s.source           = { :git => "https://github.com/goktugyil/EZSwiftExtensions.git", :tag => s.version.to_s }
s.platform     = :ios, '8.0'
s.requires_arc = true

# If more than one source file: https://guides.cocoapods.org/syntax/podspec.html#source_files
s.source_files = 'Sources/*.swift' 

end