#!/usr/bin/env bash
ml Anaconda2
conda create --mkdir --yes --quiet --prefix ./spyking_env -c conda-forge -c intel -c spyking-circus spyking-circus
