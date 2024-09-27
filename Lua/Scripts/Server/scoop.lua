
--copied over from NT items.lua with some changes
--removes and drops all existing organs inside the torso upon scoop
Hook.Add("sb.scoop", "sb.scoop", function(effect, deltaTime, item, targets, worldPosition, element)
	--get the character
	local targetCharacter=nil
	
	for setTarget in targets do
		targetCharacter=setTarget
	end
	
	--get their limbs
	local limbtype=nil
	
	--extract organs
	for setLimb in LimbType do
		local limbtype = HF.NormalizeLimbType(setLimb)
		
		--liver
		if(limbtype == LimbType.Torso) then
			local damage = HF.GetAfflictionStrength(targetCharacter,"liverdamage",0)
			local removed = HF.GetAfflictionStrength(targetCharacter,"liverremoved",0)
			if(removed <= 0) then

				HF.SetAffliction(targetCharacter,"liverremoved",100)
				HF.SetAffliction(targetCharacter,"liverdamage",100)

				HF.AddAffliction(targetCharacter,"organdamage",(100-damage)/5)
				local transplantidentifier = "livertransplant_q1"
				if(damage < 90) then

					-- add acidosis, alkalosis and sepsis to the bloodpack if the donor has them
					local function postSpawnFunc(args)
						local tags = {}

						if args.acidosis > 0 then table.insert(tags,"acid:"..tostring(HF.Round(args.acidosis)))
						elseif args.alkalosis > 0 then table.insert(tags,"alkal:"..tostring(HF.Round(args.alkalosis))) end
						if args.sepsis > 10 then table.insert(tags,"sepsis") end

						local tagstring = ""
						for index, value in ipairs(tags) do
							tagstring = tagstring..value
							if index < #tags then tagstring=tagstring.."," end
						end

						args.item.Tags = tagstring
						args.item.Condition = args.condition
					end
					local params = {
						acidosis=HF.GetAfflictionStrength(targetCharacter,"acidosis"),
						alkalosis=HF.GetAfflictionStrength(targetCharacter,"alkalosis"),
						sepsis=HF.GetAfflictionStrength(targetCharacter,"sepsis"),
						condition=100-damage
					}
					HF.SpawnItemPlusFunction(transplantidentifier,postSpawnFunc,params,nil,nil,targetCharacter.WorldPosition)
				end
			end
		end
		
		--lungs
		if(limbtype == LimbType.Torso) then
			local damage = HF.GetAfflictionStrength(targetCharacter,"lungdamage",0)
			local removed = HF.GetAfflictionStrength(targetCharacter,"lungremoved",0)
			if(removed <= 0) then

				HF.SetAffliction(targetCharacter,"lungremoved",100)
				HF.SetAffliction(targetCharacter,"lungdamage",100)

				HF.SetAffliction(targetCharacter,"pneumothorax",0)
				HF.SetAffliction(targetCharacter,"needlec",0)

				HF.AddAffliction(targetCharacter,"organdamage",(100-damage)/5)
				local transplantidentifier = "lungtransplant_q1"
				if(damage < 90) then 
					-- add acidosis, alkalosis and sepsis to the bloodpack if the donor has them
					local function postSpawnFunc(args)
						local tags = {}

						if args.acidosis > 0 then table.insert(tags,"acid:"..tostring(HF.Round(args.acidosis)))
						elseif args.alkalosis > 0 then table.insert(tags,"alkal:"..tostring(HF.Round(args.alkalosis))) end
						if args.sepsis > 10 then table.insert(tags,"sepsis") end

						local tagstring = ""
						for index, value in ipairs(tags) do
							tagstring = tagstring..value
							if index < #tags then tagstring=tagstring.."," end
						end

						args.item.Tags = tagstring
						args.item.Condition = args.condition
					end
					local params = {
						acidosis=HF.GetAfflictionStrength(targetCharacter,"acidosis"),
						alkalosis=HF.GetAfflictionStrength(targetCharacter,"alkalosis"),
						sepsis=HF.GetAfflictionStrength(targetCharacter,"sepsis"),
						condition=100-damage
					}

					HF.SpawnItemPlusFunction(transplantidentifier,postSpawnFunc,params,nil,nil,targetCharacter.WorldPosition)
				end
			end
		end
		
		--heart
		if(limbtype == LimbType.Torso) then
			local damage = HF.GetAfflictionStrength(targetCharacter,"heartdamage",0)
			local removed = HF.GetAfflictionStrength(targetCharacter,"heartremoved",0)
			if(removed <= 0) then

				HF.SetAffliction(targetCharacter,"heartremoved",100)
				HF.SetAffliction(targetCharacter,"heartdamage",100)
					
				HF.SetAffliction(targetCharacter,"tamponade",0)
				HF.SetAffliction(targetCharacter,"heartattack",0)
					
				HF.AddAffliction(targetCharacter,"organdamage",(100-damage)/5)
				local transplantidentifier = "hearttransplant_q1"
				if(damage < 90) then
					-- add acidosis, alkalosis and sepsis to the bloodpack if the donor has them
					local function postSpawnFunc(args)
						local tags = {}

						if args.acidosis > 0 then table.insert(tags,"acid:"..tostring(HF.Round(args.acidosis)))
						elseif args.alkalosis > 0 then table.insert(tags,"alkal:"..tostring(HF.Round(args.alkalosis))) end
						if args.sepsis > 10 then table.insert(tags,"sepsis") end

						local tagstring = ""
						for index, value in ipairs(tags) do
							tagstring = tagstring..value
							if index < #tags then tagstring=tagstring.."," end
						end

						args.item.Tags = tagstring
						args.item.Condition = args.condition
					end
					local params = {
						acidosis=HF.GetAfflictionStrength(targetCharacter,"acidosis"),
						alkalosis=HF.GetAfflictionStrength(targetCharacter,"alkalosis"),
						sepsis=HF.GetAfflictionStrength(targetCharacter,"sepsis"),
						condition=100-damage
					}

					HF.SpawnItemPlusFunction(transplantidentifier,postSpawnFunc,params,nil,nil,targetCharacter.WorldPosition)
				end
			end
		end
		
		--kidneys
		if(limbtype == LimbType.Torso) then
			local damage = HF.GetAfflictionStrength(targetCharacter,"kidneydamage",0)
			local removed = HF.GetAfflictionStrength(targetCharacter,"kidneyremoved",0)
			if(removed <= 0) then

				HF.SetAffliction(targetCharacter,"kidneyremoved",100)
				HF.SetAffliction(targetCharacter,"kidneydamage",100)
				HF.AddAffliction(targetCharacter,"organdamage",(100-damage)/5)
				local transplantidentifier = "kidneytransplant_q1"
				if(damage < 50) then
					-- add acidosis, alkalosis and sepsis to the bloodpack if the donor has them
					local function postSpawnFunc(args)
						local tags = {}

						if args.acidosis > 0 then table.insert(tags,"acid:"..tostring(HF.Round(args.acidosis)))
						elseif args.alkalosis > 0 then table.insert(tags,"alkal:"..tostring(HF.Round(args.alkalosis))) end
						if args.sepsis > 10 then table.insert(tags,"sepsis") end

						local tagstring = ""
						for index, value in ipairs(tags) do
							tagstring = tagstring..value
							if index < #tags then tagstring=tagstring.."," end
						end

						args.item.Tags = tagstring
						args.item.Condition = args.condition
					end
					local params = {
						acidosis=HF.GetAfflictionStrength(targetCharacter,"acidosis"),
						alkalosis=HF.GetAfflictionStrength(targetCharacter,"alkalosis"),
						sepsis=HF.GetAfflictionStrength(targetCharacter,"sepsis"),
						condition=100
					}

					HF.SpawnItemPlusFunction(transplantidentifier,postSpawnFunc,params,nil,nil,targetCharacter.WorldPosition)
					damage = damage+50
				end
				if(damage < 95) then
					-- add acidosis, alkalosis and sepsis to the bloodpack if the donor has them
					local function postSpawnFunc(args)
						local tags = {}

						if args.acidosis > 0 then table.insert(tags,"acid:"..tostring(HF.Round(args.acidosis)))
						elseif args.alkalosis > 0 then table.insert(tags,"alkal:"..tostring(HF.Round(args.alkalosis))) end
						if args.sepsis > 10 then table.insert(tags,"sepsis") end

						local tagstring = ""
						for index, value in ipairs(tags) do
							tagstring = tagstring..value
							if index < #tags then tagstring=tagstring.."," end
						end

						args.item.Tags = tagstring
						args.item.Condition = args.condition
					end
					local params = {
						acidosis=HF.GetAfflictionStrength(targetCharacter,"acidosis"),
						alkalosis=HF.GetAfflictionStrength(targetCharacter,"alkalosis"),
						sepsis=HF.GetAfflictionStrength(targetCharacter,"sepsis"),
						condition=100-(damage-50)*2
					}

					HF.SpawnItemPlusFunction(transplantidentifier,postSpawnFunc,params,nil,nil,targetCharacter.WorldPosition)
				end
			end
		end
	end
end)

