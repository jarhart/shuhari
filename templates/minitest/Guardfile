guard 'minitest' do
  # with Minitest::Unit
  watch(%r|^test/test_(.*)\.rb|)
  watch(%r|^lib/(.*)\.rb|)            { |m| "test/test_#{m[1]}.rb" }
  watch(%r|^test/test_helper\.rb|)    { "test" }

  # with Minitest::Spec
  # watch(%r|^spec/(.*)_spec\.rb|)
  # watch(%r|^lib/(.*)\.rb|)            { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r|^spec/spec_helper\.rb|)    { "spec" }
end
