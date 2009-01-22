# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ey_salesforce_slice}
  s.version = "0.6.22"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["atmos halorgium"]
  s.date = %q{2009-01-09}
  s.description = %q{Merb slice for accessing salesforce in a consistent way}
  s.email = %q{ninja@engineyard.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/ey_salesforce_slice", "lib/ey_salesforce_slice/version.rb", "lib/ey_salesforce_slice.rb", "spec/slice_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "config/dependencies.rb", "config/init.rb", "config/router.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/engineyard/ey_salesforce_slice}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Merb slice for accessing salesforce in a consistent way}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 1.1.11"])
      s.add_runtime_dependency(%q<rake>, [">= 0.8.3"])
      s.add_runtime_dependency(%q<rcov>, [">= 0.8.1.2.0"])
      s.add_runtime_dependency(%q<extlib>, [">= 0.9.8"])
      s.add_runtime_dependency(%q<merb-core>, [">= 1.0"])
      s.add_runtime_dependency(%q<merb-slices>, [">= 1.0"])
      s.add_runtime_dependency(%q<dm-core>, [">= 0.9.8"])
      s.add_runtime_dependency(%q<dm-validations>, [">= 0.9.8"])
      s.add_runtime_dependency(%q<dm-salesforce>, [">= 0.9.7.8"])
      s.add_runtime_dependency(%q<ey_salesforce_models>, [">= 0.0.20"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.0.6"])
      s.add_runtime_dependency(%q<webrat>, [">= 0.3.2"])
    else
      s.add_dependency(%q<rspec>, [">= 1.1.11"])
      s.add_dependency(%q<rake>, [">= 0.8.3"])
      s.add_dependency(%q<rcov>, [">= 0.8.1.2.0"])
      s.add_dependency(%q<extlib>, [">= 0.9.8"])
      s.add_dependency(%q<merb-core>, [">= 1.0"])
      s.add_dependency(%q<merb-slices>, [">= 1.0"])
      s.add_dependency(%q<dm-core>, [">= 0.9.8"])
      s.add_dependency(%q<dm-validations>, [">= 0.9.8"])
      s.add_dependency(%q<dm-salesforce>, [">= 0.9.7.8"])
      s.add_dependency(%q<ey_salesforce_models>, [">= 0.0.20"])
      s.add_dependency(%q<nokogiri>, [">= 1.0.6"])
      s.add_dependency(%q<webrat>, [">= 0.3.2"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.1.11"])
    s.add_dependency(%q<rake>, [">= 0.8.3"])
    s.add_dependency(%q<rcov>, [">= 0.8.1.2.0"])
    s.add_dependency(%q<extlib>, [">= 0.9.8"])
    s.add_dependency(%q<merb-core>, [">= 1.0"])
    s.add_dependency(%q<merb-slices>, [">= 1.0"])
    s.add_dependency(%q<dm-core>, [">= 0.9.8"])
    s.add_dependency(%q<dm-validations>, [">= 0.9.8"])
    s.add_dependency(%q<dm-salesforce>, [">= 0.9.7.8"])
    s.add_dependency(%q<ey_salesforce_models>, [">= 0.0.20"])
    s.add_dependency(%q<nokogiri>, [">= 1.0.6"])
    s.add_dependency(%q<webrat>, [">= 0.3.2"])
  end
end
