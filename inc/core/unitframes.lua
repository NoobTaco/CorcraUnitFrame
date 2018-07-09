local CF=CreateFrame("Frame")
CF:RegisterEvent("PLAYER_LOGIN")
CF:SetScript("OnEvent", function(self, event)


-- TEXTURE
local function SetTextures()
	for _, StatusBarTextures in pairs ({
		PlayerFrameHealthBar, PlayerFrameManaBar,
		TargetFrameHealthBar, TargetFrameManaBar,
		TargetFrameToTHealthBar, TargetFrameToTManaBar,
		FocusFrameHealthBar, FocusFrameManaBar,
		FocusFrameToTHealthBar, FocusFrameToTManaBar,
		PlayerFrameHealthBar.AnimatedLossBar,
		PartyMemberFrame1HealthBar,
		PartyMemberFrame2HealthBar,
		PartyMemberFrame3HealthBar,
		PartyMemberFrame4HealthBar,
		PartyMemberFrame1ManaBar,
		PartyMemberFrame2ManaBar,
		PartyMemberFrame3ManaBar,
		PartyMemberFrame4ManaBar,
		CastingBarFrame, TargetFrameSpellBar, FocusFrameSpellBar,	
	}) 	do
		StatusBarTextures:SetStatusBarTexture("Interface\\Addons\\CorcraUnitFrame\\inc\\textures\\unitframes\\UI-StatusBar")
	end
end

--COLOR
local function ClassColor(statusbar, unit)
local _, class, c
	if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
		_, class = UnitClass(unit);
		c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class];
		statusbar:SetStatusBarColor(c.r, c.g, c.b);
	end
	if not UnitIsPlayer("target") then
		color = FACTION_BAR_COLORS[UnitReaction("target", "player")]
		if ( not UnitPlayerControlled("target") and UnitIsTapDenied("target") ) then
			TargetFrameHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
		else
		if color then
			TargetFrameHealthBar:SetStatusBarColor(color.r, color.g, color.b)
			TargetFrameHealthBar.lockColor = true
		end
		end
	end
	if not UnitIsPlayer("focus") then
		color = FACTION_BAR_COLORS[UnitReaction("focus", "player")]
		if ( not UnitPlayerControlled("focus") and UnitIsTapDenied("focus") ) then
				FocusFrameHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
		else
		if color then
				FocusFrameHealthBar:SetStatusBarColor(color.r, color.g, color.b)
				FocusFrameHealthBar.lockColor = true
		end
	    end
	end
	if not UnitIsPlayer("targettarget") then
		color = FACTION_BAR_COLORS[UnitReaction("targettarget", "player")]
		if ( not UnitPlayerControlled("targettarget") and UnitIsTapDenied("targettarget") ) then
			TargetFrameToTHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
		else
		if color then
			TargetFrameToTHealthBar:SetStatusBarColor(color.r, color.g, color.b)
			TargetFrameToTHealthBar.lockColor = true
		end
		end
	end
	if not UnitIsPlayer("focustarget") then
		color = FACTION_BAR_COLORS[UnitReaction("focustarget", "player")]
		if ( not UnitPlayerControlled("focustarget") and UnitIsTapDenied("focustarget") ) then
			FocusFrameToTHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
		else
		if color then
			FocusFrameToTHealthBar:SetStatusBarColor(color.r, color.g, color.b)
			FocusFrameToTHealthBar.lockColor = true
		end
	end
end
end
	
hooksecurefunc("UnitFrameHealthBar_Update", function(self)
	ClassColor(self, self.unit)
end)

hooksecurefunc("HealthBar_OnValueChanged", function(self)
	ClassColor(self, self.unit)
end)

hooksecurefunc("UnitFrameManaBar_UpdateType", function(manaBar)
	ClassColor(self, self.unit)
 end)

