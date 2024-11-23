scoreboard players set @s elytra_durability_display_is_show 1

execute store result score damage elytra_durability_display_math run data get entity @s Inventory[{id:"minecraft:elytra",Slot:102b}].tag.Damage
execute store result score unbreakingRatio elytra_durability_display_math run data get entity @s Inventory[{id:"minecraft:elytra",Slot:102b}].tag.Enchantments[{id:"minecraft:unbreaking"}].lvl

# 내구성 비율 구하기
scoreboard players operation unbreakingRatio elytra_durability_display_math += 1 elytra_durability_display_math

# 최대 값 구하기
scoreboard players set realMax elytra_durability_display_math 432
scoreboard players operation max elytra_durability_display_math = realMax elytra_durability_display_math

# 현재 내구도 구하기
scoreboard players operation realCurrent elytra_durability_display_math = max elytra_durability_display_math
scoreboard players operation realCurrent elytra_durability_display_math -= damage elytra_durability_display_math
scoreboard players operation realCurrent elytra_durability_display_math -= 1 elytra_durability_display_math
scoreboard players operation current elytra_durability_display_math = realCurrent elytra_durability_display_math

# 내구성 인챈트 비율에 곱하기
scoreboard players operation max elytra_durability_display_math *= unbreakingRatio elytra_durability_display_math
scoreboard players operation current elytra_durability_display_math *= unbreakingRatio elytra_durability_display_math

# 0 ~ 30까지의 비율 계산
scoreboard players operation ratio elytra_durability_display_math = current elytra_durability_display_math
scoreboard players operation ratio elytra_durability_display_math *= 30 elytra_durability_display_math
execute if score current elytra_durability_display_math matches ..59 run scoreboard players operation ratio elytra_durability_display_math /= 60 elytra_durability_display_math
execute if score current elytra_durability_display_math matches 60.. run scoreboard players operation ratio elytra_durability_display_math /= max elytra_durability_display_math

# 현재 내구도를 분으로 변환
scoreboard players operation minute elytra_durability_display_math = current elytra_durability_display_math
scoreboard players operation minute elytra_durability_display_math /= 60 elytra_durability_display_math

# 현재 내구도를 0 ~ 60까지 반복
scoreboard players operation second elytra_durability_display_math = current elytra_durability_display_math
scoreboard players operation second elytra_durability_display_math %= 60 elytra_durability_display_math

# 현재 초를 텍스트로
execute if score second elytra_durability_display_math matches 10.. store result storage elytra_durability_display:temp second int 1 run scoreboard players get second elytra_durability_display_math
execute if score second elytra_durability_display_math matches 9 run data modify storage elytra_durability_display:temp second set value "09"
execute if score second elytra_durability_display_math matches 8 run data modify storage elytra_durability_display:temp second set value "08"
execute if score second elytra_durability_display_math matches 7 run data modify storage elytra_durability_display:temp second set value "07"
execute if score second elytra_durability_display_math matches 6 run data modify storage elytra_durability_display:temp second set value "06"
execute if score second elytra_durability_display_math matches 5 run data modify storage elytra_durability_display:temp second set value "05"
execute if score second elytra_durability_display_math matches 4 run data modify storage elytra_durability_display:temp second set value "04"
execute if score second elytra_durability_display_math matches 3 run data modify storage elytra_durability_display:temp second set value "03"
execute if score second elytra_durability_display_math matches 2 run data modify storage elytra_durability_display:temp second set value "02"
execute if score second elytra_durability_display_math matches 1 run data modify storage elytra_durability_display:temp second set value "01"
execute if score second elytra_durability_display_math matches 0 run data modify storage elytra_durability_display:temp second set value "00"

# 최대 내구도를 분으로 변환
scoreboard players operation maxMinute elytra_durability_display_math = max elytra_durability_display_math
scoreboard players operation maxMinute elytra_durability_display_math /= 60 elytra_durability_display_math

# 최대 내구도를 0 ~ 60까지 반복
scoreboard players operation maxSecond elytra_durability_display_math = max elytra_durability_display_math
scoreboard players operation maxSecond elytra_durability_display_math %= 60 elytra_durability_display_math

# 최대 초를 텍스트로
execute if score maxSecond elytra_durability_display_math matches 10.. store result storage elytra_durability_display:temp maxSecond int 1 run scoreboard players get maxSecond elytra_durability_display_math
execute if score maxSecond elytra_durability_display_math matches 9 run data modify storage elytra_durability_display:temp maxSecond set value "09"
execute if score maxSecond elytra_durability_display_math matches 8 run data modify storage elytra_durability_display:temp maxSecond set value "08"
execute if score maxSecond elytra_durability_display_math matches 7 run data modify storage elytra_durability_display:temp maxSecond set value "07"
execute if score maxSecond elytra_durability_display_math matches 6 run data modify storage elytra_durability_display:temp maxSecond set value "06"
execute if score maxSecond elytra_durability_display_math matches 5 run data modify storage elytra_durability_display:temp maxSecond set value "05"
execute if score maxSecond elytra_durability_display_math matches 4 run data modify storage elytra_durability_display:temp maxSecond set value "04"
execute if score maxSecond elytra_durability_display_math matches 3 run data modify storage elytra_durability_display:temp maxSecond set value "03"
execute if score maxSecond elytra_durability_display_math matches 2 run data modify storage elytra_durability_display:temp maxSecond set value "02"
execute if score maxSecond elytra_durability_display_math matches 1 run data modify storage elytra_durability_display:temp maxSecond set value "01"
execute if score maxSecond elytra_durability_display_math matches 0 run data modify storage elytra_durability_display:temp maxSecond set value "00"

# 액션바에 띄우기
execute if score current elytra_durability_display_math matches ..59 run function elytra_durability_display:internal/display_action_bar_red
execute if score current elytra_durability_display_math matches 60.. run function elytra_durability_display:internal/display_action_bar

data remove storage elytra_durability_display:temp second
data remove storage elytra_durability_display:temp maxSecond