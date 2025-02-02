require "rexml/document"



def get_info(doc)
  src = File.open(doc)
  doc = REXML::Document.new src
  root = doc.root
  
  events = []
  root.elements.each("//div[@class = 'vevent']") { |e|
    dictionary = {}
    e.elements.each(".//span[@class = 'summary']") { |e| 
        dictionary["summary"] = e.text
    }
    e.elements.each(".//strong[@class = 'org fn']") { |e|
        dictionary["org fn"] = e.text
    }
    e.elements.each(".//span[@class = 'street-address']") { |e| 
        dictionary["street-address"] = e.text
    }
    e.elements.each(".//span[@class = 'locality']") { |e| 
        dictionary["locality"] = e.text
    }
    e.elements.each(".//span[@class = 'region']") { |e| 
        dictionary["region"] = e.text
    }
    e.elements.each(".//span[@class = 'dtstart']") { |e| 
        dictionary["dtstart"] = e.text
    }
    e.elements.each(".//tr/td[@class = 'description']/p") { |e| 
        dictionary["description"] = e.text
    }
    events.append(dictionary)
    
}
  return events
end

p get_info("events.html")[1]
