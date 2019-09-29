submit fpath
output bostn2_HUBER
grove bostn2_HUBER
memo "Basic TN model on the Boston housing data"
memo "LOSS=HUBER"
memo echo
use boston
submit labels
category chas
model mv
treenet loss=HUBER go
