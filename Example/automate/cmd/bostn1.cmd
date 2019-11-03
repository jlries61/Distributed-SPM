submit fpath
output bostn1
grove bostn1
memo "Basic TN model on the Boston housing data"
memo echo
use boston
submit labels
category chas
model mv
treenet go
