Pod::Spec.new do |s|
  s.name         = 'InsetLabel'
  s.version      = '1.0.0'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/InsetLabel'
  s.source       = { :git => 'https://github.com/GyazSquare/InsetLabel.git', :tag => 'v1.0.0' }
  s.summary      = 'A UILabel subclass supporting content insets written in Swift.'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc  = true
  s.module_name   = 'GSL'
  s.source_files  = 'InsetLabel/*.{swift}'
end
