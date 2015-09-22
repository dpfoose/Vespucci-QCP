#
#  Project to compile QCustomPlot as shared library (.so/.dll) from the amalgamated sources
#

QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

DEFINES += QCUSTOMPLOT_COMPILE_LIBRARY
TEMPLATE = lib
CONFIG += shared debug_and_release build_all
macx: CONFIG += lib_bundle
VERSION = 1.3.1

!macx: TARGET = qcustomplot
macx: TARGET = QCustomPlot #using customary capitalization for Frameworks
CONFIG(debug, debug|release) {
  macx: TARGET = $$join(TARGET,,,d) # if compiling in debug mode, append a "d" to the library name
  QMAKE_TARGET_PRODUCT = "Vespucci-QCP (debug mode)"
  QMAKE_TARGET_DESCRIPTION = "Plotting library for Qt (debug mode)"
} else {
  QMAKE_TARGET_PRODUCT = "Vespucci-QCP"
  QMAKE_TARGET_DESCRIPTION = "Plotting library for Qt"
}
QMAKE_TARGET_COMPANY = "www.qcustomplot.com (QCP) and Wright State University (cb* color schemes)"
QMAKE_TARGET_COPYRIGHT = "Copyright (C) by Emanuel Eichhammer (QCP) and Wright State University (cb* color schemes)"

SOURCES += ../../qcustomplot.cpp
HEADERS += ../../qcustomplot.h
