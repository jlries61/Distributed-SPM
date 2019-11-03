submit fpath
output bostn2_LAD
grove bostn2_LAD
memo "Basic TN model on the Boston housing data"
memo "LOSS=LAD"
memo echo
use boston
submit labels
category chas
model mv
treenet loss=LAD go
