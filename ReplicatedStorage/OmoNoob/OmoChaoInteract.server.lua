local hitbox = script.Parent.interacthitbox
local omonoob = script.Parent
local db = false
local head = script.Parent.Head
local normalface = "rbxassetid://119655080418894"
local normaltalkface = "rbxassetid://126985755022088"
local happyface = "rbxassetid://136694197795609"
local surprisedface = "rbxassetid://76825082548208"
local sadface = "rbxassetid://84426474524229"
local sadtalkface = "rbxassetid://129403090057781"
local madface = "rbxassetid://139764592746657"
local madtalkface = "rbxassetid://72780188103664"
local normal = {normalface, normaltalkface}
local expressions = {happyface, surprisedface}
local sad = {sadface, sadtalkface}
local mad = {madface, madtalkface}
local whichnpc = script.Parent.TalkativeNpc.Value
local startposition = Vector3.new(script.Parent.HumanoidRootPart.CFrame)
local startsound = script.Parent.Startup
local rep = game:GetService("ReplicatedStorage")
local rem = rep.Textboxtalk
local head = omonoob.Head
local faceloop = true

local function startup()
	startsound:Play()
	local cloudclone = rep.Cloud:Clone()
	cloudclone.Parent = workspace
	local motor6d = Instance.new("Motor6D")
	
end

local function talk(emotion)
	while faceloop == true do
		wait(0.2)
		head.TextureID = emotion[1]
		wait(0.2)
		head.TextureID = emotion[2]
	end
end


hitbox.Touched:Connect(function(hit)
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if db == false then
		if player then
			db = true
			rem:FireClient(player, whichnpc)
			talk(normal)
		end
	end
end)


rem.OnServerEvent:Connect(function(int)
	faceloop = false
	wait(0.5)
	head.TextureID = normalface
	faceloop = true
	db = false
	
end)
