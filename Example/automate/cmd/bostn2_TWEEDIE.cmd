submit fpath
output bostn2_TWEEDIE
grove bostn2_TWEEDIE
memo "Basic TN model on the Boston housing data"
memo "LOSS=TWEEDIE"
memo echo
use boston
submit labels
category chas
model mv
treenet loss=TWEEDIE go
