# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/(.+)_spec\.rb$})
  watch(%r{^spec/models/(.+)_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^lib/minesweeper/(.+)\.rb$})     { |m| "spec/models/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
end
