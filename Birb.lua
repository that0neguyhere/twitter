game.StarterGui:SetCore("SendNotification",  {
	Title = "Smug Notification";
	Text = "DRIPPERS!1!!1!#6196";
	Icon = "rbxthumb://type=Asset&id=9945382118&w=150&h=150"})

local character = game.Players.LocalPlayer.Character
local sus = character.TwitterBird --name
local handle =  sus.Handle
local weld=handle.AccessoryWeld
weld.C1=CFrame.new(0,0.9,-1.5)

loadstring(game:HttpGet("https://raw.githubusercontent.com/rouxhaver/random-sh-t/main/4eye's%20net-libary%20auto%20applier.lua"))()

--[[
	patchma hub by MyWorld
	legends never die
	unless they get patched

	-gh 13421786478,13421911402,13421828828,13421768871,13415165827,253151806
]]

--findfirstchildofclass faster than getservice
local plrs=game:FindFirstChildOfClass("Players")
local rs=game:FindFirstChildOfClass("RunService")
local ws=game:FindFirstChildOfClass("Workspace")
local uis=game:FindFirstChildOfClass("UserInputService")
local gs=game:FindFirstChildOfClass("GuiService")
local cg=game:FindFirstChildOfClass("CoreGui")

local lp=plrs.LocalPlayer
local pg=lp:FindFirstChildOfClass("PlayerGui")
local mouse=lp:GetMouse()
local stepped=rs.Stepped
local heartbeat=rs.Heartbeat
local renderstepped=rs.RenderStepped

local osclock=os.clock
local tspawn=task.spawn
local twait=task.wait
local schar=string.char
local sbyte=string.byte
local ssub=string.sub
local sfind=string.find
local supper=string.upper
local mrandom=math.random
local clamp=math.clamp
local sin=math.sin
local abs=math.abs
local rad=math.rad
local tinsert=table.insert
local tfind=table.find
local tunpack=table.unpack

local i=Instance.new 
local v2=Vector2.new 
local v3=Vector3.new
local c3=Color3.new 
local cf=CFrame.new
local angles=CFrame.Angles
local u2=UDim2.new
local e=Enum 
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 

local sine=osclock()
local deltaTime=0
local v3_0=v3(0,0,0)
local v3_101=v3(1,0,1)
local v3_010=v3(0,1,0)
local v3_001=v3(0,0,1)
local cf_0=cf(0,0,0)
local v3_xz=v3_101*10
local v3_net=v3_010*25.01

local function makepcall(f)
	if type(f)=="function" then
		return function(...)
			local a={...}
			local r=nil
			pcall(function()
				r={f(tunpack(a))}
			end)
			return tunpack(r or {})
		end
	end
	return function() end
end
local function rs(l) 
	l=l or mrandom(8,15) 
	local s="" 
	for i=1,l do 
		if mrandom(1,2)==1 then 
			s=s..schar(mrandom(65,90)) 
		else 
			s=s..schar(mrandom(97,122)) 
		end 
	end 
	return s 
end 
local function gp(p,n,cl)
	if typeof(p)=="Instance" then
		local c=p:GetChildren()
		for i=1,#c do
			local v=c[i]
			if (v.Name==n) and v:IsA(cl) then
				return v
			end
		end
	end
	return nil
end
local function loopgp(...)
	while true do
		local r=gp(...)
		if r then
			return r
		end
		twait()
	end
end
local function timegp(p,n,c,t)
	t=osclock()+t
	while t>osclock() do
		local r=gp(p,n,c)
		if r then
			return r
		end
		twait()
	end
	return nil
end
local function getNetlessVelocity(realVel)
	--if true then return v3_0 end
	--if true then return realPartVelocity end
	--if true then return v3_net end
	if realVel.Magnitude>25.01 then
		realVel=realVel.Unit*25.01
	end
	return realVel*v3_xz+v3_net
end
local isClientInstance=makepcall(function(i)
	return ssub(i:GetDebugId(),1,1)=="0"
end)
local isServerInstance=function(i)
	return not isClientInstance(i)
end

