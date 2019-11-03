submit fpath
output bostn2_GAMMA
grove bostn2_GAMMA
memo "Basic TN model on the Boston housing data"
memo "LOSS=GAMMA"
memo echo
use boston
submit labels
category chas
model mv
treenet loss=GAMMA go
