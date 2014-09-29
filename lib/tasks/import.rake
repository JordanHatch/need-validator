require 'importers/needs_importer'

desc "Import needs from a csv"
task :import, [:file] => :environment do |t, args|
  NeedsImporter.new(args[:file]).run
end
