# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{plist}
  s.version = "3.0.0"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Bleything and Patrick May"]
  s.autorequire = %q{plist}
  s.cert_chain = nil
  s.date = %q{2006-09-20}
  s.description = %q{Plist is a library to manipulate Property List files, also known as plists.  It can parse plist files into native Ruby data structures as well as generating new plist files from your Ruby objects.}
  s.files = ["Rakefile", "README", "MIT-LICENSE", "docs/USAGE", "lib/plist", "lib/plist.rb", "lib/plist/generator.rb", "lib/plist/parser.rb", "test/test_data_elements.rb", "test/test_generator.rb", "test/test_generator_basic_types.rb", "test/test_generator_collections.rb", "test/test_parser.rb", "test/assets/AlbumData.xml", "test/assets/commented.plist", "test/assets/Cookies.plist", "test/assets/example_data.bin", "test/assets/example_data.jpg", "test/assets/example_data.plist", "test/assets/test_data_elements.plist", "test/assets/test_empty_key.plist"]
  s.has_rdoc = true
  s.homepage = %q{http://plist.rubyforge.org}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{plist}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{All-purpose Property List manipulation library.}
  s.test_files = ["test/test_data_elements.rb", "test/test_generator.rb", "test/test_generator_basic_types.rb", "test/test_generator_collections.rb", "test/test_parser.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
