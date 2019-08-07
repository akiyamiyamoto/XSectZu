# xsectzu
Cross section plots of ILC processes

Collection of tools to create cross-section plots of ILC processes

# How to create plots

## Requires

* This tool was developped using cygwin with gnuplot version 5.2 patch 7.

* tikz terminal should be supported by gnuplot

* pdflatex, ImageMagick's convert


## To run

```
gnuplot scripts/smcros.plt
```

Cross section plot is created in `out/smcros.png` and `out/smcros.pdf`

# Calculate cross section data by whizard2

```
./scripts/subjobs.sh sindarin/<dir>/<sinfile>
```
where
```
<dir> : directory name of sindarin files
<sinfile> : file name of sindarin file.
```
The command assumes the sindarin file in `sindarin/<dir>/<sinfile>`.
It submit a job to calculate cross sections using whizard2.

