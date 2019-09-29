submit fpath
output bostn2_RF
grove bostn2_RF
memo "Basic TN model on the Boston housing data"
memo "LOSS=RF"
memo echo
use boston
submit labels
category chas
model mv
treenet loss=RF go