--VEHICLE
function StyleVehicle(self, vehicleType)
	PlayerFrame.state = "vehicle";

	UnitFrame_SetUnit(self, "vehicle", PlayerFrameHealthBar, PlayerFrameManaBar);
	UnitFrame_SetUnit(PetFrame, "player", PetFrameHealthBar, PetFrameManaBar);
	PetFrame_Update(PetFrame);
	PlayerFrame_Update();
	BuffFrame_Update();
	ComboFrame_Update(ComboFrame);

	PlayerFrameTexture:Hide();
	if ( vehicleType == "Natural" ) then
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		PlayerFrameHealthBar:SetSize(103,12);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",116,-41);
		PlayerFrameManaBar:SetSize(103,12);
		PlayerFrameManaBar:SetPoint("TOPLEFT",116,-52);
	else
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		PlayerFrameHealthBar:SetSize(100,12);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",119,-41);
		PlayerFrameManaBar:SetSize(100,12);
		PlayerFrameManaBar:SetPoint("TOPLEFT",119,-52);
	end
	PlayerFrame_ShowVehicleTexture();

	PlayerName:SetPoint("CENTER",50,23);
	PlayerLeaderIcon:SetPoint("TOPLEFT",40,-12);
	PlayerMasterIcon:SetPoint("TOPLEFT",86,0);
	PlayerFrameGroupIndicator:SetPoint("BOTTOMLEFT", PlayerFrame, "TOPLEFT", 97, -13);

	PlayerFrameBackground:SetWidth(114);
	PlayerLevelText:Hide();
end
hooksecurefunc("PlayerFrame_ToVehicleArt", StyleVehicle)
	
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues",function(self,_,value,_,maxValue)
  if self.RightText and value and maxValue>0 and not self.showPercentage and GetCVar("statusTextDisplay")=="BOTH" then
    local k,m=1e3 
    m=k*k
	self.RightText:SetText( (value>1e3 and  value<1e5 and  format("%1.3f",value/k))  or (value>=1e5 and  value<1e6 and  format("%1.0f K",value/k)) or (value>=1e6 and  value<1e9 and  format("%1.1f M",value/m))  or (value>=1e9 and  format("%1.1f M",value/m))  or value )
	end
end)

--PLAYER
function StylePlayerFrame(self)
	PlayerFrameTexture:SetTexture("Interface\\Addons\\CorcraUnitFrame\\inc\\textures\\unitframes\\UI-TargetingFrame");
	PlayerName:Hide();
	PlayerFrameGroupIndicatorText:ClearAllPoints();
	PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame,"TOP",0,-20);
	PlayerFrameGroupIndicatorLeft:Hide();
	PlayerFrameGroupIndicatorMiddle:Hide();
	PlayerFrameGroupIndicatorRight:Hide();
	PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-24);
	PlayerFrameHealthBar:SetHeight(26);
	PlayerFrameHealthBar.LeftText:ClearAllPoints();
	PlayerFrameHealthBar.LeftText:SetPoint("LEFT",PlayerFrameHealthBar,"LEFT",10,0);	
	PlayerFrameHealthBar.RightText:ClearAllPoints();
	PlayerFrameHealthBar.RightText:SetPoint("RIGHT",PlayerFrameHealthBar,"RIGHT",-5,0);
	PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 0, 0);
	PlayerFrameManaBar:SetPoint("TOPLEFT",106,-52);
	PlayerFrameManaBar:SetHeight(13);
	PlayerFrameManaBar.LeftText:ClearAllPoints();
	PlayerFrameManaBar.LeftText:SetPoint("LEFT",PlayerFrameManaBar,"LEFT",10,0)		;
	PlayerFrameManaBar.RightText:ClearAllPoints();
	PlayerFrameManaBar.RightText:SetPoint("RIGHT",PlayerFrameManaBar,"RIGHT",-5,1);
	PlayerFrameManaBarText:SetPoint("CENTER",PlayerFrameManaBar,"CENTER",0,0);
	PlayerFrameManaBar.FeedbackFrame:ClearAllPoints();
	PlayerFrameManaBar.FeedbackFrame:SetPoint("CENTER",PlayerFrameManaBar,"CENTER",0,0);
	PlayerFrameManaBar.FeedbackFrame:SetHeight(13);
	PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:ClearAllPoints();
	PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetPoint("CENTER", PlayerFrameManaBar.FullPowerFrame, "RIGHT", -6, -3);
	PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetSize(30,29);
	PlayerFrameManaBar.FullPowerFrame.PulseFrame:ClearAllPoints();
	PlayerFrameManaBar.FullPowerFrame.PulseFrame:SetPoint("CENTER", PlayerFrameManaBar.FullPowerFrame,"CENTER",-6,-2);
	PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:ClearAllPoints();
	PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetPoint("CENTER",PlayerFrameManaBar.FullPowerFrame,"RIGHT",5,-4);
	PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetSize(30,50);