--[[local i1=i("Frame") 
local i2=i("Frame") 
local i3=i("ScrollingFrame") 
local i4=i("UIListLayout") 
local i5=i("UIGradient") 
local i6=i("TextLabel") 
local i7=i("TextButton") 
local i8=i("UIGradient") 
local i9=i("ScreenGui") 
i1.Active=true 
i1.AnchorPoint=v2(0.5,0) 
i1.BackgroundColor3=c3(1,1,1) 
i1.BorderSizePixel=0 
i1.Draggable=true 
i1.Position=u2(0.5,0,0.5,-150) 
i1.Selectable=true 
i1.Size=u2(0,200,0,300) 
i1.Name=rs() 
--i1.Parent=i9 
i2.BackgroundColor3=c3(1,1,1) 
i2.BorderSizePixel=0 
i2.Position=u2(0,5,0,20) 
i2.Size=u2(1,-10,1,-25) 
i2.Name=rs() 
--i2.Parent=i1 
i3.Active=true 
i3.BackgroundTransparency=1 
i3.BorderSizePixel=0 
i3.Size=u2(1,-3,1,0) 
i3.AutomaticCanvasSize=e.AutomaticSize.Y 
i3.CanvasSize=u2(0,0,0,0) 
i3.ScrollBarThickness=7 
i3.Name=rs() 
--i3.Parent=i2 
i4.Name=rs() 
--i4.Parent=i3 
i4.SortOrder=e.SortOrder.LayoutOrder 
i5.Name=rs() 
--i5.Parent=i2 
i5.Color=cs({[1]=csk(0,c3(0.121569,0.121569,0.121569)),[2]=csk(1,c3(0.0705882,0.0705882,0.0705882))}) 
i5.Rotation=90 
i6.Font=e.Font.SourceSans 
i6.FontSize=e.FontSize.Size18 
i6.Text="patchma hub" 
i6.TextColor3=c3(0,0,1) 
i6.TextSize=16 
i6.BackgroundTransparency=1 
i6.BorderSizePixel=0 
i6.Position=u2(0,1,0,1) 
i6.Size=u2(1,-2,0,20) 
i6.Name=rs() 
--i6.Parent=i1 
i7.AnchorPoint=v2(1,0) 
i7.BackgroundTransparency=1 
i7.Position=u2(1,0,0,0) 
i7.Size=u2(0,40,1,0) 
i7.Name=rs() 
--i7.Parent=i6 
i7.Font=e.Font.SourceSans 
i7.FontSize=e.FontSize.Size18 
i7.Text="-" 
i7.TextColor3=c3(1,1,1) 
i7.TextSize=16 
i8.Name=rs() 
--i8.Parent=i1 
i8.Color=cs({[1]=csk(0,c3(0,0,0)),[2]=csk(1,c3(0,0,0.584314))}) 
i8.Rotation=90 
i9.ZIndexBehavior=e.ZIndexBehavior.Sibling 
i9.IgnoreGuiInset=true 
i9.ResetOnSpawn=false 
i9.Name=rs() 
local min=false
i7.MouseButton1Click:Connect(function()
	min = not min
	if min then
		i2.Visible=false 
		i1.Size=u2(0,200,0,22) 
	else
		i1.Size=u2(0,200,0,300) 
		i2.Visible=true 
	end
end)
local function btn(txt, f)
	local i1=i("TextButton") 
	i1.AutomaticSize=e.AutomaticSize.Y 
	i1.BackgroundTransparency=1 
	i1.Size=u2(1,0,0,0) 
	i1.Name=rs() 
	i1.Font=e.Font.SourceSans 
	i1.FontSize=e.FontSize.Size14 
	i1.Text=txt 
	i1.TextColor3=c3(0.0941177,0.317647,0.878431) 
	if f then 
		i1.MouseButton1Click:Connect(f) 
	end 
	i1.Parent=i3 
	return i3
end
local function lbl(txt)
	local i1=i("TextLabel") 
	i1.Font=e.Font.SourceSans 
	i1.FontSize=e.FontSize.Size14 
	i1.Text=txt 
	i1.TextColor3=c3(0.560784,0.560784,0.560784) 
	i1.AutomaticSize=e.AutomaticSize.Y 
	i1.BackgroundTransparency=1 
	i1.Size=u2(1,0,0,0) 
	i1.Name=rs() 
	i1.Parent=i3 
	return i1
end

lbl("by MyWorld")
lbl("low effort ui obviously")--]]

local flingmode=2
local allowshiftlock=true
local ctrltp=true
local discharscripts=true
local removebparts=false

