
Pod::Spec.new do |s|

    s.name = 'KZ_Database'
    s.version = '0.1.2'
    s.summary = 'iOS & macOS database.'
    s.homepage = 'https://github.com/KieronZhang/KZ_Database'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang' => 'https://github.com/KieronZhang'}

    s.source = {:git => 'https://github.com/KieronZhang/KZ_Database.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.requires_arc = true
    s.library = 'sqlite3'

    s.frameworks = 'Foundation'

    s.ios.deployment_target = '8.0'
    s.osx.deployment_target = '10.10'

    s.ios.vendored_frameworks = 'KZ_Database/KZ_Database_iOS.framework'
    s.osx.vendored_frameworks = 'KZ_Database/KZ_Database_macOS.framework'
    
    s.dependency 'KZ_JSON'

end
