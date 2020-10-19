Pod::Spec.new do |s|
  s.name         = 'InsetLabel'
  s.version      = '4.0.1'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/InsetLabel'
  s.source       = { :git => 'https://github.com/GyazSquare/InsetLabel.git', :tag => 'v4.0.1' }
  s.summary      = 'A UILabel subclass supporting content insets written in Swift.'
  s.swift_versions = ['4.2', '5.0', '5.1', '5.2', '5.3']
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true
  s.source_files = 'InsetLabel/*.{swift}'
end
