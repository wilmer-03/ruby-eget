require 'test/unit'
require_relative 'uppg1' # Replace 'your_file' with the name of the file containing the code.
require_relative 'uppg2'
class TestTabell < Test::Unit::TestCase
  # Test for the `get_diff` method
  def test_get_diff
    result = get_diff("20* - 10*", " - ")
    assert_equal(10, result, "Expected 10 as the difference between 20 and 10")
    
    result = get_diff("100 * - 25*", " - ")
    assert_equal(75, result, "Expected 75 as the difference between 100 and 25")
  end

  def test_tabell
    days = /[\n][" "]+[\d]+[" "]+/ #hitta bara dagar
    temps = /[" "]{2}[\d]+[\*" "]{3,4}[\d]+[*" "]+/ #hitta bara mxt mnt
    result = tabell("weather.txt", " ", temps, days)
    assert_equal([[54, "9"], [33, "26"], [32, "11"], [30, "18"], [29, "1"], [27, "21"], [27, "20"], [26, "22"], [24, "5"], 
    [24, "17"], [22, "3"], [22, "29"], [22, "23"], [21, "8"], [20, "6"], [20, "19"], [20, "16"], [20, "10"], [19, "27"], 
    [18, "4"], [18, "25"], [16, "7"], [16, "28"], [16, "2"], [15, "12"], [13, "24"], [11, "13"], [9, "15"], [2, "14"]], result)
    
    fball_res = /[\d]+[" "]+-[" "]+[\d]+/ #hitta resultat football
    teams = /[\d]+\. [A-Z][\w]+/ #hitta lagnamn
    result = tabell("football.txt", "-", fball_res, teams)
    assert_equal([[43, "1.Arsenal"], [42, "3.Manchester_U"], [37, "2.Liverpool"], [28, "6.Chelsea"], [22, "4.Newcastle"], 
    [16, "5.Leeds"], [4, "10.Blackburn"], [-1, "8.Aston_Villa"], [-4, "9.Tottenham"], [-8, "13.Fulham"], [-8, "11.Southampton"], 
    [-9, "7.West_Ham"], [-11, "14.Charlton"], [-12, "15.Everton"], [-12, "12.Middlesbrough"], [-18, "16.Bolton"], 
    [-22, "17.Sunderland"], [-23, "18.Ipswich"], [-30, "19.Derby"]], result)
  
  end

  def test_get_info
    res = get_info("events.html")
    assert_equal(8, res.length) #kollar att listan är rätt längd
    
    assert_equal(["summary", "locality", "region", "dtstart", "description"], res[0].keys)
    assert_equal(["summary", "org fn", "street-address", "locality", "region", "dtstart", "description"], res[1].keys)
    assert_equal("The Dark Carnival - 101.9FM", res[0]["summary"])
    assert_equal("The Bohemian", res[1]["org fn"])
    assert_equal("Gothic, Industrial, Dark Alternative w/ DJ LunaSlave", res[1]["description"])
  end
 
end
