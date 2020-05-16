
# Map of Greece

**Goal:** a small-scale map of Greece and the Aegean Sea,
with a small inset map to indicate where Greece is on the Earth.

Script: [Greece.sh](./Greece.sh)  
Extra data: none  
Result: [Greece.pdf](./Greece.pdf)

![Map of Greece](./Greece.png)

## Explanation

The typical skeleton of a GMT script looks like this:

```bash
#!/usr/bin/env bash

gmt begin Greece pdf,png
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

Here the session is named `Greece` and we want `Greece.pdf` and
`Greece.png` as outputs. The general syntax is:

```bash
gmt begin [SessionName] [Formats]
gmt end [show]
```

All arguments are optional; though I'd recommend to always
specify session name and format(s) explicitly.
The session name also serves as the stem for the output file names.
Valid formats include `pdf` (the default) and `png`; if more than
one output format is desired, separate them by comma with no space
in-between.
The `show` argument will display the resulting map in a default
viewer. This might be useful during development, but is better
omitted in an automated setup.

### Shell variables

It is helpful to use Shell variables for option arguments
or parts of option arguments, like the region, the projection,
colors, pens, etc. This practice helps with readability and
consistency of appearance.

```bash
REGION=16/30/34/43      # 16E..30E, 34N..43N
PROJ=M16c               # Mercator, 16cm wide
BORDERPEN=thickest,red4 # pen for political borders
# etc.
```

### Map of Greece

The `gmt coast` module (i.e., command) will plot coastlines and
country polygons based on global datasests that come with GMT.

```bash
gmt coast -R$REGION -J$PROJ -B -G$LANDFILL -S$SEAFILL \
    -W$COASTPEN -N1/$BORDERPEN -EGR+gbisque+p$COASTPEN -Di
```

- `-R$REGION` is the region, here drawn from a Shell variable
- `-J$PROJ` is the map projection, here drawn from a Shell variable
- `-B` draws map frame and annotation (using defaults)
- `-G` fills ground (dry) areas, `-S` fills sea (wet) areas
- `-W` specifies the pen to draw the coastline
- `-N1/$BORDERPEN` includes political boundaries
- `-EGR` draws country polygon for Greece (`+g` is fill, `+p` is outline)
- `-Di` intermediate resolution for coastlines and boundaries

A close look reveals that countries (from `-E`) are
not perfectly aligned with the coastline. The reason is that
they are from different datasets, the former from [DCW][],
the latter from [GSHHG][].

### Inset map of the globe

An inset is a small window of the current plot that can be
drawn to with independent settings (like a different region
and a different projection). Insets start with `gmt inset begin -D...`
and end with `gmt inset end`.

```bash
gmt inset begin -DjBL+w5.1c+o8p -M.05c
  gmt coast -Rg -JG23E/23N/5c -Gbisque4 -Slightsteelblue -Bg -EGR+gred
gmt inset end
```

`-DjBL` positions the inset relative to the bottom left,
`+w5.1c` makes it 5.1cm wide (and high), and
`+08p` offsets it by 8pt from the bottom left.
(There are many other ways to place the inset.)

`-M.05c` adds an inside margin of .5cm, which essentially
shifts the inset contents by .5cm up and right, such that
the full line width of the globe's outer line is visible
(the globe is 5cm in diameter, the inset is 5.1cm wide,
so this centers it).

A frame around the inset could be added with `-F`.

The map of the globe with Greece highlighted is produced again
by the `gmt coast` module, but this time using `-Rg` for the
whole globe, `-JG23E/23N/5c` for an Orthographic projection
centered on 23E 23N and 5cm wide, `-Bg` draws a grid with default
spacing, and `-EGR+gred` paints the country polygon for Greece
(GR) in red.


[DCW]: https://docs.generic-mapping-tools.org/latest/datasets/dcw.html
[GSHHG]: https://docs.generic-mapping-tools.org/latest/datasets/gshhg.html
