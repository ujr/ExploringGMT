
# Notes on GMT

[Skeleton](#skeleton) •
[Pens](#pens) •
[Resolution](#resolution) •
[Datasets](#datasets)

## Skeleton

The typical skeleton of a GMT script looks like this:

```sh
#!/usr/bin/env bash

gmt begin SessionName, Formats
  # more commands here
gmt end
```

We use Bash as our shell, for conformance with the GMT documentation.
Any shell could be used. Invoking the Bash through **env** in the
script's shebang will search for it in the PATH; this is considered
superior to `#!/bin/bash` because the Bash is not guaranteed to be
installed in */bin*, but it is exceedingly likely that **env** is
in */usr/bin/env*.

GMT (since version 6.x) in *modern mode* works with the notion
of a *session* that begins with `gmt begin` and ends with `gmt end`.
The actual commands to create the map appear in-between.

The *SessionName* serves as the basename for output files.
Supported output formats include `pdf` (default) and `png`.
For more than one format, separate by comma with no space
in-between, e.g. `pdf,png`.


## Pens

### Predefined Widths

0 faint, .25p default, .25p thinnest, .50p thinner,
.75p thin, 1.0p thick, 1.5p thicker, 2p thickest,
3p fat, 6p fatter, 10p fattest, 18p obese


## Resolution

Of of the [GSHHG](#gshhg) dataset:

**-Df** full,  
**-Dh** high,  
**-Di** intermediate,  
**-Dl** low,  
**-Dc** crude resolution,  
**-Da** automatic (based on region).


## GMT Datasets

GMT is accompanied by two free global datasets: GSHHG and DCW.

### GSHHG

The Global Self-consistent, Hierarchical, High-resolution Geography
Database (GSHHG) was produced by and for GMT from two global and
free datasets: the World Vector Shorelines (WVS, precise but lacks
lakes), and the World Data Bank II (WDB, includes lakes and rivers,
but is less precise). GMT documentation contains details about
how GSHHG was derived from the two datasets [GSHHG-GMT][gmtgshhg].

License: GNU Lesser General Public License

### DCW

The Digital Chart of the World, adapted for GMT, provides country
polygons that can be specified via ISO two-letter country names
(e.g., FR for France). See [DCW-GMT][gmtdcw] and [Wikipedia][wikidcw].

License: GNU Lesser General Public License


### Political Boundaries

Are part of DCW. Say **-N**border\[/pen] to choose from:

`-N1` national boundaries  
`-N2` state boundaries (only for the Americas)  
`-N3` marine boundaries  
`-Na` all of the above


[gmtgshhg]: https://docs.generic-mapping-tools.org/latest/datasets/gshhg.html
[gmtdcw]: https://docs.generic-mapping-tools.org/latest/datasets/dcw.html
[wikidcw]: https://en.wikipedia.org/wiki/Digital_Chart_of_the_World
