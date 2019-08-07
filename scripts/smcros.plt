# 
# To create a pdf output, do follows in cygwin
# $ gnuplot scripts/smcros.plt

# set terminal x11 enhanced size 800,1000
# set terminal pdfcairo enhanced 
# set output "smcros.pdf" 
# set terminal pngcairo enhanced size 800,1000
# set output "smcros.png" 
#

cwd=system("pwd")
datadir="data"
outdir="out"
system(sprintf(" [ -e %s ] || mkdir -p %s", outdir, outdir ))

cd outdir

print "### doing gnuplot in ",cwd,"/",outdir

color_list="white black dark-grey red web-green web-blue dark-magenta dark-cyan \
dark-orange dark-yellow royalblue goldenrod dark-spring-green purple steelblue \
dark-red dark-chartreuse orchid aquamarine brown yellow turquoise grey0 grey10 \
grey20 grey30 grey40 grey50 grey60 grey70 grey grey80 grey90 grey100 light-red \
light-green light-blue light-magenta light-cyan light-goldenrod light-pink \
light-turquoise gold green dark-green spring-green forest-green sea-green blue \
dark-blue midnight-blue navy medium-blue skyblue cyan magenta dark-turquoise \
dark-pink coral light-coral orange-red salmon dark-salmon khaki dark-khaki \
dark-goldenrod beige olive orange violet dark-violet plum dark-plum dark-olivegreen \
orangered4 brown4 sienna4 orchid4 mediumpurple3 slateblue1 yellow4 sienna1 tan1 \
sandybrown light-salmon pink khaki1 lemonchiffon bisque honeydew slategrey seagreen \
antiquewhite chartreuse greenyellow gray light-gray light-grey dark-gray slategray \
gray0 gray10 gray20 gray30 gray40 gray50 gray60 gray70 gray80 gray90 gray100"


color_list_16="#ffffff #000000 #a0a0a0 #ff0000 #00c000 #0080ff #c000ff #00eeee \
#c04000 #c8c800 #4169e1 #ffc020 #008040 #c080ff #306080 #8b0000 #408000 #ff80ff \
#7fffd4 #a52a2a #ffff00 #40e0d0 #000000 #1a1a1a #333333 #4d4d4d #666666 #7f7f7f \
#999999 #b3b3b3 #c0c0c0 #cccccc #e5e5e5 #ffffff #f03232 #90ee90 #add8e6 #f055f0 \
#e0ffff #eedd82 #ffb6c1 #afeeee #ffd700 #00ff00 #006400 #00ff7f #228b22 #2e8b57 \
#0000ff #00008b #191970 #000080 #0000cd #87ceeb #00ffff #ff00ff #00ced1 #ff1493 \
#ff7f50 #f08080 #ff4500 #fa8072 #e9967a #f0e68c #bdb76b #b8860b #f5f5dc #a08020 \
#ffa500 #ee82ee #9400d3 #dda0dd #905040 #556b2f #801400 #801414 #804014 #804080 \
#8060c0 #8060ff #808000 #ff8040 #ffa040 #ffa060 #ffa070 #ffc0c0 #ffff80 #ffffc0 \
#cdb79e #f0fff0 #a0b6cd #c1ffc1 #cdc0b0 #7cff40 #a0ff20 #bebebe #d3d3d3 #d3d3d3 \
#a0a0a0 #a0b6cd #000000 #1a1a1a #333333 #4d4d4d #666666 #7f7f7f #999999 #b3b3b3 \
#cccccc #e5e5e5 #ffffff"

num2col(n)=word(color_list, n)
num2col16(n)=word(color_list_16, n)


smcolor="gray40"
cftwo="purple"
ctop="blue"
cvone="green"
chiggs="red"
c2fvtwo="cyan"
cvthree="dark-green"

set term tikz createstyle
set terminal tikz standalone linewidth 2 background "#FFFFFF" size 210mm,297mm
set output "graph2.tex"

set yrange [ 0.1: 1.0E8 ]
set xrange [ 0: 1000 ]
set logscale y 10 
set ytics format "10$^{%T}$"
set nokey
set grid
set origin 0.02,0.02

