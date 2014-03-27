# Put this is PROJECT_ROOT/deploy/solo.rb
# Documentation for this file can be found here: http://docs.opscode.com/config_rb_solo.html

require 'dnapi' # this is a special Engine Yard library that can read the dna.json file into something useful

base_dir = File.expand_path(File.join(File.dirname(__FILE__), '..')) # project root


file_cache_path   File.join(base_dir, 'tmp', 'cache') # it's possible that this dir doesn't exist? if so, either another dir will work or you could create it.
cookbook_path     File.join(base_dir, 'cookbooks') # put your cookbooks dir in the root of the project, if possible. Another location can be used as well if this causes problems.
node_name         DNApi.from(File.read("/etc/chef/dna.json")).id

{
  "name":"my_node",
  "run_list": [
    "recipe[zendserver::single]"
  ]
}
