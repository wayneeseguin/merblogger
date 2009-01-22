# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-salesforce}
  s.version = "0.9.7.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yehuda Katz"]
  s.autorequire = %q{dm-salesforce}
  s.date = %q{2009-01-08}
  s.description = %q{A DataMapper adapter to the Salesforce API}
  s.email = %q{wycats@gmail.com}
  s.extra_rdoc_files = ["README.markdown", "LICENSE"]
  s.files = ["LICENSE", "README.markdown", "Rakefile", "config/dependencies.rb", "config/rubundler.rb", "lib/dm-salesforce", "lib/dm-salesforce/adapter.rb", "lib/dm-salesforce/connection.rb", "lib/dm-salesforce/extensions.rb", "lib/dm-salesforce/sql.rb", "lib/dm-salesforce/version.rb", "lib/dm-salesforce.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.yehudakatz.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A DataMapper adapter to the Salesforce API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<hoe>, [">= 0"])
      s.add_runtime_dependency(%q<ruby-debug>, [">= 0"])
      s.add_runtime_dependency(%q<httpclient>, ["= 2.1.2"])
      s.add_runtime_dependency(%q<extlib>, ["~> 0.9.9"])
      s.add_runtime_dependency(%q<dm-core>, ["~> 0.9.8"])
      s.add_runtime_dependency(%q<dm-validations>, ["~> 0.9.8"])
      s.add_runtime_dependency(%q<soap4r>, ["~> 1.5.8"])
      s.add_runtime_dependency(%q<data_objects>, ["~> 0.9.9"])
      s.add_runtime_dependency(%q<do_sqlite3>, ["~> 0.9.9"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<httpclient>, ["= 2.1.2"])
      s.add_dependency(%q<extlib>, ["~> 0.9.9"])
      s.add_dependency(%q<dm-core>, ["~> 0.9.8"])
      s.add_dependency(%q<dm-validations>, ["~> 0.9.8"])
      s.add_dependency(%q<soap4r>, ["~> 1.5.8"])
      s.add_dependency(%q<data_objects>, ["~> 0.9.9"])
      s.add_dependency(%q<do_sqlite3>, ["~> 0.9.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<httpclient>, ["= 2.1.2"])
    s.add_dependency(%q<extlib>, ["~> 0.9.9"])
    s.add_dependency(%q<dm-core>, ["~> 0.9.8"])
    s.add_dependency(%q<dm-validations>, ["~> 0.9.8"])
    s.add_dependency(%q<soap4r>, ["~> 1.5.8"])
    s.add_dependency(%q<data_objects>, ["~> 0.9.9"])
    s.add_dependency(%q<do_sqlite3>, ["~> 0.9.9"])
  end
end
