# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ey_salesforce_models}
  s.version = "0.0.22"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["halorgium", "atmos"]
  s.date = %q{2009-01-11}
  s.default_executable = %q{ey_salesforce_shell}
  s.description = %q{The models for dealing with salesforce}
  s.email = %q{ninja@engineyard.com}
  s.executables = ["ey_salesforce_shell"]
  s.extra_rdoc_files = ["README"]
  s.files = ["README", "Rakefile", "lib/ey_salesforce_models.rb", "lib/ey_salesforce_models", "lib/ey_salesforce_models/version.rb", "lib/models", "lib/models/account.rb", "lib/models/contact.rb", "lib/models/contact_role.rb", "lib/models/note.rb", "lib/models/opportunity.rb", "lib/models/user.rb", "lib/models/monitor.rb", "config/dependencies.rb", "config/rubundler.rb", "config/wsdls", "config/wsdls/production-2009010901.wsdl", "config/wsdls/sandbox-eysandbox1-2009010901.wsdl", "config/wsdls/sandbox-tcareysmit-2009010901.wsdl", "spec/models", "spec/models/account_spec.rb", "spec/models/contact_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "bin/ey_salesforce_shell"]
  s.has_rdoc = true
  s.homepage = %q{https://github.com/engineyard/ey_salesforce_models}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ey_salesforce_models}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{The models for dealing with salesforce}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 1.1.11"])
      s.add_runtime_dependency(%q<rake>, [">= 0.8.3"])
      s.add_runtime_dependency(%q<rcov>, [">= 0.8.1.2.0"])
      s.add_runtime_dependency(%q<hoe>, [">= 1.8.2"])
      s.add_runtime_dependency(%q<extlib>, [">= 0.9.8"])
      s.add_runtime_dependency(%q<dm-core>, [">= 0.9.7"])
      s.add_runtime_dependency(%q<dm-salesforce>, ["= 0.9.7.8"])
      s.add_runtime_dependency(%q<dm-validations>, [">= 0.9.7"])
    else
      s.add_dependency(%q<rspec>, [">= 1.1.11"])
      s.add_dependency(%q<rake>, [">= 0.8.3"])
      s.add_dependency(%q<rcov>, [">= 0.8.1.2.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
      s.add_dependency(%q<extlib>, [">= 0.9.8"])
      s.add_dependency(%q<dm-core>, [">= 0.9.7"])
      s.add_dependency(%q<dm-salesforce>, ["= 0.9.7.8"])
      s.add_dependency(%q<dm-validations>, [">= 0.9.7"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.1.11"])
    s.add_dependency(%q<rake>, [">= 0.8.3"])
    s.add_dependency(%q<rcov>, [">= 0.8.1.2.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
    s.add_dependency(%q<extlib>, [">= 0.9.8"])
    s.add_dependency(%q<dm-core>, [">= 0.9.7"])
    s.add_dependency(%q<dm-salesforce>, ["= 0.9.7.8"])
    s.add_dependency(%q<dm-validations>, [">= 0.9.7"])
  end
end
