#!/usr/bin/ruby

# ODE
# Version 8
# 2012-09-15

nouns = File.open("nouns").readlines.map{ |k| k.chomp }
verbs = File.open("verbs").readlines.map{ |k| k.chomp }
adjs = File.open("adjs").readlines.map{ |k| k.chomp }
ings = File.open("ings").readlines.map{ |k| k.chomp }

noun1 = nouns.shuffle.first
noun1.gsub!(/^\| /, "")

verb = verbs.shuffle.first

ing = ings.shuffle.first

adj = adjs.shuffle.first

art = "a "
art = "an " if adj[/^[aeiou]/i]
art = "" if adj.to_i > 0

noun2 = nouns.shuffle.first
noun2.gsub!(/ \w+$/, "")
art = "some " if noun2[/^(\w+) /, 1] == "some"
noun2.gsub!(/^([^\s]+) /, "")
if adj.to_i > 1 then
  if art == "some " then
    noun2 = ["units", "pots", "bags", "boxes", "containers"].shuffle.first + " of " + noun2
    art = ""
  else
    if noun2.gsub!(/ex$|ix$/, "ices")
    elsif noun2.gsub!(/(ch$|sh$|ss$|s$|x$|o$)/, '\1es')
    elsif noun2.gsub!(/([^aeiou])y$/, '\1ies')
    else noun2 = noun2 + "s"
    end
  end
end

puts "Ode to #{noun1} I #{verb} one midsummer morning."
puts "While #{ing} #{art}#{adj} #{noun2}."