local function reanimate()
	--[[
	    FDless reanimate by MyWorld
	    aka no client sided instances
	    damn this shit is op for its times
	    "what else do i optimize here"
	]]

	local reclaim = false --if you lost control over a part this will move your primary part to the part so you get it back
	local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them
	local antiragdoll = true --removes instances that are usually used for ragdolling form your character
	local addPartsOnRun = false --allows u to add more parts and joints to the simulation after it started
	local discharscripts = discharscripts --disables all localScripts parented to your character before reanimation
	local removebparts = removebparts --removes the parts that you cannot control in your character by making them fall to void
	local R15toR6 = true --adds fake r6 parts and joints for animations if your character is r15
	local walkSpeed = 20 --your walkspeed (can be changed at runtime)
	local jumpPower = 50 --your jump power (can be changed at runtime)
	local allowshiftlock = allowshiftlock --allows the user to use shiftlock (can be changed at runtime)
	local gravity = 196.2 --how fast the characters velocity increases while falling (can be changed at runtime)
	local simrad = 1000 --sets simulation radius to this with sethiddenproperty (nil to disable)
    local loadtime = plrs.RespawnTime --anti-respawn delay
	--the fling function
	--usage: fling(target, duration, velocity)
	--target can be set to: basePart, CFrame, Vector3, character model or humanoid (flings at mouse.Hit if argument not provided)
	--duration (fling time in seconds) can be set to a number or a string convertable to a number (0.5s if not provided)
	--velocity (fling part rotation velocity) can be set to a vector3 value (uses defaultflingvel if not provided)
	local defaultflingvel=v3(20000,20000,20000) --this is the velocity used for flinging if its not provided to the fling function
	local ctrlclicktp = ctrltp --makes you teleport where u point ur mouse cursor at when click and hold ctrl down
	local clickfling = flingmode --click fling mode
	--false - click fling disabled
	--0 - click fling without prediction
	--1 - with prediction if pointing at a character, otherwise not flinging
	--2 - with prediction if pointing at a character, otherwise no prediction
	local maxflingtrsp = 1 --max transparency of the fling part (if its above this it will be set to this)

	local c=lp.Character
	if not c then return end
	if not c:IsDescendantOf(ws) then return end
	local c1=c
	c.AncestryChanged:Connect(function()
		if c1 then
			if c1:IsDescendantOf(ws) then
				c=c1
			else
				c=nil
			end
		end
	end)

	local hum=c:FindFirstChildOfClass("Humanoid")
	local rootpart=gp(c,"HumanoidRootPart","BasePart") or gp(c,"Torso","BasePart") or gp(c,"UpperTorso","BasePart") or (hum and hum.RootPart) or timegp(c,"HumanoidRootPart","BasePart",0.5) or c:FindFirstChildWhichIsA("BasePart")
	if not rootpart then return end

	reclaim=reclaim and (c.PrimaryPart or rootpart)
	R15toR6=R15toR6 and hum and (hum.RigType==e.HumanoidRigType.R15)
	local shp=getfenv().sethiddenproperty
	simrad=shp and tonumber(simrad)

	local flingparts={}
	local children=c:GetChildren()
	for i=1,#children do
		local v=children[i]
		if v:IsA("Tool") then
			local des=v:GetDescendants()
			for i=1,#des do
				local v=des[i]
				if v:IsA("BasePart") and isServerInstance(v) then
					tinsert(flingparts,v)
				end
			end
		end
	end
	local cam=nil
	--theres a way to have ws.currentcamera nil on heartbeat and still have the game run normally
	local function refcam()
		cam=ws.CurrentCamera
		while not cam do
			ws:GetPropertyChangedSignal("CurrentCamera"):Wait()
			cam=ws.CurrentCamera
		end
	end
	refcam()
	local camcf=cam.CFrame
	if not c then return end
	lp.Character=nil
	lp.Character=c
	renderstepped:Once(function()
		refcam()
		cam.CFrame=camcf
	end)
	twait(loadtime)
	refcam()
	if not c then return end

	camcf=cam.CFrame
	local enumCamS=e.CameraType.Scriptable
	local camt=cam.CameraType
	local camcon0=nil
	local camcon1=nil
	local function onnewcamera()
		refcam()
		if camcon0 then 
			camcon0:Disconnect()
			camcon0=nil
		end
		if not c then 
			if cam.CameraType==enumCamS then
				cam.CameraType=camt
			end
			return camcon1:Disconnect() 
		end
		camcon0=cam.Changed:Connect(function(p)
			if not c then
				camcon0:Disconnect()
				return camcon1:Disconnect()
			end
			if (p=="CFrame") and (cam.CFrame~=camcf) then
				cam.CFrame=camcf
			elseif (p=="CameraSubject") or (p=="CameraType") then
				local subj=cam.CameraSubject
				if subj and subj:IsA("Humanoid") and (subj.Parent==c) and (cam.CameraType~=enumCamS) then
					cam.CameraType = enumCamS
				end
			end
		end)
		local subj=cam.CameraSubject
		if subj and subj:IsA("Humanoid") and (subj.Parent==c) and (cam.CameraType~=enumCamS) then
			cam.CameraType=enumCamS
		end
		cam.CFrame=camcf
	end
	camcon1=ws:GetPropertyChangedSignal("CurrentCamera"):Connect(onnewcamera)
	onnewcamera()

	local fpdh=ws.FallenPartsDestroyHeight
	novoid=novoid and (fpdh+1)

	local cfr=rootpart.CFrame
	if removebparts then
		removebparts=cfr
		cfr=(cfr-cfr.Position)+v3(mrandom(-10,10)*100000,fpdh+500,mrandom(-10,10)*100000)
	end
	local con=heartbeat:Connect(function()
		if (not rootpart.Anchored) and (rootpart.ReceiveAge==0) then
			local off=v3_010*sin(osclock()*32)
			rootpart.CFrame=cfr+off
			rootpart.Velocity=v3_010*25.1
			rootpart.RotVelocity=off
		end
	end)
	twait(0.5)
	con:Disconnect()

	if not c then
		onnewcamera()
		return 
	end

	if discharscripts then
		local chi=c:GetChildren()
		for i=1,#chi do
			local v=chi[i]
			if v:IsA("LocalScript") then
				v.Disabled=true
			end
		end
	end

	local joints={}
	local cframes={}
	local lastpositions={}
	local function ondes(v)
		if antiragdoll and v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then
			v:Destroy()
		elseif addPartsOnRun then
			if v:IsA("JointInstance") then
				tinsert(joints,{
					Name=v.Name,
					C0=v.C0,
					C1=v.C1,
					Part0=v.Part0,
					Part1=v.Part1
				})
				v:Destroy()
			elseif v:IsA("BasePart") then
				if isClientInstance(v) then
					v={CFrame=v.CFrame,Name=v.Name,Anchored=true}
				end
				cframes[v]=v.CFrame
				lastpositions[v]=v.Position
			end
		end
	end
	if addPartsOnRun then
		local des=c:GetDescendants()
		for i=1,#des do
			ondes(des[i])
		end
		c.DescendantAdded:Connect(ondes)
	else
		addPartsOnRun = true
		local des=c:GetDescendants()
		for i=1,#des do
			ondes(des[i])
		end
		addPartsOnRun = false
		c.DescendantAdded:Connect(ondes)
	end

	if removebparts then
		cfr=removebparts
	end
	local pos=cfr.Position
	local shiftlock=false
	local firstperson=false
	local xzvel=v3_0
	local Yvel=0
	local v3_0150=v3_010*1.5
	local camoff=cf(v3_0,camcf.LookVector)
	camoff=camoff-v3_001*(camcf.Position-(pos+v3_0150)).Magnitude

	local refreshjoints=nil
	refreshjoints=function(part,refreshed)
		if not part then return end
		refreshed=refreshed or {}
		tinsert(refreshed,part)
		for i,v in pairs(joints) do
			local part0=v.Part0
			local part1=v.Part1
			if part1 and (part0==part) then
				cframes[part1]=cframes[part]*v.C0*v.C1:Inverse()
				if not tfind(refreshed,part1) then
					refreshjoints(part1,refreshed)
				end
			elseif part0 and (part1==part) then
				cframes[part0]=cframes[part]*v.C1*v.C0:Inverse()
				if not tfind(refreshed,part0) then
					refreshjoints(part0,refreshed)
				end
			end
		end
	end

	if R15toR6 then
		local R6parts={ 
			head={Name="Head",Anchored=true},
			torso={Name="Torso",Anchored=true},
			root={Name="HumanoidRootPart",Anchored=true},
			leftArm={Name="Left Arm",Anchored=true},
			rightArm={Name="Right Arm",Anchored=true},
			leftLeg={Name="Left Leg",Anchored=true},
			rightLeg={Name="Right Leg",Anchored=true}
		}
		for i,v in pairs(R6parts) do
			cframes[v]=cfr
		end
		tinsert(joints,{
			Name="Neck",
			Part0=R6parts.torso,Part1=R6parts.head,
			C0=cf(0,1,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
		})
		tinsert(joints,{
			Name="RootJoint",
			Part0=R6parts.root,Part1=R6parts.torso,
			C0=cf(0,0,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,0,0,-1,0,0,0,0,1,0,1,-0)
		})
		tinsert(joints,{
			Name="Right Shoulder",
			Part0=R6parts.torso,Part1=R6parts.rightArm,
			C0=cf(1,0.5,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
		})
		tinsert(joints,{
			Name="Left Shoulder",
			Part0=R6parts.torso,Part1=R6parts.leftArm,
			C0=cf(-1,0.5,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
		})
		tinsert(joints,{
			Name="Right Hip",
			Part0=R6parts.torso,Part1=R6parts.rightLeg,
			C0=cf(1,-1,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
		})
		tinsert(joints,{
			Name="Left Hip" ,
			Part0=R6parts.torso,Part1=R6parts.leftLeg,
			C0=cf(-1,-1,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
		})
		tinsert(joints,{
			Part0=R6parts.root,Part1=rootpart,
			C0=cf_0,C1=cf_0
		})
		refreshjoints(rootpart)
		local function getpart(n)
			for i,_ in pairs(cframes) do
				if (i.Name==n) and (type(i)~="table") then
					return i
				end
			end
			return nil
		end
		local function makejoint(p0, p1, p2)
			p1=getpart(p1)
			p2=getpart(p2)
			if not (p1 and p2) then return end
			for i,v in pairs(joints) do
				if (v.Part0==p1) and (v.Part1==p2) then
					joints[i]=nil
				elseif (v.Part0==p2) and (v.Part1==p1) then
					joints[i]=nil
				end
			end
			tinsert(joints,{
				Part0=p0,Part1=p1,
				C0=cf_0,
				C1=cframes[p1]:Inverse()*cframes[p0]
			})
		end
		makejoint(R6parts.head,"Head","UpperTorso")
		makejoint(R6parts.leftArm,"LeftUpperArm","UpperTorso")
		makejoint(R6parts.rightArm,"RightUpperArm","UpperTorso")
		makejoint(R6parts.leftLeg,"LeftUpperLeg","LowerTorso")
		makejoint(R6parts.rightLeg,"RightUpperLeg","LowerTorso")
		makejoint(R6parts.torso,"LowerTorso","HumanoidRootPart")
	end

	local function getPart(name,blacklist)
		for i,v in pairs(cframes) do
			if (i.Name==name) and not (blacklist and tfind(blacklist,i)) then
				return i
			end
		end
		return nil
	end

	local function getPartFromMesh(meshid,textureid,blacklist)
		for v,_ in pairs(cframes) do
			if (type(v)~="table") and not (blacklist and tfind(blacklist,v)) then
				if v:IsA("MeshPart") and sfind(v.MeshId,meshid) and sfind(v.TextureID,textureid) then 
					return v
				else
					local m=v:FindFirstChildOfClass("SpecialMesh")
					if m and sfind(m.MeshId,meshid) and sfind(m.TextureId,textureid) then
						return v
					end
				end
			end
		end
		return nil
	end

	local function getJoint(name)
		for i,v in pairs(joints) do
			if v.Name==name then
				return v
			end
		end
		return {C0=cf_0,C1=cf_0}
	end

	local function getPartJoint(handle)
		for i,v in pairs(joints) do
			if v.Part0==handle then
				return v
			end
		end
		for i,v in pairs(joints) do
			if v.Part1==handle then
				return v
			end
		end
		return nil
	end


	local accessorylimbs={
		{meshid="13421774668",textureid="13415110780",C0=cf_0,Name="Torso"},
		{meshid="13421705040",textureid="13415112383",C0=angles(rad(116),rad(4),rad(22)),Name="Left Arm"},
		{meshid="13415096670",textureid="13415112383",C0=angles(rad(112),rad(-13.5),rad(-22)),Name="Right Arm"},
		{meshid="13421798868",textureid="13415112383",C0=angles(rad(47.5),rad(40),rad(24.5)),Name="Left Leg"},
		{meshid="13421836805",textureid="13415112383",C0=angles(rad(56),rad(-22),rad(-20.75)),Name="Right Leg"}
	}

	for i=1,#accessorylimbs do
		local v=accessorylimbs[i]
		local p=getPart(v.Name)
		local h=getPartFromMesh(v.meshid,v.textureid)
		local w=getPartJoint(h)
		if p and w then
			w.C0=v.C0
			w.Part0=h
			w.C1=cf_0
			w.Part1=p
		end
	end

	local raycastparams=RaycastParams.new()
	raycastparams.FilterType=e.RaycastFilterType.Blacklist
	raycastparams.RespectCanCollide=true
	local rayfilter={}
	local characters={}
	local function refreshrayfilter()
		for i=1,#rayfilter do
			rayfilter[i]=nil
		end
		local len=0
		for i,v in pairs(characters) do
			len=len+1
			rayfilter[len]=v
		end
		raycastparams.FilterDescendantsInstances=rayfilter
	end


	local function onplayer(v)
		characters[v]=v.Character
		v:GetPropertyChangedSignal("Character"):Connect(function()
			characters[v]=v.Character
			refreshrayfilter()
		end)
		refreshrayfilter()
	end

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Badge Awarded";
	Text = "You won Awesomeboy74001's ''Birb.'' award!";
	Icon = "rbxthumb://type=Asset&id=8994600311&w=150&h=150"})

	local plrst=plrs:GetPlayers()
	for i=1,#plrst do onplayer(plrst[i]) end
	plrs.PlayerAdded:Connect(onplayer)
	plrs.PlayerRemoving:Connect(function(v)
		characters[v]=nil
	end)

	local mradN05=rad(-0.5)
	local enumMLC=e.MouseBehavior.LockCenter
	local enumMB2=e.UserInputType.MouseButton2
	local enumMLCP=e.MouseBehavior.LockCurrentPosition
	local enumMD=e.MouseBehavior.Default
	local enumMW=e.UserInputType.MouseWheel

	local mode="default"
	local modes={default={}}
	local function addmode(key,mode)
		if (type(key)~="string") or (type(mode)~="table") then
			return
		end
		for i, v in pairs(mode) do
			if type(v)~="function" then
				mode[i]=nil
			end
		end
		if key=="default" then
			modes.default=mode
			if mode.modeEntered then
				mode.modeEntered()
			end
		elseif #key==1 then
			key=e.KeyCode[supper(ssub(key,1,1))]
			modes[key]=mode
		end
	end

	local keyW=e.KeyCode.W
	local keyA=e.KeyCode.A
	local keyS=e.KeyCode.S
	local keyD=e.KeyCode.D
	local keySpace=e.KeyCode.Space
	local keyShift=e.KeyCode.LeftShift
	local movementkeys = {
		[keyW]=false,
		[keyA]=false,
		[keyS]=false,
		[keyD]=false,
		[keySpace]=false
	}
	uis.InputBegan:Connect(function(a)
		if gs.MenuIsOpen or uis:GetFocusedTextBox() then
			return
		end
		a=a.KeyCode
		if movementkeys[a]==false then
			movementkeys[a]=true
		elseif a==keyShift then
			shiftlock=allowshiftlock and not shiftlock
		elseif modes[a] then
			if modes[mode].modeLeft then
				modes[mode].modeLeft()
			end
			if mode==a then
				mode="default"
			else
				mode=a
			end
			if modes[mode].modeEntered then
				modes[mode].modeEntered()
			end
		end
	end)
	uis.InputEnded:Connect(function(a)
		if movementkeys[a.KeyCode] then
			movementkeys[a.KeyCode]=false
		end
	end)
	uis.InputChanged:Connect(function(a,b)
		if (not b) and (a.UserInputType==enumMW) then
			camoff=camoff+a.Position*v3_001*(0.75-camoff.Z/4)
			if camoff.Z>0 then
				camoff=camoff-camoff.Position
			end
			firstperson=camoff.Z==0
		end
	end)

	local lostPart=nil
	local flingcf=nil
	local flingvel=nil
	local flingid=0
	local currentflingpart=nil
	local function fling(target,duration,rotVelocity)
		currentflingpart=nil
		for i,v in pairs(flingparts) do
			if v and (not v.Anchored) and v:IsDescendantOf(ws) and (v.ReceiveAge == 0) then
				currentflingpart=v
				break
			end
		end
		if not currentflingpart then 
			return twait() and false
		end
		if typeof(target)=="Instance" then
			if target:IsA("BasePart") then
				target=target.Position
			elseif target:IsA("Model") then
				target=gp(target,"HumanoidRootPart","BasePart") or gp(target,"Torso","BasePart") or gp(target,"UpperTorso","BasePart") or target:FindFirstChildWhichIsA("BasePart")
				if target then
					target=target.Position
				else
					return twait() and false
				end
			elseif target:IsA("Humanoid") then
				target=target.Parent
				if not (target and target:IsA("Model")) then
					return twait() and false
				end
				target=gp(target,"HumanoidRootPart","BasePart") or gp(target,"Torso","BasePart") or gp(target,"UpperTorso","BasePart") or target:FindFirstChildWhichIsA("BasePart")
				if target then
					target=target.Position
				else
					return twait() and false
				end
			else
				return twait() and false
			end
		elseif typeof(target)=="CFrame" then
			target=target.Position
		elseif typeof(target)~="Vector3" then
			target=mouse.Hit
			if target then
				target=target.Position
			else
				return twait() and false
			end
		end
		if type(duration)~="number" then
			duration=tonumber(duration) or 0.5
		end
		if typeof(rotVelocity)~="Vector3" then
			rotVelocity=defaultflingvel
		end
		if (type(maxflingtrsp)=="number") and (currentflingpart.Transparency>maxflingtrsp) then
			currentflingpart.Transparency=maxflingtrsp
		end
		flingcf=cf(target)
		flingvel=rotVelocity
		flingid=flingid+1
		local thisfling=flingid
		twait(duration)
		if flingid==thisfling then
			flingcf=nil
			currentflingpart=nil
		end
		return true
	end

	local pflingid=0
	local function predictionfling(target,duration,rotVelocity,stopOnVelMag)
		if typeof(target)~="Instance" then 
			target=mouse.Target
			if not target then
				return twait() and false
			end
		end
		if target:IsA("Humanoid") or target:IsA("BasePart") then 
			target=target.Parent 
			if target:IsA("Accessory") then
				target=target.Parent
			end
		end
		if (not target:IsA("Model")) or (target==c) then
			return twait() and false
		end
		target=gp(target,"HumanoidRootPart","BasePart") or gp(target,"Torso","BasePart") or gp(target,"UpperTorso","BasePart")
		if not (target and target:IsDescendantOf(ws)) then
			return twait() and false
		end
		if stopOnVelMag then
			duration=tonumber(duration) or 5
			stopOnVelMag=tonumber(stopOnVelMag) or 1000
		elseif type(stopOnVelMag)=="boolean" then
			duration=tonumber(duration) or 1
			stopOnVelMag=nil
		else 
			duration=tonumber(duration) or 5
			stopOnVelMag=1000
		end
		local stopTime=sine+duration
		pflingid=pflingid+1
		local thisfling=pflingid
		local con=nil
		con=heartbeat:Connect(function(deltaTime)
			if (thisfling~=pflingid) or (sine>stopTime) or (stopOnVelMag and (target.Velocity.Magnitude>stopOnVelMag)) or (not (target and target:IsDescendantOf(ws))) then
				return con:Disconnect()
			end
			fling(target.Position+target.Velocity*(sin(sine*15)+1),0,rotVelocity)
		end)
		twait()
		return true
	end

	if ctrlclicktp then
		ctrlclicktp=e.KeyCode.LeftControl
		local tpoff=v3_010*3
		if clickfling==0 then
			mouse.Button1Down:Connect(function()
				if uis:IsKeyDown(ctrlclicktp) then
					if mouse.Target then
						pos=mouse.Hit.Position+tpoff
						cfr=cf(pos,pos+camoff.LookVector*v3_101)
						xzvel=v3_0
						Yvel=0
					end
				else
					fling()
				end
			end)
		elseif clickfling==1 then
			mouse.Button1Down:Connect(function()
				if uis:IsKeyDown(ctrlclicktp) then
					if mouse.Target then
						pos=mouse.Hit.Position+tpoff
						cfr=cf(pos,pos+camoff.LookVector*v3_101)
						xzvel=v3_0
						Yvel=0
					end
				else
					predictionfling()
				end
			end)
		elseif clickfling == 2 then
			mouse.Button1Down:Connect(function()
				if uis:IsKeyDown(ctrlclicktp) then
					if mouse.Target then
						pos=mouse.Hit.Position+tpoff
						cfr=cf(pos,pos+camoff.LookVector*v3_101)
						xzvel=v3_0
						Yvel=0
					end
				elseif not predictionfling() then
					fling()
				end
			end)
		else
			mouse.Button1Down:Connect(function()
				if mouse.Target and uis:IsKeyDown(ctrlclicktp) then
					pos=mouse.Hit.Position+tpoff
					cfr=cf(pos,pos+camoff.LookVector*v3_101)
					xzvel=v3_0
					Yvel=0
				end
			end)
		end
	else
		if clickfling==0 then
			mouse.Button1Down:Connect(fling)
		elseif clickfling==1 then
			mouse.Button1Down:Connect(predictionfling)
		elseif clickfling==2 then
			mouse.Button1Down:Connect(function()
				if not predictionfling() then fling() end
			end)
		end
	end

	local noYvelTime=1
	local lastsine=sine
	local pose=nil
	local con=nil
	local function mainFunction()
		if not c then 
			uis.MouseBehavior=enumMD
			onnewcamera()
			local c=lp.Character
			if c then
				cam.CameraSubject=c:FindFirstChildOfClass("Humanoid")
			end
			return con and con:Disconnect() 
		end

		sine=osclock()
		local delta=sine-lastsine
		deltaTime=clamp(delta*10,0,1)
		lastsine=sine

		if shiftlock then
			if allowshiftlock then
				uis.MouseBehavior=enumMLC
				local rotation=uis:GetMouseDelta()*mradN05
				camoff=cf(camoff.Position,camoff.Position+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
			else
				shiftlock=false
			end
		elseif firstperson then
			uis.MouseBehavior=enumMLC
			local rotation=uis:GetMouseDelta()*mradN05
			camoff=cf(camoff.Position,camoff.Position+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		elseif uis:IsMouseButtonPressed(enumMB2) then
			uis.MouseBehavior=enumMLCP
			local rotation=uis:GetMouseDelta()*mradN05
			camoff=cf(camoff.Position,camoff.Position+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		else
			uis.MouseBehavior=enumMD
		end

		local raycastresult=ws:Raycast(pos,v3_010*fpdh-pos,raycastparams)
		local onground=nil
		if raycastresult then
			raycastresult=raycastresult.Position
			onground=(pos.Y-raycastresult.Y)<3.01
			if onground then
				Yvel=0
				cfr=cfr+v3_010*(raycastresult.Y+3-pos.Y)*clamp(delta*20,0,1)
				if movementkeys[keySpace] then
					Yvel=jumpPower
				end
			else
				Yvel=Yvel-gravity*delta
				if pos.Y+Yvel*delta<raycastresult.Y then
					Yvel=0
					cfr=cfr+v3_010*(raycastresult.Y+3-pos.Y)
				end
			end
		else
			Yvel=0
			onground=false
		end
		xzvel=v3_0
		if movementkeys[keyW] then
			xzvel=xzvel+(camoff.LookVector*v3_101).Unit
		end
		if movementkeys[keyS] then
			xzvel=xzvel-(camoff.LookVector*v3_101).Unit
		end
		if movementkeys[keyA] then
			xzvel=xzvel-(camoff.RightVector*v3_101).Unit
		end
		if movementkeys[keyD] then
			xzvel=xzvel+(camoff.RightVector*v3_101).Unit
		end
		pos=cfr.Position
		if shiftlock or firstperson then
			if xzvel.Magnitude>0 then
				xzvel=xzvel.Unit*walkSpeed
			end
			cfr=cf(pos,pos+camoff.LookVector*v3_101)
		elseif xzvel.Magnitude>0 then
			xzvel=xzvel.Unit*walkSpeed
			cfr=cfr:Lerp(cf(pos,pos+xzvel),deltaTime)
		end
		cfr=cfr+(xzvel+(v3_010*Yvel))*delta
		pos=cfr.Position

		camcf=cf(pos,pos+camoff.LookVector)+camoff.LookVector*camoff.Z+v3_0150
		if shiftlock and not firstperson then
			camcf=camcf+camcf.RightVector*1.75
		end
		if cam then
			cam.CFrame=camcf
		end

		if onground then
			if xzvel==v3_0 then
				pose="idle"
			else
				pose="walk"
			end
		elseif Yvel>0 then
			pose="jump"
		else
			pose="fall"
		end
		local lerpfunc=modes[mode][pose]
		lerpfunc=lerpfunc or modes.default[pose]
		if lerpfunc then
			lerpfunc()
		end

		cframes[rootpart]=cfr
		refreshjoints(rootpart)

		if abs(Yvel)>1 then
			noYvelTime=0
		else
			noYvelTime=clamp(noYvelTime+delta*0.3,0,1)
			xzvel=xzvel*(1-noYvelTime)
		end

		local idleoff=v3(sin((sine-0.01875)*32),sin(sine*32),sin((sine+0.0375)*32))*0.001		
		local idlerv=v3_010*sin(sine*32)

		for i,v in pairs(cframes) do
			if (not i.Anchored) and i:IsDescendantOf(ws) then
				if i.ReceiveAge==0 then
					if (i==currentflingpart) and flingcf then
						flingcf=flingcf*angles(0,flingvel.Unit.Y*-deltaTime,0)
						v=flingcf
						i.RotVelocity=flingvel+idlerv
					else
						i.RotVelocity=idlerv
					end
					local vel=(v.Position-lastpositions[i])/delta
					lastpositions[i]=v.Position
					if vel.Magnitude<0.15 then
						v=v+idleoff
					end
					if (i==reclaim) and lostPart then
						v=lostPart.CFrame
						lostPart=nil
						i.Velocity=v3_0
					else
						i.Velocity=getNetlessVelocity(vel*noYvelTime+xzvel)
					end
					if novoid and (v.Y<novoid) then
						v=v+v3_010*(novoid-v.Y)
					end
					i.CFrame=v
				else
					lastpositions[i]=i.Position
					if reclaim and (i~=reclaim) then
						lostPart=i
					end
				end
			end
		end
		if simrad then
			shp(lp,"SimulationRadius",simrad)
		end
	end

	con=heartbeat:Connect(mainFunction)
	mainFunction()

	local legcfR=cf(1,-1,0)
	local legcfL=cf(-1,-1,0)
	local raydir=v3_010*-2
	local function raycastlegs() --this returns 2 values: right leg raycast offset, left leg raycast offset
		local rY=ws:Raycast((cfr*legcfR).Position,raydir,raycastparams)
		local lY=ws:Raycast((cfr*legcfL).Position,raydir,raycastparams)
		return rY and (rY.Position.Y-(pos.Y-3)) or 0,lY and (lY.Position.Y-(pos.Y-3)) or 0
	end

	local function velbycfrvec() --this returns 2 values: forward/backwards movement (from -1 to 1), right/left movement (from -1 to 1)
		local fw=cfr.LookVector*xzvel/walkSpeed
		local rt=cfr.RightVector*xzvel/walkSpeed
		return fw.X+fw.Z,rt.X+rt.Z
	end

	local lastvel=v3_0
	local velchg1=vf3_0
	local function velchgbycfrvec() --this returns 2 values: forward/backwards velocity change, right/left velocity change
		velchg1=velchg1+(lastvel-xzvel) --i recommend setting velchg1 to v3_0 when u start using this function or it will look worse
		lastvel=xzvel
		velchg1=velchg1:Lerp(v3_0,deltaTime/2)
		local fw=cfr.LookVector*velchg1/32
		local rt=cfr.RightVector*velchg1/32
		return fw.X+fw.Z,rt.X+rt.Z
	end

	local function rotToMouse(alpha) --this rotates ur character towards your mouse hit position
		local mpos=mouse.Hit.Position
		cfr=cfr:Lerp(cf(pos,v3(mpos.X,pos.Y,mpos.Z)),alpha or deltaTime)
	end

	return {
		raycastlegs=raycastlegs,
		velbycfrvec=velbycfrvec,
		velchgbycfrvec=velchgbycfrvec,
		addmode=addmode,
		getPart=getPart,
		getPartFromMesh=getPartFromMesh,
		getJoint=getJoint,
		getPartJoint=getPartJoint,
		rotToMouse=rotToMouse
	}
end

local t=reanimate()
if type(t)~="table" then return end
local raycastlegs=t.raycastlegs
local velbycfrvec=t.velbycfrvec
local velchgbycfrvec=t.velchgbycfrvec
local addmode=t.addmode
local getJoint=t.getJoint
local RootJoint=getJoint("RootJoint")
local RightShoulder=getJoint("Right Shoulder")
local LeftShoulder=getJoint("Left Shoulder")
local RightHip=getJoint("Right Hip")
local LeftHip=getJoint("Left Hip")
local Neck=getJoint("Neck")
addmode("default", {
	idle = function()
		local rY, lY = raycastlegs()
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,1+1*sin(sine*20),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1.1+0.1*sin(sine*20.1),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.9,-0.5)*angles(1.5707963267948966,0,0.5235987755982988),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.8+0.8*sin(sine*10),-0.6)*angles(0,-1.5707963267948966,0),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.9,-0.5)*angles(1.5707963267948966,0,-0.5235987755982988),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.8+0.8*sin(sine*20),-0.2)*angles(0,1.5707963267948966,0),deltaTime) 
--MW_animatorProgressSave: Torso,0,0,0,1,-90,0,0,1,1,1,0,20,0,0,0,20,0,0,0,1,180,0,0,1,Head,0,0,0,1,-90,0,0,1,1.1,0.1,0,20.1,-0,0,0,1,0,0,0,1,180,0,0,1,TwitterBird_Handle,1,0,0,1,0,0,0,1,-0.34,0,0,1,0,0,0,1,1.5,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,30,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-0.8,0.8,0,1,-90,0,0,1,-0.6,0,0,1,0,0,0,1,RightArm,1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,-30,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-0.8,0.8,0,20,90,0,0,1,-0.2,0,0,1,0,0,0,1
end,	
walk = function()
	local fw, rt = velbycfrvec()

			local rY, lY = raycastlegs()
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1+0.1*sin(sine*5),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.1*sin(sine*1),0)*angles(0.17453292519943295-0.5235987755982988*sin(sine*10),-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.9,-0.5)*angles(1.5707963267948966,0,-0.5235987755982988),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.1*sin(sine*1),0)*angles(-0.17453292519943295+0.5235987755982988*sin(sine*10),1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.9,-0.5)*angles(1.5707963267948966,0,0.5235987755982988),deltaTime) 
--MW_animatorProgressSave: Torso,0,0,0,1,-90,0,0,1,0.1,0.1,0,5,-0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,10,-30,0,5,-1,0.1,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,TwitterBird_Handle,0,0,0,1,0,0,0,1,-0.4500000476837158,0,0,1,0,0,0,1,-0.00027231729472987354,0,0,1,0,0,0,1,RightArm,1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,-30,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,-10,30,0,5,-1,0.1,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,30,0,0,1
end,
jump = function()
	local fw, rt = velbycfrvec()
	RootJoint.C0=RootJoint.C0:Lerp(cf(0,1+1*sin(sine*20),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
	Neck.C0=Neck.C0:Lerp(cf(0,1.1+0.1*sin(sine*20.1),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
	LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.9,-0.5)*angles(1.5707963267948966,0,0.5235987755982988),deltaTime) 
	LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.8+0.8*sin(sine*10),-0.6)*angles(0,-1.5707963267948966,0),deltaTime) 
	RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.9,-0.5)*angles(1.5707963267948966,0,-0.5235987755982988),deltaTime) 
	RightHip.C0=RightHip.C0:Lerp(cf(1,-0.8+0.8*sin(sine*20),-0.2)*angles(0,1.5707963267948966,0),deltaTime) 
