--[[
	@author: nanky (nanky.oficjalnie@gmail.com),
	@license: Dual GPLv3/MIT
]]

local damages = {
	{0,2},
	{1,3},
	{2,5},
	{3,5},
	{4,7},
	{5,6},
	{6,4},
	{7,4},
	{8,7},
	{9,13},
	{22,10},
	{23,11},
	{24,25},
}

outputDebugString('Zostało zmienionych '..#damages..' wartości damage.')
	
addEventHandler('onPlayerDamage',root,function(player, weapon, part, loss)
	if weapon == 49 then return end

	for index, value in pairs(damages) do
		if value[1] == weapon then
			local damage = giveDamage(source,value[2])

			if damage ~= value[2] then 
				kickPlayer(player,'CRP - ANTICHEAT','Invalid damage')

				return
			end

			cancelEvent()
		end
	end

end)

function giveDamage(element,damage)
	setElementHealth(element,(getElementHealth(element)-tonumber(damage)));

	return damage
end
