# Causal_effect_final_project

This is for STAT 256 final project.

Our project mainly focused on data analysis of Covid-19 case fatality rate (CFR), which contains two parts:

1. age-related Simpson's paradox in CFR 

2. Mediation analysis using age as mediator

This repository contains:

* an interactive Jupyter notebook for Simpson's paradox and mediation analysis of age-related causal effects on case fatality rates;

* an R script US data process.R for processing the raw US data from CDC website https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data/vbim-akqf;

* the output data from R script as trend.csv for mediation analysis in Jupyter notebook.


We modified codes from github https://github.com/Juliusvk/Covid19-age-related-causal-effects which published as part of the following paper:
"Simpson's paradox in Covid-19 case fatality rates: a mediation analysis of age-related causal effects". J von Kügelgen*, L Gresele*, B Schölkopf. (*equal contribution). https://arxiv.org/abs/2005.07180
