
Pod::Spec.new do |s|

    s.name = 'KZ_Database'
    s.version = '0.1'
    s.summary = 'iOS database.'
    s.homepage = 'https://github.com/KieronZhang/KZ_Database'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang.' => 'https://github.com/KieronZhang'}
    s.platform = :ios, '8.0'
    s.source = {:git => 'https://github.com/KieronZhang/KZ_Database.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.frameworks = 'Foundation'
    s.vendored_frameworks = 'KZ_Database/KZ_DatabaseFramework.framework'
    s.library = 'sqlite3'
    s.requires_arc = true
    
    s.dependency 'KZ_JSON'

end
