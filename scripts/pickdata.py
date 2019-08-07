#!/usr/bin/env python 

import argparse
import json
import pprint
import os

# ############################
def pickData(logfile):

    data=[]
    sqrts_str=""
    sqrts = 0.0
    for line in open(logfile):
        if "sqrts" in line:
           sqrts_str=line[:-1]
        if " fb" in line:
           # sqrts =  1.050000000000E+03    1.1805962E+01 +- 3.50E-03 fb
           sqrts=float(sqrts_str.replace(" ","").split("=")[1])
           # print sqrts_str+ " " + line[:-1]
           xsect = float(("xsect " + line[:-1]).strip().split()[1])
           xerror = float(("xsect " + line[:-1]).strip().split()[3])
           # print "sqrts="+str(sqrts) + "  xsect="  + str(xsect)
           data.append([sqrts, xsect, xerror])

    return data

# ############################
if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="Pickup cross section data from whizard2 output for plots")
    parser.add_argument("infile",help="Whizard2 job output file name")
    parser.add_argument("-o", help="Directory to output cross section data", dest="outdir",
           action="store", default="tmp")
    parser.add_argument("-n", help="Output file name prefix. If not give, decided from input file name",
           action="store", default="", dest="fpref")

    args = parser.parse_args()
    infile = args.infile
    outdir = args.outdir
    fpref = args.fpref

    if not os.path.exists(outdir):
       os.mkdir(outdir)
       print outdir+" was created." 

    data = pickData(infile)
    outdir=outdir[:-1] if outdir.endswith("/") else outdir
    if fpref == "":
       fpref = infile.rsplit("/")[-2]

    outfile=outdir+"/"+fpref+".dat"
    print "## Cross section data is written to "+outfile
    
    fout = open(outfile,"w") 
    for d in data:
       fout.write("%s %s %s\n" % (str(d[0]), str(d[1]), str(d[2])))
    fout.close()

