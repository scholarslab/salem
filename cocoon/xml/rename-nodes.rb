#! /usr/bin/env ruby

require 'nokogiri'
require 'awesome_print'
require 'csv'


def open_file(source)
  file = File.open(source)
  @doc = Nokogiri::XML(file)
  file.close
end

def rename

  CSV.open('map.csv', 'w') do |csv|

    csv << ['parent_id', 'new_id', 'old_id', 'name']

    @doc.xpath('//div1').each do |div1|
      parent_id = div1.attr('id').gsub(/BoySal3/, 'swp')

      div1['id'] = parent_id
      name = div1.xpath('./head/name').text
      ap name
      div2_counter = 1

      div1.xpath('./div2').each do |div2|
        doc_id = "#{parent_id}.#{div2_counter}"
        current_id = div2['id']
        #ap "#{parent_id}, #{doc_id}, #{current_id}", "#{name}"
        csv << [parent_id, doc_id, current_id, name]

        #      #div2['data-id'] = current_id
        #div2['id'] = doc_id

        div2_counter += 1
      end

    end
  end

end

open_file('./swp-old-ids.xml')
rename
#ap @doc

