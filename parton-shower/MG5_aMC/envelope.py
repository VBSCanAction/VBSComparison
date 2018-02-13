#!/usr/bin/python

## import modules
import os
import yoda
import glob
####################

## declare modes
# generate yodas
# generate rivet-mkhtml command
####################

import  optparse, sys, math

parser = optparse.OptionParser(usage=__doc__)
parser.add_option('-o', '--output', default='-', dest='OUTPUT_FILE')
#parser.add_option('-c', '--central', default='-', dest='CENTRAL_FILE')
opts, fileargs = parser.parse_args()
            
####################

## Put the incoming objects into a dict from each path to a list of histos and scalings

filenames = []
for fa in fileargs:
  filenames += [fa]

# check for at least one input file
if len(filenames) < 1:
  print "need at least one input file"
  exit(1)

## generate all variations
if True:
  # from yoda-manipulate:
  scatters_all = {}
  scatters_pdf = {}
  scatters_scale = {}
  scatters_central = {}
  for filename in filenames:
    # print filename
    for p, ao in yoda.readYODA(filename).iteritems():
      if isinstance(ao, yoda.Scatter2D):
        scatter = ao
      elif isinstance(ao, yoda.Histo1D):
        scatter = yoda.Scatter2D(ao.path, ao.title)
        for bin in ao.bins:
          scatter.addPoint(yoda.Point2D(bin.xMid, bin.height, 0.5*bin.xWidth, bin.heightErr))
      else:
        print "cannot treat ", ao
        continue
      path = ao.path.split()
      scatter.path = path[0]
      if path[1] == "PDF=":
        scatters_all.setdefault(path[0], []).append(scatter)
        scatters_pdf.setdefault(path[0], []).append(scatter)
        if path[2] == "260000":
          scatters_central.setdefault(path[0], []).append(scatter)
      elif path[1] == "dyn=":
        scatters_all.setdefault(path[0], []).append(scatter)
        scatters_scale.setdefault(path[0], []).append(scatter)
      elif path[1] == "0":
        pass # ignore
      elif path[1] == "central":
        pass # ignore
      else:
        print "Unknown path object: ", ao.path

  # write out
  scatters_outall = {}
  scatters_outpdf = {}
  scatters_outscale = {}

  ## all
  for p, scatters in scatters_all.iteritems():
    for pcentral, scattercentral in scatters_central.iteritems():
      if pcentral == p:
        scatters_outall[scattercentral[0].path] = scattercentral[0].clone()
    for i, point in enumerate(scatters_outall[scatters[0].path].points):
      upper = float('-inf')
      lower = float('inf')
      for scatter in scatters:
        val = scatter.points[i].y;
        if val > upper:
          upper = val
        if val < lower:
          lower = val
        point.yErrs = (point.y-lower, upper-point.y)
  # write envelopes
  outname = opts.OUTPUT_FILE.replace(".yoda","_all.yoda")
  yoda.write(scatters_outall.values(), outname)
  ## pdf
  for p, scatters in scatters_pdf.iteritems():
    for pcentral, scattercentral in scatters_central.iteritems():
      if pcentral == p:
        scatters_outpdf[scattercentral[0].path] = scattercentral[0].clone()
    for i, point in enumerate(scatters_outpdf[scatters[0].path].points):
      upper = float('-inf')
      lower = float('inf')
      for scatter in scatters:
        val = scatter.points[i].y;
        if val > upper:
          upper = val
        if val < lower:
          lower = val
        point.yErrs = (point.y-lower, upper-point.y)
  # write envelopes
  outname = opts.OUTPUT_FILE.replace(".yoda","_pdf.yoda")
  yoda.write(scatters_outpdf.values(), outname)
  ## scale
  for p, scatters in scatters_scale.iteritems():
    for pcentral, scattercentral in scatters_central.iteritems():
      if pcentral == p:
        scatters_outscale[scattercentral[0].path] = scattercentral[0].clone()
    for i, point in enumerate(scatters_outscale[scatters[0].path].points):
      upper = float('-inf')
      lower = float('inf')
      for scatter in scatters:
        val = scatter.points[i].y;
        if val > upper:
          upper = val
        if val < lower:
          lower = val
        point.yErrs = (point.y-lower, upper-point.y)
  outname = opts.OUTPUT_FILE.replace(".yoda","_scale.yoda")
  yoda.write(scatters_outscale.values(), outname)

