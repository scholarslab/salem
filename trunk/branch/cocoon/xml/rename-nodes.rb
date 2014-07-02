#! /usr/bin/env ruby

require 'nokogiri'
require 'awesome_print'


def open_file(source)
  file = File.open(source)
  @doc = Nokogiri::XML(file)
  file.close
end

def rename

  @doc.xpath('//div1').each do |div1|
    parent_id = div1.attr('id').gsub(/BoySal3/, 'swp')

    div1['id'] = parent_id

    div2_counter = 1

    div1.xpath('./div2').each do |div2|
      doc_id = "#{parent_id}.#{div2_counter}"
      #ap "#{parent_id}: #{doc_id} | #{current_id}"

      #current_id = div2['id']
      #div2['data-id'] = current_id
      div2['id'] = doc_id

      div2_counter += 1
    end

  end

end

open_file('./swp.xml')
rename
ap @doc

