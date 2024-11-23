execute as @a[scores={elytra_durability_display_is_show=-2147483647..},nbt={FallFlying:0b}] run title @s actionbar ""
execute as @a[scores={elytra_durability_display_is_show=-2147483647..},nbt={FallFlying:0b}] run scoreboard players reset @s elytra_durability_display_is_show

execute as @a[nbt={Inventory:[{id:"minecraft:elytra",Slot:102b}],FallFlying:1b}] run function elytra_durability_display:internal/display