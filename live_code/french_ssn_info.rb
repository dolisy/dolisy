require 'date'

french_depts = {
  "1" => "Ain",
  "2" => "Aisne",
  "3" => "Allier",
  "4" => "Alpes-de-Haute-Provence 2",
  "5" => "Hautes-Alpes",
  "6" => "Alpes-Maritimes",
  "7" => "Ardèche",
  "8" => "Ardennes",
  "9" => "Ariège",
  "10" => "Aube",
  "11" => "Aude",
  "12" => "Aveyron",
  "13" => "Bouches-du-Rhône",
  "14" => "Calvados",
  "15" => "Cantal",
  "16" => "Charente",
  "17" => "Charente-Maritime 3",
  "18" => "Cher",
  "19" => "Corrèze",
  "2A" => "Corse-du-Sud",
  "2B" => "Haute-Corse",
  "21" => "Côte-d'Or",
  "22" => "Côtes-d'Armor 4",
  "23" => "Creuse",
  "24" => "Dordogne",
  "25" => "Doubs",
  "26" => "Drôme",
  "27" => "Eure",
  "28" => "Eure-et-Loir",
  "29" => "Finistère",
  "30" => "Gard",
  "31" => "Haute-Garonne",
  "32" => "Gers",
  "33" => "Gironde 5",
  "34" => "Hérault",
  "35" => "Ille-et-Vilaine",
  "36" => "Indre",
  "37" => "Indre-et-Loire",
  "38" => "Isère",
  "39" => "Jura",
  "40" => "Landes",
  "41" => "Loir-et-Cher",
  "42" => "Loire",
  "43" => "Haute-Loire",
  "44" => "Loire-Atlantique 6",
  "45" => "Loiret",
  "46" => "Lot",
  "47" => "Lot-et-Garonne",
  "48" => "Lozère",
  "49" => "Maine-et-Loire 7",
  "50" => "Manche",
  "51" => "Marne",
  "52" => "Haute-Marne",
  "53" => "Mayenne",
  "54" => "Meurthe-et-Moselle",
  "55" => "Meuse",
  "56" => "Morbihan",
  "57" => "Moselle",
  "58" => "Nièvre",
  "59" => "Nord",
  "60" => "Oise",
  "61" => "Orne",
  "62" => "Pas-de-Calais",
  "63" => "Puy-de-Dôme",
  "64" => "Pyrénées-Atlantiques 8",
  "65" => "Hautes-Pyrénées",
  "66" => "Pyrénées-Orientales",
  "67" => "Bas-Rhin",
  "68" => "Haut-Rhin",
  "69" => "Rhône",
  "69M" => "Metropolis of Lyon 18",
  "70" => "Haute-Saône",
  "71" => "Saône-et-Loire",
  "72" => "Sarthe",
  "73" => "Savoie",
  "74" => "Haute-Savoie",
  "75" => "Paris 9",
  "76" => "Seine-Maritime 10",
  "77" => "Seine-et-Marne",
  "78" => "Yvelines 11",
  "79" => "Deux-Sèvres",
  "80" => "Somme",
  "81" => "Tarn",
  "82" => "Tarn-et-Garonne",
  "83" => "Var",
  "84" => "Vaucluse",
  "85" => "Vendée",
  "86" => "Vienne",
  "87" => "Haute-Vienne",
  "88" => "Vosges",
  "89" => "Yonne",
  "90" => "Territoire de Belfort",
  "91" => "Essonne 12",
  "92" => "Hauts-de-Seine 13",
  "93" => "Seine-Saint-Denis 14",
  "94" => "Val-de-Marne",
  "95" => "Val-d'Oise",
  "971" => "Guadeloupe 16",
  "972" => "Martinique 16",
  "973" => "Guyane 16",
  "974" => "La Réunion 16",
  "976" => "Mayotte 17"
}


def french_ssn_info(string)
  string_match = string.match(/(?<gender>[1-2]) (?<birth_year>\d{2}) (?<birth_month>\d{2}) (?<birth_place>\d{2}) (?<random_one>\d{3}) (?<random_two>\d{3}) (?<key>\d{2})/)
  if not string_match
    p "The number is invalid"
  else
    gender = string_match[:gender] == "1" ? "man" : "woman"
    p gender
    if string_match[:birth_year].to_i <= Time.new.year.to_s.scan(/\w/)[-1].to_i + Time.new.year.to_s.scan(/\w/)[-2].to_i * 10
      birth_year = 2000 + string_match[:birth_year].to_i
    else
      birth_year = 1900 + string_match[:birth_year].to_i
    end
    p birth_year
    birth_month = string_match[:birth_year].to_i
    p birth_month
    birth_place = string_match[:birth_place].to_s
    p birth_place
  end
end


french_ssn_info("1 84 12 76 451 089 46")
#=> "a man, born in December, 1984 in Seine-Maritime."

french_ssn_info("123")
#=> "The number is invalid"
