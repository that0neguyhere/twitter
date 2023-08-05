local character = game.Players.LocalPlayer.Character
local sus = character.TwitterBird --name
local handle =  sus.Handle
local weld=handle.AccessoryWeld
weld.C1=CFrame.new(0,0.9,-1.5)

--[[
	patchma hub by MyWorld
	one last unpatch... 

    IDs of accessories for limbs:
	14255556501,14255554762,14255549007,14255551310
	or
	12652786974,11159483910,11263254795,11159410305
    
    FOR TORSO USE ANY ACCESSORY THAT COVERS IT
    (customization :smirk:)
    
    examples of accessories for torso:
    13423624885,11502853991,14053485259,13779879140
    or use the same stuff but different colors
    
    also 14255528083 gets aligned to torso
    fits best with the first set of limbs
]]

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
local cos=math.cos
local abs=math.abs
local rad=math.rad
local tinsert=table.insert
local tclear=table.clear
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
local shp=(((type(getfenv)=="function") and getfenv()) or {}).sethiddenproperty



local allowshiftlock=nil
local ctrltp=nil
local simrad=true
local placeholders=nil
local clickfling=nil

local stopreanimate=function() return nil end
local function reanimate()
	--[[
	    FDless reanimate by MyWorld
	    aka no client sided instances
	    "what else do i optimize here"
	]]

	local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them
	local placeholders = false --makes client sided accessories replacing the real ones when unavailable
	local speedlimit = 3000 --makes your parts move slower if the magnitude of their velocity is higher than this
	local antiragdoll = true --removes instances that are usually used for ragdolling form your character
	local addPartsOnRun = false --allows u to add more parts and joints to the simulation after it started
	local R15toR6 = true --adds fake r6 parts and joints for animations if your character is r15
	local walkSpeed = 20 --your walkspeed (can be changed at runtime)
	local jumpPower = 50 --your jump power (can be changed at runtime)
	local allowshiftlock = true --allows the user to use shiftlock (can be changed at runtime)
	local gravity = 196.2 --how fast the characters velocity increases while falling (can be changed at runtime)
	local simrad = 1000 --sets simulation radius to this with sethiddenproperty if its set to a number
	local ctrlclicktp = true --makes you teleport where u point ur mouse cursor at when click and hold ctrl down
	local clickfling = true --makes you fling the person you clicked when its available to do so
	local flingvel = v3(16000,16000,16000) --the rotation velocity that ur character will have while flinging

	local c=lp.Character
	if stopreanimate() or not (c and c:IsDescendantOf(ws)) then return end

	local hum=c:FindFirstChildOfClass("Humanoid")
	local rootpart=gp(c,"HumanoidRootPart","BasePart") or gp(c,"Torso","BasePart") or gp(c,"UpperTorso","BasePart") or (hum and hum.RootPart) or timegp(c,"HumanoidRootPart","BasePart",0.5) or c:FindFirstChildWhichIsA("BasePart")
	if not rootpart then return end

	R15toR6=R15toR6 and hum and (hum.RigType==e.HumanoidRigType.R15)
	simrad = (type(simrad)=="number") and (type(shp)=="function") and simrad

	local flingparts={}
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

	local function getMeshOfPart(v)
		if typeof(v)=="Instance" then
			if v:IsA("MeshPart") then
				return v.MeshId, v.TextureID
			else
				v=v:FindFirstChildOfClass("SpecialMesh")
				if v then
					return v.MeshId, v.TextureId
				end
			end
		end
		return nil, nil
	end

	local joints={}
	local cframes={}
	local des=c:GetDescendants()
	for i=1,#des do
		local v=des[i]
		if v:IsA("JointInstance") then
			tinsert(joints,{
				Name=v.Name,
				C0=v.C0,
				C1=v.C1,
				Part0=v.Part0,
				Part1=v.Part1
			})
		elseif v:IsA("BasePart") then
			cframes[v]=v.CFrame
		end
	end

	local function makeplaceholder(v)
		if typeof(v)~="Instance" then
			return nil
		end
		if not v.Archivable then
			v.Archivable=true
		end
		v=v:Clone()
		local c=v:GetChildren()
		for i=1,#c do
			local v=c[i]
			if v:IsA("SpecialMesh") then
				v.Name=rs()
				v:ClearAllChildren()
			else
				v:Destroy()
			end
		end
		v.Name=rs()
		v.Anchored=true
		v.CanCollide=false
		v.Transparency=0.25
		v.Parent=ws
		return v
	end

	local function filterInstance(v)
		local ins=v
		if isClientInstance(v) then
			v={CFrame=v.CFrame,Name=v.Name,Anchored=true}
		else
			local meshid,textureid=getMeshOfPart(v)
			if meshid and (meshid~="") and textureid and (textureid~="") then
				if placeholders then
					v={CFrame=v.CFrame,Name=v.Name,Anchored=true,meshid=meshid,textureid=textureid,placeholder=makeplaceholder(v)}
				else
					v={CFrame=v.CFrame,Name=v.Name,Anchored=true,meshid=meshid,textureid=textureid}
				end
			else
				v={CFrame=v.CFrame,Name=v.Name,Anchored=true}
			end
		end
		local check=ins~=v
		while check do
			check=false
			for i,v1 in pairs(cframes) do
				if i==ins then
					cframes[ins]=nil
					cframes[v]=v1
					check=true
					break
				end
			end
		end
		for i,v1 in pairs(joints) do
			if v1.Part0==ins then
				v1.Part0=v
			elseif v1.Part1==ins then
				v1.Part1=v
			end
		end
		if rootpart==ins then
			rootpart=v
		end
		return v
	end
	for i,v in pairs(joints) do
		v.Part0=filterInstance(v.Part0)
		v.Part1=filterInstance(v.Part1)
	end

	local Yvel=0
	local cfr=rootpart.CFrame
	local pos=cfr.Position
	local shiftlock=false
	local firstperson=false
	local xzvel=v3_0
	local v3_0150=v3_010*1.5
	local camoff=cf(v3_0,camcf.LookVector)
	camoff=camoff-v3_001*(camcf.Position-(pos+v3_0150)).Magnitude

	local refreshjointsinternal=nil
	refreshjointsinternal=function(part,refreshed)
		if not part then return end
		tinsert(refreshed,part)
		for i,v in pairs(joints) do
			local part0=v.Part0
			local part1=v.Part1
			if part1 and (part0==part) then
				cframes[part1]=cframes[part]*v.C0*v.C1:Inverse()
				if not tfind(refreshed,part1) then
					refreshjointsinternal(part1,refreshed)
				end
			elseif part0 and (part1==part) then
				cframes[part0]=cframes[part]*v.C1*v.C0:Inverse()
				if not tfind(refreshed,part0) then
					refreshjointsinternal(part0,refreshed)
				end
			end
		end
	end
	local function refreshjoints(v)
		refreshjointsinternal(v,{})
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
			if (type(v)=="table") and not (blacklist and tfind(blacklist,v)) then
				if v.meshid and sfind(v.meshid,meshid) and sfind(v.textureid,textureid) then
					return v
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
		{meshid="12876378389",textureid="12876423855",C0=cf(0,0.1, 0)*angles(rad(0),rad(0),rad(0)),Name="Head"},
		{meshid="13421774668",textureid="13415110780",C0=cf_0,Name="Torso"},
		{meshid="12867814848",textureid="12867874342",C0=angles(rad(0),rad(90),rad(0)),Name="Left Arm"},
		{meshid="12867814848",textureid="12794084950",C0=angles(rad(0),rad(0),rad(0)),Name="Right Arm"},
		{meshid="12867814848",textureid="12794082919",C0=angles(rad(0),rad(0),rad(0)),Name="Left Leg"},
		{meshid="12867814848",textureid="12867873138",C0=angles(rad(0),rad(-90),rad(0)),Name="Right Leg"}
	}

	local alignblacklist={}
	for i=1,#accessorylimbs do
		local v=accessorylimbs[i]
		local p=getPart(v.Name)
		local h=getPartFromMesh(v.meshid,v.textureid,alignblacklist)
		local w=getPartJoint(h)
		if p and w then
			w.C0=v.C0
			w.Part0=h
			w.C1=cf_0
			w.Part1=p
			tinsert(alignblacklist,h)
		end
	end

	local raycastparams=RaycastParams.new()
	raycastparams.FilterType=e.RaycastFilterType.Blacklist
	raycastparams.RespectCanCollide=true
	local rayfilter={}
	local characters={}
	local function refreshrayfilter()
		tclear(rayfilter)
		for i,v in pairs(characters) do
			tinsert(rayfilter,v)
		end
		raycastparams.FilterDescendantsInstances=rayfilter
	end
	local flingtarget=nil
	local cframes1={}
	local lastpositions={}
	local rootparts={}
	local function onplayer(v)
		local lastc=nil
		local function oncharacter()
			local newc=v.Character
			if newc and (newc ~= lastc) then
				lastc=newc
				characters[v]=newc
				refreshrayfilter()
				local hrp=loopgp(newc,"HumanoidRootPart","BasePart")
				if v~=lp then
					rootparts[v]=hrp
				end
				twait()
				if c and (v==lp) and hrp and (hrp.Parent==newc) and newc:IsDescendantOf(ws) then
					local startpos=pos+v3(mrandom(-32,32),0,mrandom(-32,32))
					local dir=nil
					local poscheck=true
					while poscheck do
						poscheck=false
						for i,v in pairs(rootparts) do
							local diff=(startpos-v.Position)*v3_101
							if diff.Magnitude<10 then
								poscheck=true
								dir=dir or diff.Unit
								startpos=startpos+dir
							end
						end
						local diff=(startpos-pos)*v3_101
						if diff.Magnitude<10 then
							poscheck=true
							dir=dir or diff.Unit
							startpos=startpos+dir
						end
					end
					startpos=cfr+startpos-cfr.Position
					if flingtarget then
						local con=heartbeat:Connect(function()
							local idleoff=v3(sin((sine-0.0375)*16),sin(sine*16),sin((sine+0.075)*16))

							hrp.CFrame=flingtarget.CFrame+flingtarget.Velocity*(sin(sine*15)+1)+v3(0,-2,0)+idleoff*0.001
							hrp.Velocity=idleoff
							hrp.RotVelocity=flingvel+idleoff
						end)
						twait(0.5)
						con:Disconnect()
						flingtarget=nil
					end
					tspawn(function()
						local con=heartbeat:Connect(function()
							hrp.CFrame=startpos+v3(sin((sine-0.0375)*16),sin(sine*16),sin((sine+0.075)*16))*0.005
							hrp.Velocity=v3_0
							hrp.RotVelocity=v3_0
						end)
						twait(0.3)
						con:Disconnect()
						if newc:IsDescendantOf(ws) then
							tclear(cframes1)
							tclear(lastpositions)
							newc.HumanoidRootPart.Died.Volume = 0
							newc:BreakJoints()
							twait(0.1)
							local cd=newc:GetDescendants()
							for i,v in pairs(cframes) do
								if type(i)=="table" then 
									local meshid=i.meshid
									if meshid then
										local textureid=i.textureid
										for i1=1,#cd do
											local v=cd[i1]
											if v and v:IsA("BasePart") then
												local meshid1,textureid1=getMeshOfPart(v)
												if (meshid1==meshid) and (textureid1==textureid) then
													cd[i1]=nil
													cframes1[v]=i
													lastpositions[v]=v.Position
													break
												end
											end
										end
									end
								end
							end
						end
					end)
				end
			end
		end
		v:GetPropertyChangedSignal("Character"):Connect(oncharacter)
		oncharacter()
	end
	local plrst=plrs:GetPlayers()
	for i=1,#plrst do onplayer(plrst[i]) end
	plrs.PlayerAdded:Connect(onplayer)
	plrs.PlayerRemoving:Connect(function(v)
		characters[v]=nil
		rootparts[v]=nil
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

	local function fling(target,duration,rotVelocity)
		twait()
		return true --maybe later
	end

	local function predictionfling(target)
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
		flingtarget=target
		twait()
		return true
	end

	if ctrlclicktp then
		ctrlclicktp=e.KeyCode.LeftControl
		local tpoff=v3_010*3
		if clickfling then
			mouse.Button1Down:Connect(function()
				if mouse.Target then
					if uis:IsKeyDown(ctrlclicktp) then
						pos=mouse.Hit.Position+tpoff
						cfr=cf(pos,pos+camoff.LookVector*v3_101)
						xzvel=v3_0
						Yvel=0
					else
						predictionfling()
					end
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
	elseif clickfling then
		mouse.Button1Down:Connect(predictionfling)
	end

	local noYvelTime=1
	local lastsine=sine
	local pose=nil
	local con=nil
	local function mainFunction()
		if not c then 
			for i,v in pairs(cframes) do
				local p=i.placeholder
				if p then
					p:Destroy()
				end
			end
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
				local camoffpos=camoff.Position
				camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
			else
				shiftlock=false
			end
		elseif firstperson then
			uis.MouseBehavior=enumMLC
			local rotation=uis:GetMouseDelta()*mradN05
			local camoffpos=camoff.Position
			camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		elseif uis:IsMouseButtonPressed(enumMB2) then
			uis.MouseBehavior=enumMLCP
			local rotation=uis:GetMouseDelta()*mradN05
			local camoffpos=camoff.Position
			camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		else
			uis.MouseBehavior=enumMD
		end

		local raycastresult=ws:Raycast(pos,v3_010*(fpdh-pos.Y),raycastparams)
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

		local idlerv=v3(sin((sine-0.0375)*16),sin(sine*16),sin((sine+0.075)*16))
		local idleoff=idlerv*0.001

		for i,v in pairs(cframes) do
			local p=i.placeholder
			if p then
				if p.Parent~=ws then
					p.Parent=ws
				end
				p.CFrame=v
			end
		end
		for i,v in pairs(cframes1) do
			if (not i.Anchored) and i:IsDescendantOf(ws) then
				if i.ReceiveAge==0 then
					local p=v.placeholder
					if p and p.Parent then
						p.Parent=nil
					end
					v=cframes[v]
					local lastpos=lastpositions[i]
					local vel=(v.Position-lastpos)/delta
					if vel.Magnitude>speedlimit then
						vel=vel.Unit*speedlimit
						v=v+(lastpos+vel*delta)-v.Position
					end
					lastpositions[i]=v.Position
					if vel.Magnitude<0.15 then
						v=v+idleoff
					end
					if novoid and (v.Y<novoid) then
						v=v+v3_010*(novoid-v.Y)
					end
					i.Velocity=getNetlessVelocity(vel*noYvelTime+xzvel)
					i.CFrame=v
					i.RotVelocity=idlerv
				else
					lastpositions[i]=i.Position
				end
			end
		end

		if simrad then
			shp(lp,"SimulationRadius",simrad)
		end
	end

	con=heartbeat:Connect(mainFunction)
	mainFunction()

	stopreanimate=function()
		if c then
			c=nil
			return true
		else
			return false
		end
	end

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
	local velchg1=v3_0
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

	local function setWalkSpeed(n)
		if type(n) ~= "number" then
			n=16
		end
		walkSpeed=n
	end
	local function setJumpPower(n)
		if type(n) ~= "number" then
			n=50
		end
		jumpPower=n
	end
	local function setGravity(n)
		if type(n) ~= "number" then
			n=196.2
		end
		gravity=n
	end

	return {
		cframes=cframes,
		joints=joints,
		refreshjoints=refreshjoints,
		raycastlegs=raycastlegs,
		velbycfrvec=velbycfrvec,
		velchgbycfrvec=velchgbycfrvec,
		addmode=addmode,
		getPart=getPart,
		getPartFromMesh=getPartFromMesh,
		getJoint=getJoint,
		getPartJoint=getPartJoint,
		rotToMouse=rotToMouse,
		setWalkSpeed=setWalkSpeed,
		setJumpPower=setJumpPower,
		setGravity=setGravity
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

--//Reset Button
local resetBind = Instance.new("BindableEvent")
local isButtonChanged = false
local originalConnection

local function resetButtonFunction()
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
end

local function onResetButtonClicked()
    if not isButtonChanged then        
        stopreanimate()
        isButtonChanged = true
        originalConnection:Disconnect() 
    else        
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
    end
end

resetBind.Event:Connect(onResetButtonClicked)
originalConnection = resetBind.Event:Connect(resetButtonFunction) 

game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBind)
--//

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
