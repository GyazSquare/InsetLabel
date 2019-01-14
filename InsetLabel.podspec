Pod::Spec.new do |s|
  s.name         = 'InsetLabel'
  s.version      = '3.0.1'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/InsetLabel'
  s.source       = { :git => 'https://github.com/GyazSquare/InsetLabel.git', :tag => 'v3.0.1' }
  s.summary      = 'A UILabel subclass supporting content insets written in Swift.'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true
  s.source_files = 'InsetLabel/*.{swift}'
end
