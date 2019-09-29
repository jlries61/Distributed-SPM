#!/bin/sh
modstats --db=spm --project=automate \
         --perfstats=rsquared,rsquarednorm,mse,rmse,mad,mape \
         --sessflds=MART_LOSSCRI_REG autorept.csv
