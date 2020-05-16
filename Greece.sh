#!/usr/bin/env bash

REGION=16/30/34/43  # 16E..30E, 34N..43N
PROJ=M16c  # Mercator, 16cm wide map
BORDERPEN=thickest,red4
COASTPEN=thinnest,dimgray
LANDFILL=bisque3
SEAFILL=lightblue

gmt begin Greece pdf,png

  # coastlines and political borders:
  gmt coast -R$REGION -J$PROJ -B -G$LANDFILL -S$SEAFILL \
    -W$COASTPEN -N1/$BORDERPEN -EGR+gbisque+p$COASTPEN -Di

  # an inset map of the globe with Greece highlighted:
  gmt inset begin -DjBL+w5.1c+o8p -M.05c #-F+pthinnest
    gmt coast -Rg -JG23E/23N/5c -Gbisque4 -Slightsteelblue -Bg -EGR+gred
  gmt inset end

gmt end
