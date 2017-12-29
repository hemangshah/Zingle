Pod::Spec.new do |s|
s.name             = 'Zingle'
s.module_name      = 'Zingle'
s.version          = '1.0.0'
s.summary          = 'Zingle – An alert will display underneath your UINavigationBar 🎅'
s.description      = 'Want to show an alert under the UINavigationBar for various cases like No Internet? If yes, use Zingle.'
s.homepage         = 'https://github.com/hemangshah/Zingle'
s.license          = 'MIT'
s.author           = { 'hemangshah' => 'hemangshah.in@gmail.com' }
s.source           = { :git => 'https://github.com/hemangshah/Zingle.git', :tag => s.version.to_s }
s.platform     = :ios, '9.0'
s.requires_arc = true
s.source_files = 'Zingle/Zingle/Source/*.swift'
end
