autoload :ChronicDuration, 'chronic_duration'
autoload :Travis, 'travis'
autoload :YAML, 'yaml'

require 'descriptive_statistics'
require 'monkey_patches/dir'
require 'monkey_patches/file'
require 'monkey_patches/float'
require 'monkey_patches/travis'

Travis.access_token = YAML.load_file('config/application.yml')['travis_access_token']

# noinspection RailsParamDefResolve
builds = Travis::Repository.find("#{Travis.user.login}/#{Dir.cwd}").builds.to_a
builds.pop ENV['SINCE_BUILD'].to_i if ENV['SINCE_BUILD']
mean_build_time = builds.select(&:passed?).map(&:duration).mean.format('%.2f').duration

Logger.new($stdout).info(File.script_name) do
  "Mean build duration of passing builds since #{builds.last} is #{mean_build_time}."
end