local hitbox = script.Parent.interacthitbox
local omonoob = script.Parent
local db = false
local head = script.Parent.Head
local noobroot = omonoob.HumanoidRootPart
local hum = omonoob.Humanoid
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
local startposition = Vector3.new(noobroot.CFrame.X, noobroot.CFrame.Y, noobroot.CFrame.Z)
local startsound = script.Parent.Startup
local rep = game:GetService("ReplicatedStorage")
local rem = rep.Textboxtalk
local faceloop = true
local idleanim = Instance.new("Animation")
idleanim.AnimationId = "rbxassetid://96848443113684"
local getcloudanim = Instance.new("Animation")
getcloudanim.AnimationId = "rbxassetid://72705179091232"
local flyoncloudanim = Instance.new("Animation")
flyoncloudanim.AnimationId = "rbxassetid://86751141786348"
local getcloudtrack = hum:LoadAnimation(getcloudanim)
local flycloudtrack = hum:LoadAnimation(flyoncloudanim)
local idletrack = hum:LoadAnimation(idleanim)
local dwait1 = script.Parent.DialogueWait1.Value
local dwait2 = script.Parent.DialogueWait2.Value
local bodygyro = Instance.new("BodyGyro", noobroot)
local bodpos = Instance.new("BodyPosition", noobroot)
bodpos.Position = startposition
local flying = true
-- 1 is reset line, 2 is leave line, 3 is sword line, 4 is shiftlock line, 5 is bomb line
-- make omo fly around player that interacted with it
-- after 3 seconds, fly back to normal spot and go back to idle animation

idletrack:Play()

local function startup()
	
	idletrack:Stop()
	local cloudclone = rep.Cloud:Clone()
	cloudclone.Parent = omonoob
	local motor6d = Instance.new("Motor6D")
	motor6d.Parent = omonoob["Left Arm"]
	motor6d.Part0 = omonoob["Left Arm"]
	motor6d.Part1 = cloudclone
	motor6d.C0 = CFrame.new(0,0,0)
	motor6d.C1 = CFrame.new(0,1.35,0) * CFrame.Angles(0,0,math.rad(90))
	startsound:Play()
	getcloudtrack:Play()
	getcloudtrack.Stopped:Wait()
	flycloudtrack:Play()
	cloudclone.Wind:Play()
end

local function flyaround(plr, bool)
		
	local root = plr.HumanoidRootPart
	--front = z5
	--back = z-5
	--left == x-5
	--right = x5
	--hum:MoveTo(root.CFrame * Vector3.new(-5,0,0))
	bodpos.MaxForce = Vector3.new(0,50000,0)
	bodpos.Position = Vector3.new(noobroot.CFrame.X, noobroot.CFrame.Y*5, noobroot.CFrame.Z)
	while flying == true do 
		hum:MoveTo(root.CFrame * CFrame.Angles(0, math.random(-7.5,7.5),0) * Vector3.new(0,0,-10))
		hum.MoveToFinished:Wait()
	end
end

local function goback()
	hum:MoveTo(Vector3.new(startposition.X, startposition.y+5,startposition.Z))
	hum.MoveToFinished:Wait()
	wait(0.5)
end


hitbox.Touched:Connect(function(hit)
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if db == false then
		if player then
			db = true
			startup()
			rem:FireClient(player, whichnpc, dwait1, dwait2)
			flyaround(hit.Parent, true)
		end
	end
end)



rem.OnServerEvent:Connect(function(plr, npcid)
	local bigid = npcid
	print(bigid)
	if whichnpc == bigid then
		wait(2)
		flying = false
		goback()
		flycloudtrack:Stop()
		omonoob.Cloud.Wind:Stop()
		omonoob["Left Arm"].Motor6D:Destroy()
		omonoob.Cloud:Destroy()
		idletrack:Play()
		bodpos.Position = startposition
		wait(1)
		db = false
		flying = true		
	else
		flying = true
	end
	
end)
