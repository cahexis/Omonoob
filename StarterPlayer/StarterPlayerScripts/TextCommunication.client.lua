local rep = game:GetService("ReplicatedStorage")
local rem = rep.Textboxtalk
local gui = game:GetService("StarterGui")
local player = game.Players.LocalPlayer
local plrgui = player.PlayerGui
local wholebox = plrgui:WaitForChild("ScreenGui")
local ts = game:GetService("TweenService")
local tinfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false)
local tinfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false)
local textback = wholebox.thebox
local showingtween = ts:Create(textback, tinfo, {BackgroundTransparency = 0.7})
local showtexttween = ts:Create(textback.Textbox1, tinfo, {TextTransparency = 0})
local hidetexttween = ts:Create(textback.Textbox1, tinfo2, {TextTransparency = 1})
local hidetween = ts:Create(textback, tinfo2, {BackgroundTransparency = 1})
local textbox1 = textback.Textbox1
local TalkSound1 = textback.TalkSound1
local TalkSound2= textback.TalkSound2
local normalface = {"rbxassetid://119655080418894", "rbxassetid://126985755022088"}
local happyface = "rbxassetid://136694197795609"
local surprisedface = "rbxassetid://76825082548208"
local sadface = {"rbxassetid://84426474524229", "rbxassetid://129403090057781"}
local madface = {"rbxassetid://139764592746657", "rbxassetid://72780188103664"}
local texttable1 = {"To reset your character,\nopen the escape menu", "You can leave the game by pressing,","Use the sword tool to attack your enemy!", "Have you tried using SHIFT LOCK to beat this parkour?", "Use the bomb to break the crates infront of you!"}
local texttable2 = {"click reset, and press confirm!","escape, leave, and pressing leave again!","","","","","","","","","",""}
local sounds1 = {"rbxassetid://105929369145001", "rbxassetid://88004079957410", "rbxassetid://139427080648900", "rbxassetid://112021741630260", "rbxassetid://134046646084692"}
--d1 = 3.5, 2.5
--d2 = 2, 3
--d3 = 2.5
--d4 = 3.1
--d5 = 3.1

local function talkingtime(text, sound, Apause, Bpause)
	wholebox.Enabled = true
	showingtween:Play()
	showingtween.Completed:Wait()
	textbox1.TextTransparency = 0
	textbox1.Text = texttable1[text]
	TalkSound1.SoundId = sounds1[sound]
	TalkSound1:Play()
	wait(Apause)
	if Bpause > 0 then
		textbox1.Text = texttable2[text]
		wait(Bpause)
	end
	hidetexttween:Play()
	hidetween:Play()
	hidetexttween.Completed:Wait()
	textbox1.Text = ""	
	wholebox.Enabled = false
end

local done = true
rem.OnClientEvent:Connect(function(whichnpc, dwait1, dwait2)
	local npcid = whichnpc
	local num = 1
	local pause1 = dwait1
	local pause2 = dwait2
	talkingtime(npcid, npcid, pause1, pause2)
	wait(1)
	rem:FireServer(npcid)
end)
