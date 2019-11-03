submit fpath
output bostn2_LS
grove bostn2_LS
memo "Basic TN model on the Boston housing data"
memo "LOSS=LS"
memo echo
use boston
submit labels
category chas
model mv
treenet loss=LS go