end
hooksecurefunc("PlayerFrame_ToPlayerArt", StylePlayerFrame)

--TARGET
function StyleTargetFrame(self, forceNormalTexture)
	local classification = UnitClassification(self.unit);
	self.deadText:ClearAllPoints();
	self.deadText:SetPoint("CENTER", self.healthbar, "CENTER",0,0);
	self.levelText:SetPoint("RIGHT", self.healthbar, "BOTTOMRIGHT", 63, 10);
	self.nameBackground:Hide();
	self.Background:SetSize(119,42);
	self.manabar.pauseUpdates = false;
	self.manabar:Show();
	TextStatusBar_UpdateTextString(self.manabar);
	self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
	self.name:SetPoint("LEFT", self, 15, 36);
	self.healthbar:SetSize(119, 26);
	self.healthbar:ClearAllPoints();
	self.healthbar:SetPoint("TOPLEFT", 5, -24);
	self.healthbar.LeftText:ClearAllPoints();
	self.healthbar.LeftText:SetPoint("LEFT", self.healthbar, "LEFT", 8, 0);
	self.healthbar.RightText:ClearAllPoints();
	self.healthbar.RightText:SetPoint("RIGHT", self.healthbar, "RIGHT", -5, 0);
	self.healthbar.TextString:SetPoint("CENTER", self.healthbar, "CENTER", 0, 0);
	self.manabar:ClearAllPoints();
	self.manabar:SetPoint("TOPLEFT", 5, -52);
	self.manabar:SetSize(119, 13);
	self.manabar.LeftText:ClearAllPoints();
	self.manabar.LeftText:SetPoint("LEFT", self.manabar, "LEFT", 8, 0);	
	self.manabar.RightText:ClearAllPoints();
	self.manabar.RightText:SetPoint("RIGHT", self.manabar, "RIGHT", -5, 0);
	self.manabar.TextString:SetPoint("CENTER", self.manabar, "CENTER", 0, 0);