--MW_animatorProgressSave: Torso,0,0,0,1,-90,0,0,1,1,1,0,20,0,0,0,20,0,0,0,1,180,0,0,1,Head,0,0,0,1,-90,0,0,1,1.1,0.1,0,20.1,-0,0,0,1,0,0,0,1,180,0,0,1,TwitterBird_Handle,1,0,0,1,0,0,0,1,-0.34,0,0,1,0,0,0,1,1.5,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,30,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-0.8,0.8,0,1,-90,0,0,1,-0.6,0,0,1,0,0,0,1,RightArm,1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,-30,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-0.8,0.8,0,20,90,0,0,1,-0.2,0,0,1,0,0,0,1
end,
fall = function()
	local fw, rt = velbycfrvec()
	RootJoint.C0=RootJoint.C0:Lerp(cf(0,1+1*sin(sine*20),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
	Neck.C0=Neck.C0:Lerp(cf(0,1.1+0.1*sin(sine*20.1),0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
	LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.9,-0.5)*angles(1.5707963267948966,0,0.5235987755982988),deltaTime) 
	LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.8+0.8*sin(sine*10),-0.6)*angles(0,-1.5707963267948966,0),deltaTime) 
	RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.9,-0.5)*angles(1.5707963267948966,0,-0.5235987755982988),deltaTime) 
	RightHip.C0=RightHip.C0:Lerp(cf(1,-0.8+0.8*sin(sine*20),-0.2)*angles(0,1.5707963267948966,0),deltaTime) 
--MW_animatorProgressSave: Torso,0,0,0,1,-90,0,0,1,1,1,0,20,0,0,0,20,0,0,0,1,180,0,0,1,Head,0,0,0,1,-90,0,0,1,1.1,0.1,0,20.1,-0,0,0,1,0,0,0,1,180,0,0,1,TwitterBird_Handle,1,0,0,1,0,0,0,1,-0.34,0,0,1,0,0,0,1,1.5,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,30,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-0.8,0.8,0,1,-90,0,0,1,-0.6,0,0,1,0,0,0,1,RightArm,1,0,0,1,90,0,0,1,0.9,0,0,1,0,0,0,1,-0.5,0,0,1,-30,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-0.8,0.8,0,20,90,0,0,1,-0.2,0,0,1,0,0,0,1
end
})