# set colorsequence podo
set colorsequence default

# set style line 1 linecolor rgb "black"
# set style line 2 linecolor rgb "blue"

set title font ",20" 'Total cross section of $e^+e^-$ processes'
set xlabel font ",18" "$\\\sqrt{s}$ (GeV)" offset 0,-1
set ylabel font ",18" "Total cross section (fb)" offset -1,0
set tics font ",16"
set xtics offset 0,-1

set label 1 at 230,280 font ",14" "$Zh$" textcolor rgb chiggs
set label 2 at 300,25 font ",14" '$\nu_e\overline{\nu}_eh$' textcolor rgb chiggs
set label 3 at 235,11 font ",14" '$e^{+}e^{-}h$' textcolor rgb chiggs
#
set label 4 at 100,5E5 font ",14" '$\Sigma q\bar{q}$' textcolor rgb cftwo
set label 5 at  40,2E4 font ",14" '$\mu\bar{\mu}$' textcolor rgb cftwo
#
set label 6 at 30,8E3 font ",14" '$\nu\bar{\nu}\gamma$' textcolor rgb smcolor
set label 7 at 23,5E3 font ",12" '$E_\gamma > 0.1E_b$' textcolor rgb smcolor
set label 8 at 18,3.5E3 font ",12" '$|\cos\theta|<0.85$' textcolor rgb smcolor
#
set label 9 at 250,4E3 font ",14" '$Z\gamma$' textcolor rgb smcolor rotate by -28
set label 10 at 280,3.2E3 font ",12" ',$|\cos\theta|<0.8$' textcolor rgb smcolor rotate by -28
set label 11 at 80,1.8E3 font ",14" '$WW$' textcolor rgb smcolor
set label 12 at 25,1.4E3 font ",12" '$|\cos\theta|<0.8$' textcolor rgb smcolor
set label 13 at 100,7E2 font ",14" '$ZZ$' textcolor rgb smcolor
set label 14 at 50,5E2 font ",12" '$|\cos\theta|<0.8$' textcolor rgb smcolor
set label 15 at 60,1.6E2 font ",14" '$WW\gamma$' textcolor rgb smcolor
set label 16 at 60,1.0E2 font ",12" '$E_{\gamma}>0.1$' textcolor rgb smcolor
set label 17 at 60,0.7E2 font ",12" '$|\cos\theta_\gamma|<0.8$' textcolor rgb smcolor
#
#
set label 21 at 360,4E2 font ",14" '$t\bar{t}$' textcolor rgb ctop
set label 22 at 800,5.5 font ",14" '$t\bar{t}Z$' textcolor rgb ctop
set label 23 at 800,0.45 font ",14" '$\nu_{e}\bar{\nu}_e t\bar{t}$' textcolor rgb ctop
#
#
set label 31 at 800,1.3E4 font ",14" '$e^{\pm}{\stackrel{(-)}{\nu}}W^{\mp}$' textcolor rgb cvone
set label 32 at 800,6.0E3 font ",14" '$e^{+}e^{-}Z$' textcolor rgb cvone
set label 33 at 220,8.0E1 font ",14" '$\nu\bar{\nu}Z$' textcolor rgb cvone
#
#
set label 41 at 800,7E1 font ",14" '$W^{+}W^{-}Z$' textcolor rgb cvthree
set label 42 at 650,0.6 font ",14" '$ZZZ$' textcolor rgb cvthree 
#
#
set label 51 at 800,1.7 font ",14" '$e^{+}e^{-}ZZ$' textcolor rgb c2fvtwo
set label 52 at 350,2 font ",14" '$e^{\pm}{\stackrel{(-)}{\nu}} W^{\mp}Z$' textcolor rgb c2fvtwo rotate by 45
set label 53 at 850,1.3E3 font ",14" '$e^{+}e^{-}W^{+}W^{-}$' textcolor rgb c2fvtwo
set label 54 at 620,2.2 font ",14" '$\nu\bar{\nu}ZZ$' textcolor rgb c2fvtwo 
set label 55 at 550,6.0 font ",14" '$\nu\bar{\nu}W^{+}W^{-}$' textcolor rgb c2fvtwo
#
#
set arrow from 500,0.1 to 500,1E8 nohead lw 1 dt (5,8) 

