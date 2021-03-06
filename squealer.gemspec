# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{squealer}
  s.version = "2.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Graham", "Durran Jordan", "Matt Yoho", "Bernerd Schaefer"]
  s.date = %q{2010-06-29}
  s.default_executable = %q{skewer}
  s.description = %q{A Ruby DSL for exporting MongoDB to MySQL or PostgreSQL. You don't need to install both, just one. Use EXPORT_DBMS=[mysql|postgres] environment variable to specify the appropriate adapter.}
  s.email = %q{joshua.graham@grahamis.com}
  s.executables = ["skewer"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     ".rvmrc",
     ".watchr",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "bin/skewer",
     "lib/example_squeal.rb",
     "lib/squealer.rb",
     "lib/squealer/database.rb",
     "lib/squealer/hash.rb",
     "lib/squealer/object.rb",
     "lib/squealer/progress_bar.rb",
     "lib/squealer/target.rb",
     "lib/tasks/jeweler.rake",
     "spec/integration/export_a_record_spec.rb",
     "spec/integration/imports_from_mongodb.rb",
     "spec/integration/spec_helper_dbms.rb",
     "spec/integration/spec_helper_dbms_mysql.rb",
     "spec/integration/spec_helper_dbms_postgres.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/squealer/database_spec.rb",
     "spec/squealer/hash_spec.rb",
     "spec/squealer/object_spec.rb",
     "spec/squealer/progress_bar_spec.rb",
     "spec/squealer/target_spec.rb",
     "squealer.gemspec"
  ]
  s.homepage = %q{http://github.com/delitescere/squealer/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Export document-oriented database to RDBMS}
  s.test_files = [
    "spec/integration/export_a_record_spec.rb",
     "spec/integration/imports_from_mongodb.rb",
     "spec/integration/spec_helper_dbms.rb",
     "spec/integration/spec_helper_dbms_mysql.rb",
     "spec/integration/spec_helper_dbms_postgres.rb",
     "spec/spec_helper.rb",
     "spec/squealer/database_spec.rb",
     "spec/squealer/hash_spec.rb",
     "spec/squealer/object_spec.rb",
     "spec/squealer/progress_bar_spec.rb",
     "spec/squealer/target_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongo>, [">= 0.18.3"])
      s.add_runtime_dependency(%q<bson_ext>, [">= 1.0.1"])
      s.add_runtime_dependency(%q<data_objects>, [">= 0.10.2"])
      s.add_runtime_dependency(%q<do_mysql>, [">= 0.10.2"])
      s.add_runtime_dependency(%q<do_postgres>, [">= 0.10.2"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
    else
      s.add_dependency(%q<mongo>, [">= 0.18.3"])
      s.add_dependency(%q<bson_ext>, [">= 1.0.1"])
      s.add_dependency(%q<data_objects>, [">= 0.10.2"])
      s.add_dependency(%q<do_mysql>, [">= 0.10.2"])
      s.add_dependency(%q<do_postgres>, [">= 0.10.2"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<mongo>, [">= 0.18.3"])
    s.add_dependency(%q<bson_ext>, [">= 1.0.1"])
    s.add_dependency(%q<data_objects>, [">= 0.10.2"])
    s.add_dependency(%q<do_mysql>, [">= 0.10.2"])
    s.add_dependency(%q<do_postgres>, [">= 0.10.2"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
  end
end

