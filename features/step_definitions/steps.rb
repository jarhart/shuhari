# This step was copied verbatim from the aruba master branch but it's not yet
# in the released gem as of version 0.4.11
Then /^the file "([^"]*)" should contain:$/ do |file, partial_content|
  check_file_content(file, partial_content, true)
end