set label 60 at 850,5E7 font ",42" '$\textstyle{\bf{ILC}}$' 
 
set multiplot

plot sprintf("../%s/zh.dat", datadir) with lines lc rgb chiggs, \
     sprintf("../%s/eeh.dat", datadir)  with lines lc rgb chiggs, \
     sprintf("../%s/nnh.dat", datadir) with lines lc rgb chiggs, \
     sprintf("../%s/tt.dat", datadir) with lines lc rgb ctop, \
     sprintf("../%s/ttz.dat", datadir) with lines lc rgb ctop, \
     sprintf("../%s/nntt.dat", datadir) smooth csplines with lines lc rgb ctop

plot sprintf("../%s/zzz.dat", datadir) using 1:( 1000*$2 ) smooth csplines with lines lc rgb cvthree, \
     sprintf("../%s/wwz.dat", datadir) using 1:( 1000*$2 ) smooth csplines with lines lc rgb cvthree, \
     sprintf("../%s/smdata.dat", datadir) using 1:( 1000*$2 ) with lines lc rgb cftwo, \
     sprintf("../%s/smdata.dat", datadir) using 1: ( 1000*$3 ) with lines lc rgb cftwo, \
     sprintf("../%s/nng.dat", datadir) with lines lc rgb smcolor, \
     sprintf("../%s/zg.dat", datadir) using ( 2*$1 ):( 1000*$2 ) with lines lc rgb smcolor, \
     sprintf("../%s/wwg.dat", datadir) using ( 2*$1 ):( $2 ) smooth csplines with lines lc rgb smcolor, \
     sprintf("../%s/ww.dat", datadir) using 1:( 1000*$5 ) with lines lc rgb smcolor, \
     sprintf("../%s/zz.dat", datadir) using 1:( 1000*$6 ) with lines lc rgb smcolor

plot sprintf("../%s/enw.dat", datadir) using 1:( 2*$2 ) smooth csplines with lines lc rgb cvone, \
     sprintf("../%s/eez.dat", datadir) using 1:( 1000*$2 ) smooth csplines with lines lc rgb cvone, \
     sprintf("../%s/nnz.dat", datadir) using ( 2*$1 ):( 1000*$2 ) smooth csplines with lines lc rgb cvone, \
     sprintf("../%s/nnww.dat", datadir) using ( 1000*$1 ):( 1000*$3 ) smooth csplines with lines lc rgb c2fvtwo, \
     sprintf("../%s/nnzz.dat", datadir) using ( 1000*$1 ):( 1000*$3 ) smooth csplines with lines lc rgb c2fvtwo, \
     sprintf("../%s/eeww.dat", datadir) using ( 1000*$1 ):( 1000*$3 ) smooth csplines with lines lc rgb c2fvtwo, \
     sprintf("../%s/eezz.dat", datadir) using ( 1000*$1 ):( 1000*$3 ) smooth csplines with lines lc rgb c2fvtwo, \
     sprintf("../%s/enwz.dat", datadir) using ( 1000*$1 ):( 2000*$3 ) smooth csplines with lines lc rgb c2fvtwo

# set terminal x11 enhanced size 800,1000
# replot
unset multiplot

set output
# print "tex file for plot was created in graph2.tex. To create pdf and png files, do"
# print "pdflatex graph2.tex ; convert graph2.pdf smcros.png"
print "gnuplot completed. Processing ",outdir,"/graph2.tex"
! pdflatex graph2.tex > graph2.texlog 2>&1 
print "### pdflatex completed.  log is in ",outdir,"/graph2.texlog " 
! mv graph2.pdf smcros.pdf 
! convert smcros.pdf smcros.png

print "### ",outdir,"/smcros.png was created."

