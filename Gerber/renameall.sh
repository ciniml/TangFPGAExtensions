#!/bin/bash
PROJECT_NAME=$(basename $(dirname $(cd $(dirname $0);pwd)))
mv -f ${PROJECT_NAME}-F_Cu.gtl ${PROJECT_NAME}.gtl
mv -f ${PROJECT_NAME}-B_Cu.gbl ${PROJECT_NAME}.gbl
mv -f ${PROJECT_NAME}-F_Mask.gts ${PROJECT_NAME}.gts
mv -f ${PROJECT_NAME}-B_Mask.gbs ${PROJECT_NAME}.gbs
mv -f ${PROJECT_NAME}-F_Silkscreen.gto ${PROJECT_NAME}.gto
mv -f ${PROJECT_NAME}-B_Silkscreen.gbo ${PROJECT_NAME}.gbo
mv -f ${PROJECT_NAME}-Edge_Cuts.gm1 ${PROJECT_NAME}.gm1
mv -f ${PROJECT_NAME}-F_Paste.gtp ${PROJECT_NAME}.gtp
mv -f ${PROJECT_NAME}-B_Paste.gbp ${PROJECT_NAME}.gbp
mv -f ${PROJECT_NAME}-PTH.drl  ${PROJECT_NAME}-PTH.txt
mv -f ${PROJECT_NAME}-NPTH.drl ${PROJECT_NAME}-NPTH.txt