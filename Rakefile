# frozen_string_literal: true

# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

require "yast/rake"
require "packaging"

Dir.glob("src/lib/tasks/*.rake").each { |r| import r }

Yast::Tasks.configuration do |_conf|
end

Packaging.configuration do |conf|
  conf.obs_project = "home:dbenjamin:yast2-hello-world"
  conf.package_name = "yast2-hello-world"
  conf.obs_target = "SUSE_SLE-15_GA"
end
