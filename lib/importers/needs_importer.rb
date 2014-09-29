require 'csv'

class NeedsImporter

  def initialize(path_to_csv)
    @file_path = Rails.root.join(path_to_csv)
  end

  def run
    CSV.foreach(file_path, headers: true) do |row|
      create_need_for_row(row)
    end
  end

private

  attr_reader :file_path

  def create_need_for_row(row)
    need = Need.create(fields_from_row(row))
    puts "Created #{need.need_api_id}"
  end

  def fields_from_row(row)
    row.to_hash.symbolize_keys
       .slice(:role, :goal, :benefit, :organisation_ids, :justifications, :impact, :met_when)
       .merge(need_api_id: row['id'])
  end

end