--copied over from NT items.lua with minute changes
--removes and drops all existing limbs upon dismember
Hook.Add("sb.dismember", "sb.dismember", function(effect, deltaTime, item, targets, worldPosition, element)
	--get the character
	local targetCharacter=nil
	
	for setTarget in targets do
		targetCharacter=setTarget
	end
	
	--get their limbs
	local limbtype=nil
	
	for setLimb in LimbType do
		local limbtype = HF.NormalizeLimbType(setLimb)
	
		local droplimb =
			not NT.LimbIsAmputated(targetCharacter,limbtype)
			and not HF.HasAfflictionLimb(targetCharacter,"gangrene",limbtype,15)
		-- drop previously held item
		local previtem = HF.GetHeadWear(targetCharacter)
		if(previtem ~= nil and limbtype == LimbType.Head) then
			previtem.Drop(character,true)
		end
		NT.SurgicallyAmputateLimb(targetCharacter,limbtype)
		if (droplimb) then
			local limbtoitem = {}
			limbtoitem[LimbType.RightLeg] = "rleg"
			limbtoitem[LimbType.LeftLeg] = "lleg"
			limbtoitem[LimbType.RightArm] = "rarm"
			limbtoitem[LimbType.LeftArm] = "larm"
			if limbtoitem[limbtype] ~= nil then
				HF.SpawnItemAt(limbtoitem[limbtype],targetCharacter.WorldPosition)
			end
		end
	end
end)