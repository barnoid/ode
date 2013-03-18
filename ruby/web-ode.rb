#!/usr/bin/ruby

# ODE
# Version 8
# 2012-09-15

nouns = File.open("nouns").readlines.map{ |k| k.chomp }
verbs = File.open("verbs").readlines.map{ |k| k.chomp }
adjs = File.open("adjs").readlines.map{ |k| k.chomp }
ings = File.open("ings").readlines.map{ |k| k.chomp }

noun1 = nouns.shuffle.first.dup
noun1.gsub!(/^\| /, "")

verb = verbs.shuffle.first.dup

ing = ings.shuffle.first.dup

adj = adjs.shuffle.first.dup

art = "a "
art = "an " if adj[/^[aeiou]/i]
art = "" if adj.to_i > 0

noun2 = nouns.shuffle.first.dup
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

print <<END
Content-type: text/html

<!DOCTYPE html>
<html lang="en">
<head>
<title>Ode</title>

<style type="text/css">
@font-face {
	font-family: Bedstead;
	src: url('/ode/bedstead.otf');
}
body {
	background-color: #eee;
	color: #111;
}
#outer {
	background-color: #D0BB5B;
	border: solid #D0BB5B 5px;
	width: 40em;
	margin: auto;
}
#middle {
	background-color: #211500;
	margin: 5px;
	border: solid #322000 5px;
	border-radius: 15px;
	-moz-border-radius: 15px;
}
#inner {
	font-family: Bedstead, serif;
	background-color: #111111;
	margin: 8px;
	border: solid black 10px;
	border-radius: 15px;
	-moz-border-radius: 15px;
	padding: 20px;
	text-align: center;
	color: white;
	height: 24em;
}
#text {
	text-align: left;
	margin-top: 25px;
}
#about {
	text-align: left;
	display: none;
	overflow-y: scroll;
	height: 24em;
}
#keys {
	padding: 20px;
	text-align: center;
}
.fkey {
	background-color: #C42512;
	color: white;
	text-align: centre;
	padding: 10px;
	border-radius: 8px; -moz-border-radius: 8px;
	font-family: sans-serif;
	font-style: italic;
	text-decoration: none;
}
.key {
	background-color: #15120D;
	color: white;
	text-align: centre;
	padding: 10px;
	border-radius: 8px; -moz-border-radius: 8px;
	font-family: sans-serif;
	font-style: italic;
	text-decoration: none;
}
.pic {
	text-align: center;
	margin: 10px;
	padding: 10px;
	font-size: 75%;
}
#reset {
	background-color: black;
	color: white;
	font-family: Bedstead, serif;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding-left: 20px;
	font-size: 25px;
	overflow: hidden;
	display: none;
}
</style>

<script type="text/javascript">
function requestFullScreen(element) {
    // Supports most browsers and their versions.
    var requestMethod = element.requestFullScreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;

    if (requestMethod) { // Native full screen.
        requestMethod.call(element);
    }
}
function resetBeeb() {
	document.getElementById('reset').style.display = 'block';
	document.body.style = 'black';
	requestFullScreen(document.body);
}
function showAbout() {
	document.getElementById('ode').style.display = 'none';
	document.getElementById('about').style.display = 'block';
}
</script>

</head>

<body>
<div id="outer">
<div id="middle">
<div id="inner">
<div id="ode">
<div style="font-size: 150px;"><span style="color: green;">O</span><span style="color: yellow;">D</span><span style="color: cyan;">E</span></div>
<div id="text">
<div>Ode to #{noun1} I #{verb} one midsummer morning.</div>
<div>While #{ing} #{art}#{adj} #{noun2}.</div>
</div>
</div>
<div id="about">
<p><span style="color: green;">O</span><span style="color: yellow;">D</span><span style="color: cyan;">E</span> was originally written on my BBC B in 1993 when I was 13. The form of the first line is of course based on the title of a poem by <a href="http://en.wikipedia.org/wiki/Vogon#Poetry">Poet Master Grunthos the Flatulent of the Azgoths of Kria</a>, the second worst poets in the Universe.</p>
<div class="pic">
<img src="/ode/ode1.png"/>
<p>Ode 1 title screen, 1993ish.</p>
</div>
<p>It slowly grew into a tangled mess of spaghetti code, I remember attempting to debug it by printing it out onto a length of fan-fold paper taller than me, pinning it to the wall and going at it with highlighters, standing on a chair.</p>
<p>For Christmas 1994 I was given a RISC PC and transferred Ode to it soon after. I slowly learnt how to make RISC OS GUI programs and stuck Ode into one. By early 1997 it had a graphical editor for the word lists and was capable of pluralising nouns usually.</p>
<div class="pic">
<img src="/ode/ode362.png"/>
<p>Ode 3.62 on RISC OS, June 1995.</p>
</div>
<p>In my post-Acorn years I've reimplemented Ode several times as an exercise when learning a new language. At some point in 97 or 98 I think I did a Pascal version, but I don't have it anymore. The next one was in 2001 in C, bad segfaulty C. A year later I did a version in Java, it was gratuitously object oriented.</p>
<p>This version consists of quite a small amount of Ruby and is the most grammatically correct yet (it no longer comes up with stuff like "While stealing 15 milks"). The pluralising stuff is much easier with regex.</p>
<p>All the code is <a href="https://github.com/barnoid/ode/">available on Github</a> including <a href="https://github.com/barnoid/ode/blob/79af1cd2f24ccc330ee8ccfb22eeb793990de8c8/bbc/ode.txt">the original</a>.</p>
<p>Acknowledgements are due to: Douglas Adams, Peter Jones (not the original voice of the book, a school friend of mine), Mark Hiscott and Duncan Jauncey.</p>
<p>The <a href="http://bjh21.me.uk/bedstead/">font on this page</a> was generated from the characters produced by the chip that handled Mode 7 on the BBC.</p>
<p>
</div>
</div>
</div>
</div>
<div id="keys">
<a href="ode" class="fkey">Again</a> <a href="#" class="fkey" onclick="showAbout();">About</a> <a class="key" href="#" onclick="resetBeeb();">Break</a>
</div>
<div id="reset">
<p>BBC Computer 32K</p>
<p>Acorn DFS</p>
<p>BASIC</p>
<p/>
<p>&gt;</p>
</div>
</body>

</html>
END

