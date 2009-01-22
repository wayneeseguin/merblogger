# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{BlueCloth}
  s.version = "1.0.0"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.autorequire = %q{bluecloth}
  s.bindir = nil
  s.cert_chain = nil
  s.date = %q{2004-08-31}
  s.email = %q{ged@FaerieMUD.org}
  s.files = ["./utils.rb", "./tests/bctestcase.rb", "./tests/00_Class.tests.rb", "./tests/05_Markdown.tests.rb", "./tests/10_Bug.tests.rb", "./tests/15_Contrib.tests.rb", "./tests/data/antsugar.txt", "./tests/data/ml-announce.txt", "./tests/data/re-overflow.txt", "./tests/data/re-overflow2.txt", "./test.rb", "./README", "./CHANGES", "./LICENSE", "./lib/bluecloth.rb", "./install.rb", "bin/bluecloth"]
  s.has_rdoc = nil
  s.homepage = %q{http://bluecloth.rubyforge.org/}
  s.require_paths = ["lib"]
  s.required_ruby_version = nil
  s.requirements = ["strscan", "logger"]
  s.rubyforge_project = %q{bluecloth}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{BlueCloth is a Ruby implementation of Markdown, a text-to-HTML conversion tool for web writers. Markdown allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid XHTML (or HTML).}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = -1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
