guard 'cucumber', :cli => '--color --format progress --strict' do
  watch(%r{^lib/.+\.rb$})                             { 'features' }
  watch(%r{^templates/.+$})                           { 'features' }
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/(support|step_definitions)/.+$}) { 'features' }
end
