#!/usr/bin/env ruby
`gem list --no-versions`.split("\n").each do |gem|
  `gem list -d #{gem}`.gsub(/Installed at(.*):.*/).each do |dir|
    dir = dir.gsub(/Installed at(.*): /,'').gsub("\n", '')
    system "gem uninstall #{gem} -aIx -i #{dir}"
  end
end
