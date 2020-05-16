
# Exploring GMT

Here are my first attempts to use GMT, along with personal notes
from my learning path. The materials here are thus subjective,
biased, incomplete, and maybe wrong. See below for links to the
GMT homepage and repository, where you may find authoritative
information, and to a number of online GMT tutorials.


## Generic Mapping Tools (GMT)

The Generic Mapping Tools (GMT) are a collection of
open-source command line tools for the creation of data-driven
maps and plots. It comes with a useful set of free geographical
data: global coast lines, major rivers, and political borders
(GSHHG) as well as DCW country polygons.

Maps and plots are created by writing a Shell script
that calls upon GMT to accumulate the final PostScript
figure (that may automatically be converted to PDF or PNG).

Homepage: [www.generic-mapping-tools.org][gmtpage]  
Repository: [github.com/GenericMappingTools/gmt][gmtrepo]


## Existing Tutorials

- [GMT Tutorials][zheng] by Whyjay Zheng
- [Introduction to GMT 5][herman] by Matthew Herman
- [2019 UNAVCO shourt course][unavco] by Wessel & Co.


## My GMT Journey

I got to know about GMT some 10 or 15 years ago, but never
used it. Only recently I wanted to create an overview map
to illustrate a re-edition of Jules Vernes narration of the
Bounty mutiny, when I remembered GMT. The result may be found
here: [Les Révoltés de la Bounty, p. 30][bountymap] (PDF).

I use GMT 6.x **modern mode**.

More to come as I go on.


## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">
<img alt="Creative Commons License" style="border-width:0"
     src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a>
<br/>This work is licensed under a
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">
Creative Commons Attribution 4.0 International License</a>.

Beware that materials referenced from here have their own licenses.

[gmtpage]: https://www.generic-mapping-tools.org/
[gmtrepo]: https://github.com/GenericMappingTools/gmt
[zheng]: http://gmt-tutorials.org/en/index.html
[herman]: https://www.matthewwherman.com/tutorials.html
[unavco]: https://github.com/GenericMappingTools/2019-unavco-course
[bountymap]: http://sylphe.ch/static/VerneBounty.pdf#page=30
