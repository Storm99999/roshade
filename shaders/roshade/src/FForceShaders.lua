local shaders = {}
local Fshader = nil
-- Custom Variables
local FCustom = false
local FMaterial = Enum.Material.Air
local FReflectance = 0
-- Additional Variables
local reflectanceShiny = 1
local icyReflectance = 0.36
-- Not really needed but useful
local DurationOfTime = 5

shaders.FSetShader = function(FError)
	if FError == nil then
		print("[RoShade] no errors!")
		for _,v in pairs(workspace:GetDescendants()) do
			if v.ClassName == "Part"
				or v.ClassName == "SpawnLocation"
				or v.ClassName == "WedgePart"
				or v.ClassName == "Terrain"
				or v.ClassName == "MeshPart" then
				if Fshader == "Shiny" then
					v.Material = Enum.Material.Glass
					v.Reflectance = 1
				end
				if Fshader == "Boosted" then
					v.Material = Enum.Material.Plastic
					v.Reflectance = 0
				end
				if Fshader == "Dark" then
					v.Material = Enum.Material.CrackedLava
					v.Reflectance = 0
				end
				if Fshader == "Icy" then
					v.Material = Enum.Material.Glass
					v.Reflectance = 0.36
				end
				
				if FCustom then
					v.Material = FMaterial
					v.Reflectance = FReflectance
				end
				
				
			end
		end
	else
		print(FError)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Ooops.",
			Text = FError,
			Duration = DurationOfTime
		})
	end
end


return shaders;
