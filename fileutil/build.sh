#!/bin/bash
dmd grepall.d common.d
cp ./grepall ~/bin/grepall
dmd findall.d common.d
cp ./findall ~/bin/findall