--TargetOfTarget
	TargetFrameToTHealthBar:ClearAllPoints()
	TargetFrameToTHealthBar:SetPoint("TOPLEFT", 44, -15)
	TargetFrameToTHealthBar:SetHeight(8)
	TargetFrameToTManaBar:ClearAllPoints()
	TargetFrameToTManaBar:SetPoint("TOPLEFT", 44, -24)
	TargetFrameToTManaBar:SetHeight(5)
	FocusFrameToTHealthBar:ClearAllPoints()
	FocusFrameToTHealthBar:SetPoint("TOPLEFT", 45, -15)
	FocusFrameToTHealthBar:SetHeight(8)
	FocusFrameToTManaBar:ClearAllPoints()
	FocusFrameToTManaBar:SetPoint("TOPLEFT", 45, -25)
	FocusFrameToTManaBar:SetHeight(3)
	FocusFrameToT.deadText:SetWidth(0.01)

	if ( forceNormalTexture ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
	elseif ( classification == "minus" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\CorcraUnitFrame\\inc\\textures\\unitframes\\UI-TargetingFrame");
		forceNormalTexture = true;
	elseif ( classification == "worldboss" or classification == "elite" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\CorcraUnitFrame\\inc\\textures\\unitframes\\UI-TargetingFrame-Elite");
	elseif ( classification == "rareelite" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\CorcraUnitFrame\\inc\\textures\\unitframes\\UI-TargetingFrame-Rare-Elite");
	elseif ( classification == "rare" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\CorcraUnitFrame\\inc\\textures\\unitframes\\UI-TargetingFrame-Rare");
	else
		self.borderTexture:SetTexture("Interface\\Addons\\CorcraUnitFrame\\inc\\textures\\unitframes\\UI-TargetingFrame");
		forceNormalTexture = true;
	end
		
	if ( forceNormalTexture ) then
		self.haveElite = nil;
		if ( classification == "minus" ) then
			self.Background:SetSize(119,42);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
			--
			self.nameBackground:Hide();
			self.name:SetPoint("LEFT", self, 15, 36);
			self.healthbar:ClearAllPoints();
			self.healthbar:SetPoint("LEFT", 5, 13);
		else
			self.Background:SetSize(119,42);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
			
		end
		if ( self.threatIndicator ) then
			if ( classification == "minus" ) then
				self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash");
				self.threatIndicator:SetTexCoord(0, 1, 0, 1);
				self.threatIndicator:SetWidth(256);
				self.threatIndicator:SetHeight(128);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
			else
				self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
				self.threatIndicator:SetWidth(242);
				self.threatIndicator:SetHeight(93);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
				self.threatNumericIndicator:SetPoint("BOTTOM", PlayerFrame, "TOP", 75, -22);
			end
		end	
	else
		self.haveElite = true;
		TargetFrameBackground:SetSize(119,42);
		self.Background:SetSize(119,42);
		self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
		if ( self.threatIndicator ) then
			self.threatIndicator:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625);
			self.threatIndicator:SetWidth(242);
			self.threatIndicator:SetHeight(112);
			self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -22, 9);
		end		
	end
	
	if (self.questIcon) then
		if (UnitIsQuestBoss(self.unit)) then
			self.questIcon:Show();
		else
			self.questIcon:Hide();
		end
	end
end
hooksecurefunc("TargetFrame_CheckClassification", StyleTargetFrame)

--PET	
	PetFrameHealthBar:ClearAllPoints()
	PetFrameHealthBar:SetPoint("TOPLEFT", 45, -22)
	PetFrameHealthBar:SetHeight(10)
	PetFrameManaBar:ClearAllPoints()
	PetFrameManaBar:SetPoint("TOPLEFT", 45, -32)
	PetFrameManaBar:SetHeight(5)
	
-- Hide
hooksecurefunc("PlayerFrame_UpdateStatus",function()
	PlayerStatusTexture:Hide()
	PlayerRestGlow:Hide()
    PlayerStatusGlow:Hide()
    PlayerPrestigeBadge:SetAlpha(0)
    PlayerPrestigePortrait:SetAlpha(0)
    TargetFrameTextureFramePrestigeBadge:SetAlpha(0)
    TargetFrameTextureFramePrestigePortrait:SetAlpha(0)
    FocusFrameTextureFramePrestigeBadge:SetAlpha(0)
    FocusFrameTextureFramePrestigePortrait:SetAlpha(0)
end)

--BUFFS
local unit = {}
local AURA_START_X = 5;
local AURA_START_Y = 28;
local AURA_OFFSET_Y = 3;
local LARGE_AURA_SIZE = 27
local SMALL_AURA_SIZE = 25
local AURA_ROW_WIDTH = 122;

function unit:targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
	local size
	local offsetY = AURA_OFFSET_Y
	local rowWidth = 0
	local firstBuffOnRow = 1
	for i=1, numAuras do
		if ( largeAuraList[i] ) then
			size = LARGE_AURA_SIZE
			offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y
		else
			size = SMALL_AURA_SIZE
		end
		if ( i == 1 ) then
			rowWidth = size
			self.auraRows = self.auraRows + 1
		else
			rowWidth = rowWidth + size + offsetX
		end
		if ( rowWidth > maxRowWidth ) then
			updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY, mirrorAurasVertically)
			rowWidth = size
			self.auraRows = self.auraRows + 1
			firstBuffOnRow = i
			offsetY = AURA_OFFSET_Y
		else
			updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY, mirrorAurasVertically)
		end
	end
end

local function unit_targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
	unit:targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
end
hooksecurefunc("TargetFrame_UpdateAuraPositions", unit_targetUpdateAuraPositions)

function unit:targetUpdateBuffAnchor(self, buffName, index, numDebuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	local point, relativePoint
	local startY, auraOffsetY
	if ( mirrorVertically ) then
		point = "BOTTOM"
		relativePoint = "TOP"
		startY = -6
		offsetY = -offsetY
		auraOffsetY = -AURA_OFFSET_Y
	else
		point = "TOP"
		relativePoint="BOTTOM"
		startY = AURA_START_Y
		auraOffsetY = AURA_OFFSET_Y
	end
	 
	local buff = _G[buffName..index]
	if ( index == 1 ) then
		if ( UnitIsFriend("player", self.unit) or numDebuffs == 0 ) then
			-- unit is friendly or there are no debuffs...buffs start on top
			buff:SetPoint(point.."LEFT", self, relativePoint.."LEFT", AURA_START_X, startY)		   
		else
			-- unit is not friendly and we have debuffs...buffs start on bottom
			buff:SetPoint(point.."LEFT", self.debuffs, relativePoint.."LEFT", 0, -offsetY)
		end
		self.buffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0)
		self.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
		self.spellbarAnchor = buff
	elseif ( anchorIndex ~= (index-1) ) then
		-- anchor index is not the previous index...must be a new row
		buff:SetPoint(point.."LEFT", _G[buffName..anchorIndex], relativePoint.."LEFT", 0, -offsetY)
		self.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
		self.spellbarAnchor = buff
	else
		-- anchor index is the previous index
		buff:SetPoint(point.."LEFT", _G[buffName..anchorIndex], point.."RIGHT", offsetX, 0)
	end

	buff:SetWidth(size)
	buff:SetHeight(size)
end

local function unit_targetUpdateBuffAnchor(self, buffName, index, numDebuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	unit:targetUpdateBuffAnchor(self, buffName, index, numDebuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
end
hooksecurefunc("TargetFrame_UpdateBuffAnchor", unit_targetUpdateBuffAnchor)

function unit:targetUpdateDebuffAnchor(self, debuffName, index, numBuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	local buff = _G[debuffName..index];
	local isFriend = UnitIsFriend("player", self.unit);
	 
	--For mirroring vertically
	local point, relativePoint;
	local startY, auraOffsetY;
	if ( mirrorVertically ) then
		point = "BOTTOM";
		relativePoint = "TOP";
		startY = -8;
		offsetY = - offsetY;
		auraOffsetY = -AURA_OFFSET_Y;
	else
		point = "TOP";
		relativePoint="BOTTOM";
		startY = AURA_START_Y;
		auraOffsetY = AURA_OFFSET_Y;
	end
	 
	if ( index == 1 ) then
		if ( isFriend and numBuffs > 0 ) then
			-- unit is friendly and there are buffs...debuffs start on bottom
			buff:SetPoint(point.."LEFT", self.buffs, relativePoint.."LEFT", 0, -offsetY);
		else
			-- unit is not friendly or there are no buffs...debuffs start on top
			buff:SetPoint(point.."LEFT", self, relativePoint.."LEFT", AURA_START_X, startY);
		end
		self.debuffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0);
		self.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		if ( ( isFriend ) or ( not isFriend and numBuffs == 0) ) then
			self.spellbarAnchor = buff;
		end
	elseif ( anchorIndex ~= (index-1) ) then
		-- anchor index is not the previous index...must be a new row
		buff:SetPoint(point.."LEFT", _G[debuffName..anchorIndex], relativePoint.."LEFT", 0, -offsetY);
		self.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		if ( ( isFriend ) or ( not isFriend and numBuffs == 0) ) then
			self.spellbarAnchor = buff;
		end
	else
		-- anchor index is the previous index
		buff:SetPoint(point.."LEFT", _G[debuffName..(index-1)], point.."RIGHT", offsetX, 0);
	end
 
	-- Resize
	buff:SetWidth(size);
	buff:SetHeight(size);
	local debuffFrame =_G[debuffName..index.."Border"];
	debuffFrame:SetWidth(size+2);
	debuffFrame:SetHeight(size+2);
end

local function unit_targetUpdateDebuffAnchor(self, debuffName, index, numBuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	unit:targetUpdateDebuffAnchor(self, debuffName, index, numBuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
end
hooksecurefunc("TargetFrame_UpdateDebuffAnchor", unit_targetUpdateDebuffAnchor)
end)