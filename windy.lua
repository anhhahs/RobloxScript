NextPageCursor = "5300_1_7d0fb7c365fedccb884f5b83da8bbd63"
PreviousPageCursor = "5400_1_bcb11fff6a9f97d8251e43d03b7b76a9
repeat wait(1) until game:IsLoaded()
wait(1)
for i, v in pairs(game.Workspace.Honeycombs:GetChildren()) do
	if v.Owner.Value == nil then
		ID = v.HiveID.Value
		game.ReplicatedStorage.Events.ClaimHive:FireServer(ID)
	end
end
if not isfile("checking.txt") then
	writefile("checking.txt", "")
end
spawn(function()
wait(3)
for i=1, 1 do
for _,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("BillboardGui")) then
v:ClearAllChildren()
end
end
end
for i=1, 1 do
for _,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("BillboardGui")) then
v:ClearAllChildren()
end
end
end
end)

game:GetService('RunService').Stepped:connect(function()
	if noclip then	
		if game.Players.LocalPlayer.Character.Humanoid then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end
end)

collect = false
spawn(function()
while wait() do
pcall(function()
	if collect then
		for k,v in pairs(workspace.Collectibles:GetChildren()) do
			if v.Transparency < 0.5 and tonumber((v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude)<80 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
				wait(.03)
			end
		end
	end
end)
end
end)

collectfull = false
spawn(function()
while wait() do
pcall(function()
	if collect then
		for k,v in pairs(workspace.Collectibles:GetChildren()) do
			if v.Transparency < 0.5 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
				wait(.03)
			end
		end
	end
end)
end
end)

spawn(function()
while wait() do
pcall(function()
	for k,v in pairs(workspace.Collectibles:GetChildren()) do
		if v.Transparency < 0.5 and v:FindFirstChildOfClass("Decal") and v.Decal.Texture == "rbxassetid://1674871631" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
			wait(.03)
		end
	end
end)
end
end)


spawn(function()
while wait(.25) do
	temp1 = 0
    pcall(function()
	for i,v in pairs(workspace.NPCBees:GetChildren()) do
		if v.Name == "Windy" then
			temp1 = temp1 + 1
		end
	end
	print(temp1)
	end)
end
end)

nextserver = false
while wait(1) do
pcall(function()
    --[[hihi = ""
	if temp1 ~= 0 then
		for i,v in pairs(workspace.NPCBees:GetChildren()) do
			if v.Name == "Windy" then		
			hihi = hihi.."vicious "
				while v and v.Position.x < 540 do
					for i,v in pairs(workspace.Monsters:GetChildren()) do
						if string.match(v.Name, "Windy") then
							windylevel = v.Name
							if v.Name ~= windylevel then
								noclip = false
								wait(5)
								farmtokens()
								farmtokens()
								windylevel = v.Name
							end
						end
					end
					wait(.1)
				end
			end
		end
	end]]--
	nextserver = true
	local http = game:GetService("HttpService")
	temp = false
	while temp == false and wait(.1) and temp1 == 0 and nextserver do
		pcall(function()
		if NextPageCursor == nil then
			server = http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
		elseif NextPageCursor ~= nil then
			server = http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..NextPageCursor))
		end
		v = server.data[(Random.new():NextInteger(1, 100))]
		if tostring(server.nextPageCursor) ~= "nil" then 
		   print(server.nextPageCursor)
		  PreviousPageCursor = NextPageCursor
		NextPageCursor = server.nextPageCursor
		    
			if v.playing ~= v.maxPlayers then
			temp = true
			end
			if temp == true and v.playing ~= v.maxPlayers then
			    if hihi ~= "" then
			        --appendfile("visited.txt", hihi.."\t"..v.id.."\n")
			    else
			        --appendfile("visited.txt", "nothing".."\t"..v.id.."\n")
			 end
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
				wait(3)
			end
		else NextPageCursor = PreviousPageCursor
		end
		end)
	end
end)
end
vici
