require 'pry'

hash = {:wat => [0, 1, {:wut => [0, [[1,2,3,4,5,6,7,8,9,{:bbq => 'Success!'}]]]}]}

p hash[:wat][2][:wut][1][0][9][:bbq]
