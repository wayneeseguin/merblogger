# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{do_mysql}
  s.version = "0.9.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dirkjan Bussink"]
  s.date = %q{2009-01-18}
  s.description = %q{A DataObject.rb driver for MySQL}
  s.email = ["d.bussink@gmail.com"]
  s.extensions = ["ext/do_mysql_ext/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".gitignore", "History.txt", "LICENSE", "Manifest.txt", "README.txt", "Rakefile", "buildfile", "ext-java/src/main/java/DoMysqlExtService.java", "ext-java/src/main/java/do_mysql/MySqlDriverDefinition.java", "ext/.gitignore", "ext/do_mysql_ext/do_mysql_ext.c", "ext/do_mysql_ext/extconf.rb", "lib/do_mysql.rb", "lib/do_mysql/transaction.rb", "lib/do_mysql/version.rb", "spec/integration/do_mysql_spec.rb", "spec/integration/logging_spec.rb", "spec/integration/quoting_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/unit/transaction_spec.rb"]
  s.homepage = %q{http://rubyforge.org/projects/dorb}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{dorb}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{A DataObject.rb driver for MySQL}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<data_objects>, ["= 0.9.11"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<data_objects>, ["= 0.9.11"])
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<data_objects>, ["= 0.9.11"])
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end
