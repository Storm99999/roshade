local shaders = {}
getgenv().Config = {
	Shaders = {
		Name = "Shiny"
	},
	
	CustomShader = {
		FCustom = false,
		FMaterial = Enum.Material.Air,
		FReflectance = 0
	},
	
	Additional = {
		reflectanceShiny = 1,
		icyReflectance = 0.36
	},
	
	UnNecessary = {
		DurationOfTime = 5
	}
}

local Fshader = getgenv().Config.Shaders.Name
-- Custom Variables
local FCustom = getgenv().Config.CustomShader.FCustom
local FMaterial = getgenv().Config.CustomShader.FMaterial
local FReflectance = getgenv().Config.CustomShader.FReflectance
-- Additional Variables
local reflectanceShiny = getgenv().Config.Additional.reflectanceShiny
local icyReflectance = getgenv().Config.Additional.icyReflectance
-- Not really needed but useful
local DurationOfTime = getgenv().Config.UnNecessary.DurationOfTime

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
