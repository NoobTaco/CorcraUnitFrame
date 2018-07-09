SUIDB = {}

local CF=CreateFrame("Frame")
CF:RegisterEvent("PLAYER_LOGIN")
CF:SetScript("OnEvent", function(self, event)

print("Welcome to |cfff58cbaS|r|cff009cffUI|r use |CFFFE8A0E/SUI|r for Options.")

--STANDART CONFIG
if SUIDB.RESET == nil then

local function reset()
   
   -- CVARS
   --SetCVar("CombatDamage",0)
   --SetCVar("showDispelDebuffs",0)
   --SetCVar("showTargetOfTarget",1)
   --SetCVar("statusText",1)
   SetCVar("scriptErrors",0)
   SetCVar("threatWarning",0)
   SetCVar("chatStyle", "classic", "chatStyle")
   SetCVar("ShowClassColorInNameplate", 1)
   SetCVar("floatingCombatTextCombatState", 0)
   SetCVar("floatingCombatTextCombatDamage", 1)
   --SetCVar("noBuffDebuffFilterOnTarget", 1)

   SUIDB.UNITFRAMES     = true; 
   SUIDB.CASTBARS       = true; 
   SUIDB.HOTKEYS        = true; 
   SUIDB.GRYPHONES      = true; 
   SUIDB.DARKFRAMES     = true; 
   SUIDB.CHAT           = true; 
   SUIDB.RANGE          = true; 
   SUIDB.SHORTBAR       = false; 
   SUIDB.TOOLTIP        = true; 
   SUIDB.TABBINDER      = false; 
   SUIDB.SAFEQUEUE      = true; 
   SUIDB.LOSECONTROL    = true;
   SUIDB.SHOWRAID       = false;
   SUIDB.HOVERBIND      = false; 
   SUIDB.SGRID          = false; 
   SUIDB.STATS          = true; 
   SUIDB.ITEMLEVEL      = true; 
   SUIDB.INTERRUPT      = true; 
   SUIDB.INCOMBAT       = false; 
   SUIDB.FRIENDLIST     = true; 
   SUIDB.CHARLINKS      = false; 
   SUIDB.AUTOREP        = true; 
   SUIDB.ORDERHALLBAR   = false; 
   SUIDB.TALKINGHEAD    = false; 
   SUIDB.COORDS         = true; 
   SUIDB.PULLTIMER      = false; 
   SUIDB.ARENANRS       = true;
   SUIDB.CLASSCOLOR     = false;
   SUIDB.RAIDFRAMEFIX   = false;
   SUIDB.KEYPRESS       = false;
   SUIDB.SKINS          = false;
   SUIDB.EASYDELETE     = false;

   --CASTBAR
   SUIDB.CBPPlayerX     = "0"; 
   SUIDB.CBPPlayerY     = "115"; 
   SUIDB.CBPPlayerT     = true;
   SUIDB.CBPTargetX     = "0"; 
   SUIDB.CBPTargetY     = "60"; 
   SUIDB.CBPTargetT     = true;

   --TOOLTIP
   SUIDB.TOOLTIPX     = "-10"; 
   SUIDB.TOOLTIPY     = "180"; 

   --STATS 
   SUIDB.STATSIZE       = "12";
   SUIDB.STATSCOLOR     = true;
   SUIDB.STATSCLOCK     = false;

   --SKINS
   SUIDB.SKINSLITEBAG   = false;
end

--Install
StaticPopupDialogs["INSTALL"] = {
	text = "-------- Welcome to SUI thanks for using it -------- You can Support and Donate me on Twitch.tv/Syiana :)",
	button1 = "Install",
	button2 = "Skip",
	OnAccept = function()
		reset()
		SUIDB.RESET = true;
		ReloadUI()
	end,
	OnCancel = function()
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3, 
  }
  StaticPopup_Show ("INSTALL")
end
end)

--SUI
local SUI = CreateFrame("Frame", "SUIConfig", UIParent, "ButtonFrameTemplate")
SetPortraitToTexture(SUI.portrait,"Interface\\Icons\\Inv_helmet_06")
SUI:SetSize(475, 580)
SUI:SetPoint("CENTER")
SUI:SetClampedToScreen(true)
SUI:EnableMouse(true)
SUI:SetMovable(true)
SUI:RegisterForDrag("LeftButton")
SUI:SetScript("OnDragStart", function(self) self:StartMoving() end)
SUI:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
SUI:Hide()

for i,v in pairs({
	SUIConfigBg,
	SUIConfigTitleBg,
}) do
	v:SetVertexColor(.40, .40, .40)
end 

for i,v in pairs({
SUIConfigPortraitFrame,
SUIConfigTopRightCorner,
SUIConfigTopLeftCorner,
SUIConfigBotRightCorner,
SUIConfigBotLeftCorner,
SUIConfigRightBorder,
SUIConfigLeftBorder,
SUIConfigTopBorder,
SUIConfigBottomBorder,

SUIConfigInsetInsetBottomBorder,
SUIConfigInsetInsetBorderBottom,
SUIConfigInsetInsetBotLeftCorner,
SUIConfigInsetInsetBotRightCorner,
SUIConfigInsetInsetLeftBorder,
SUIConfigInsetInsetRightBorder,
SUIConfigInsetInsetTopBorder,
SUIConfigInsetInsetTopLeftCorner,
SUIConfigInsetInsetTopRightCorner,

SUIConfigBtnCornerRight,
SUIConfigBtnCornerLeft,
SUIConfigButtonBottomBorder,
}) do
	v:SetVertexColor(.30, .30, .30)
end 

--SUI SHOW
local function SUISHOW()

--Backdrop
local backdrop = {
	bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",  
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = true,
	tileSize = 32,
	edgeSize = 32,
	insets = {
	  left = 10,
	  right = 10,
	  top = 10,
	  bottom = 10
	}
}

--[[ PlayerCastbar ]]--
local function SETPLAYERCASTBAR()

	local CBPP = CreateFrame("Frame", "PlayerCastbar", UIParent)
	CBPP:SetSize(235, 145)
	CBPP:SetPoint("CENTER")
	CBPP:SetBackdrop(backdrop)
	CBPP:SetBackdropBorderColor(0.5, 0.5, 0.5)

	local CBPPTitle = CBPP:CreateFontString(nil, nil, "GameFontNormalLarge")
	CBPPTitle:SetPoint("TOP", 0, -16)
	CBPPTitle:SetText("Player Castbar Position") 

	local CBPPX = CreateFrame("EditBox", nil, CBPP, "InputBoxTemplate")
	CBPPX:SetPoint("CENTER", CBPP, "CENTER", 45, 20)
	CBPPX:SetWidth(100)
	CBPPX:SetHeight(10)
	CBPPX:SetAutoFocus(false)
	CBPPX:Show()
	CBPPX:SetText(SUIDB.CBPPlayerX)

	local CBPPXText = CBPP:CreateFontString(nil, nil, "GameFontHighlight")
	CBPPXText:SetPoint("CENTER", CBPPX, "LEFT", -60, 0)
	CBPPXText:SetText("X Position")

	local CBPPY = CreateFrame("EditBox", nil, CBPP, "InputBoxTemplate")
	CBPPY:SetPoint("CENTER", CBPP, "CENTER", 45, -10)
	CBPPY:SetWidth(100)
	CBPPY:SetHeight(10)
	CBPPY:SetAutoFocus(false)
	CBPPY:Show()
	CBPPY:SetText(SUIDB.CBPPlayerY)

	local CBPPYText = CBPP:CreateFontString(nil, nil, "GameFontHighlight")
	CBPPYText:SetPoint("CENTER", CBPPY, "LEFT", -60, 0)
	CBPPYText:SetText("Y Position")

	local CBPPTimer = CreateFrame("CheckButton", nil, CBPP, "OptionsBaseCheckButtonTemplate")
	CBPPTimer:SetPoint("TOPLEFT", CBPPY, "BOTTOMLEFT", -10,-14)
	CBPPTimer:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.CBPPlayerT = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Player Castbar Timer Enabled",0,1,0);
		SUIDB.CBPPlayerT = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Player Castbar Timer Disabled",1,0,0);
		SUIDB.CBPPlayerT = false
	end
	end)
	CBPPTimer:SetChecked(SUIDB.CBPPlayerT)

	local CBPPTimerText = CBPP:CreateFontString(nil, nil, "GameFontHighlight")
	CBPPTimerText:SetPoint("LEFT", CBPPTimer, "RIGHT", 0, 1)
	CBPPTimerText:SetText("Castbar Timer")

	local CBPPButton = CreateFrame("Button", nil, CBPP, "UIPanelButtonTemplate")
	CBPPButton:SetPoint("BOTTOMLEFT", CBPP, "BOTTOMLEFT", 20, 18)
	CBPPButton:SetWidth(50)
	CBPPButton:SetHeight(25)
	CBPPButton:SetText("Save")

	CBPPButton:SetScript("OnClick", function(self, button, down)
	SUIDB.CBPPlayerY = (CBPPY:GetText())
	SUIDB.CBPPlayerX = (CBPPX:GetText())
	CastingBarFrame:SetPoint("CENTER",MainMenuBar,"CENTER", SUIDB.CBPPlayerX,SUIDB.CBPPlayerY)
	CBPP:Hide()
	SUI:Show()
	end)

end

--[[ TargetCastbar ]]--
local function SETTARGETCASTBAR()
	
	--FRAME
	local CBPT = CreateFrame("Frame", "Target Castbar", UIParent)
	CBPT:SetSize(235, 145)
	CBPT:SetPoint("CENTER")
	CBPT:SetBackdrop(backdrop)
	CBPT:SetBackdropBorderColor(0.5, 0.5, 0.5)
	
	local CBPTTitle = CBPT:CreateFontString(nil, nil, "GameFontNormalLarge")
	CBPTTitle:SetPoint("TOP", 0, -16)
	CBPTTitle:SetText("Target Castbar Position") 
	
	--TARGET X
	local CBPTX = CreateFrame("EditBox", nil, CBPT, "InputBoxTemplate")
	CBPTX:SetPoint("CENTER", CBPT, "CENTER", 45, 20)
	CBPTX:SetWidth(100)
	CBPTX:SetHeight(10)
	CBPTX:SetAutoFocus(false)
	CBPTX:Show()
	CBPTX:SetText(SUIDB.CBPTargetX)
	
	local CBPTXText = CBPT:CreateFontString(nil, nil, "GameFontHighlight")
	CBPTXText:SetPoint("CENTER", CBPTX, "LEFT", -60, 0)
	CBPTXText:SetText("X Position")
	
	--TARGET Y
	local CBPTY = CreateFrame("EditBox", nil, CBPT, "InputBoxTemplate")
	CBPTY:SetPoint("CENTER", CBPT, "CENTER", 45, -10)
	CBPTY:SetWidth(100)
	CBPTY:SetHeight(10)
	CBPTY:SetAutoFocus(false)
	CBPTY:Show()
	CBPTY:SetText(SUIDB.CBPTargetY)
	
	local CBPTYText = CBPT:CreateFontString(nil, nil, "GameFontHighlight")
	CBPTYText:SetPoint("CENTER", CBPTY, "LEFT", -60, 0)
	CBPTYText:SetText("Y Position")
	
	--TARGET TIMER
    local CBPTTimer = CreateFrame("CheckButton", nil, CBPT, "OptionsBaseCheckButtonTemplate")
	CBPTTimer:SetPoint("TOPLEFT", CBPTY, "BOTTOMLEFT", -10,-14)
	CBPTTimer:SetScript("OnClick", function(frame)
		local tick = frame:GetChecked()
		SUIDB.CBPTargetT = tick
		if tick then
			DEFAULT_CHAT_FRAME:AddMessage("Target Castbar Timer Enabled",0,1,0);
			SUIDB.CBPTargetT = true
		else
			DEFAULT_CHAT_FRAME:AddMessage("Target Castbar Timer Disabled",1,0,0);
			SUIDB.CBPTargetT = false
		end
	end)
	CBPTTimer:SetChecked(SUIDB.CBPTargetT)

	local CBPTTimerText = CBPT:CreateFontString(nil, nil, "GameFontHighlight")
	CBPTTimerText:SetPoint("LEFT", CBPTTimer, "RIGHT", 0, 1)
	CBPTTimerText:SetText("Castbar Timer")

	--BUTTON
	local CBPTButton = CreateFrame("Button", nil, CBPT, "UIPanelButtonTemplate")
	CBPTButton:SetPoint("BOTTOMLEFT", CBPT, "BOTTOMLEFT", 20, 18)
	CBPTButton:SetWidth(50)
	CBPTButton:SetHeight(25)
	CBPTButton:SetText("Save")
	
	CBPTButton:SetScript("OnClick", function(self, button, down)
	SUIDB.CBPTargetY = (CBPTY:GetText())
	SUIDB.CBPTargetX = (CBPTX:GetText())
	TargetFrameSpellBar:SetPoint("CENTER",CastingBarFrame,"CENTER", SUIDB.CBPTargetX,SUIDB.CBPTargetY)
	CBPT:Hide()
	SUI:Show()
	end)
	
end

--[[ FPS/MS ]]--
local function SETFPSMS()
	
	--FRAME
	local FPSMS = CreateFrame("Frame", "FPS/MS", UIParent)
	FPSMS:SetSize(235, 145)
	FPSMS:SetPoint("CENTER")
	FPSMS:SetBackdrop(backdrop)
	FPSMS:SetBackdropBorderColor(0.5, 0.5, 0.5)
	
	local FPSMSTitle = FPSMS:CreateFontString(nil, nil, "GameFontNormalLarge")
	FPSMSTitle:SetPoint("TOP", 0, -16)
	FPSMSTitle:SetText("FPS/MS Options") 

	--SIZE
	local FPSMSSize = CreateFrame("EditBox", nil, FPSMS, "InputBoxTemplate")
	FPSMSSize:SetPoint("CENTER", FPSMS, "CENTER", -15, 20)
	FPSMSSize:SetWidth(19)
	FPSMSSize:SetHeight(10)
	FPSMSSize:SetAutoFocus(false)
	FPSMSSize:SetMaxLetters(2)
	FPSMSSize:Show()
	FPSMSSize:SetText(SUIDB.STATSIZE)

	local FPSMSizeText = FPSMS:CreateFontString(nil, nil, "GameFontHighlight")
	FPSMSizeText:SetPoint("CENTER", FPSMSSize, "LEFT", -40, 0)
	FPSMSizeText:SetText("Font Size")

	--COLOR
	local FPSMSColor = CreateFrame("CheckButton", nil, FPSMS, "OptionsBaseCheckButtonTemplate")
	FPSMSColor:SetPoint("CENTER", FPSMSSize, "RIGHT", 20,0)
	FPSMSColor:SetScript("OnClick", function(frame)
		local tick = frame:GetChecked()
		SUIDB.STATSCOLOR = tick
		if tick then
			DEFAULT_CHAT_FRAME:AddMessage("FPS/MS Clock Enabled",0,1,0);
			SUIDB.STATSCOLOR = true
		else
			DEFAULT_CHAT_FRAME:AddMessage("FPS/MS Clock Disabled",1,0,0);
			SUIDB.STATSCOLOR = false
		end
	end)
	FPSMSColor:SetChecked(SUIDB.STATSCOLOR)

	local FPSMSColorText = FPSMS:CreateFontString(nil, nil, "GameFontHighlight")
	FPSMSColorText:SetPoint("LEFT", FPSMSColor, "RIGHT", 0, 1)
	FPSMSColorText:SetText("Class Color")

	--CLOCK
	local FPSMSClock = CreateFrame("CheckButton", nil, FPSMS, "OptionsBaseCheckButtonTemplate")
	FPSMSClock:SetPoint("TOPLEFT", FPSMSColor, "BOTTOMLEFT", 0,-10)
	FPSMSClock:SetScript("OnClick", function(frame)
		local tick = frame:GetChecked()
		SUIDB.STATSCLOCK = tick
		if tick then
			DEFAULT_CHAT_FRAME:AddMessage("FPS/MS Clock Enabled",0,1,0);
			SUIDB.STATSCLOCK = true
		else
			DEFAULT_CHAT_FRAME:AddMessage("FPS/MS Clock Disabled",1,0,0);
			SUIDB.STATSCLOCK = false
		end
	end)
	FPSMSClock:SetChecked(SUIDB.STATSCLOCK)

	local FPSMSClockText = FPSMS:CreateFontString(nil, nil, "GameFontHighlight")
	FPSMSClockText:SetPoint("LEFT", FPSMSClock, "RIGHT", 0, 1)
	FPSMSClockText:SetText("Show Clock")

    --BUTTON
	local FPSMSButton = CreateFrame("Button", nil, FPSMS, "UIPanelButtonTemplate")
	FPSMSButton:SetPoint("BOTTOMLEFT", FPSMS, "BOTTOMLEFT", 20, 18)
	FPSMSButton:SetWidth(50)
	FPSMSButton:SetHeight(25)
	FPSMSButton:SetText("Save")
	
	FPSMSButton:SetScript("OnClick", function(self, button, down)
	SUIDB.STATSIZE = (FPSMSSize:GetText())
	FPSMS:Hide()
	SUI:Show()
	end)
	
end

--[[ COLOR ]]--
local function COLOR()
	
	local COLOR = CreateFrame("Frame", "COLOR", UIParent)
	COLOR:SetSize(235, 145)
	COLOR:SetPoint("CENTER")
	COLOR:SetBackdrop(backdrop)
	COLOR:SetBackdropBorderColor(0.5, 0.5, 0.5)
	
	local COLORTitle = COLOR:CreateFontString(nil, nil, "GameFontNormalLarge")
	COLORTitle:SetPoint("TOP", 0, -16)
	COLORTitle:SetText("Set UI Color") 
	
	local COLORButton = CreateFrame("Button", nil, COLOR, "UIPanelButtonTemplate")
	COLORButton:SetPoint("BOTTOMLEFT", COLOR, "BOTTOMLEFT", 20, 18)
	COLORButton:SetWidth(50)
	COLORButton:SetHeight(25)
	COLORButton:SetText("Save")
	
	local COLORTimer = CreateFrame("CheckButton", nil, COLOR, "OptionsBaseCheckButtonTemplate")
	COLORTimer:SetPoint("TOPLEFT", COLORButton, "TOPLEFT", 0,50)
	COLORTimer:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.CLASSCOLOR = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Class Color Enabled",0,1,0);
		SUIDB.CLASSCOLOR = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Class Color Disabled",1,0,0);
		SUIDB.CLASSCOLOR = false
	end
	end)
	COLORTimer:SetChecked(SUIDB.CLASSCOLOR)

	local COLORTimerText = COLOR:CreateFontString(nil, nil, "GameFontHighlight")
	COLORTimerText:SetPoint("LEFT", COLORTimer, "RIGHT", 0, 1)
	COLORTimerText:SetText("Class Color")

	COLORButton:SetScript("OnClick", function(self, button, down)
	COLOR:Hide()
	SUI:Show()
	end)
	
end

--[[ SKINS ]]--
local function SKINS()
	
	local SKINS = CreateFrame("Frame", "COLOR", UIParent)
	SKINS:SetSize(450, 350)
	SKINS:SetPoint("CENTER")
	SKINS:SetBackdrop(backdrop)
	SKINS:SetBackdropBorderColor(0.5, 0.5, 0.5)
	
	local SKINSTitle = SKINS:CreateFontString(nil, nil, "GameFontNormalLarge")
	SKINSTitle:SetPoint("TOP", 0, -16)
	SKINSTitle:SetText("Black AddOns Skins") 
	
	local SKINSButton = CreateFrame("Button", nil, SKINS, "UIPanelButtonTemplate")
	SKINSButton:SetPoint("BOTTOMLEFT", SKINS, "BOTTOMLEFT", 20, 18)
	SKINSButton:SetWidth(50)
	SKINSButton:SetHeight(25)
	SKINSButton:SetText("Save")
	
	local SKINSLiteBag = CreateFrame("CheckButton", nil, SKINS, "OptionsBaseCheckButtonTemplate")
	SKINSLiteBag:SetPoint("LEFT", SKINSTitle, "LEFT", -125,-25)
	SKINSLiteBag:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.SKINSLITEBAG = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("LiteBag Skin Enabled",0,1,0);
		SUIDB.SKINSLITEBAG = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("LiteBag Skin Disabled",1,0,0);
		SUIDB.SKINSLITEBAG = false
	end
	end)
	SKINSLiteBag:SetChecked(SUIDB.SKINSLITEBAG)

	local SKINSLiteBagText = SKINS:CreateFontString(nil, nil, "GameFontHighlight")
	SKINSLiteBagText:SetPoint("LEFT", SKINSLiteBag, "RIGHT", 0, 1)
	SKINSLiteBagText:SetText("LiteBag")

	SKINSButton:SetScript("OnClick", function(self, button, down)
	SKINS:Hide()
	SUI:Show()
	end)
	
end

--[[ TargetCastbar ]]--
local function SETTOOLTIP()
	
	--FRAME
	local SETTOOLTIP = CreateFrame("Frame", "ToolTip", UIParent)
	SETTOOLTIP:SetSize(235, 145)
	SETTOOLTIP:SetPoint("CENTER")
	SETTOOLTIP:SetBackdrop(backdrop)
	SETTOOLTIP:SetBackdropBorderColor(0.5, 0.5, 0.5)
	
	local SETTOOLTIPTitle = SETTOOLTIP:CreateFontString(nil, nil, "GameFontNormalLarge")
	SETTOOLTIPTitle:SetPoint("TOP", 0, -16)
	SETTOOLTIPTitle:SetText("Tooltip Settings") 
	
	--TOOLTIP X
	local SETTOOLTIPX = CreateFrame("EditBox", nil, SETTOOLTIP, "InputBoxTemplate")
	SETTOOLTIPX:SetPoint("CENTER", SETTOOLTIP, "CENTER", 45, 20)
	SETTOOLTIPX:SetWidth(100)
	SETTOOLTIPX:SetHeight(10)
	SETTOOLTIPX:SetAutoFocus(false)
	SETTOOLTIPX:Show()
	SETTOOLTIPX:SetText(SUIDB.TOOLTIPX)
	
	local SETTOOLTIPXText = SETTOOLTIP:CreateFontString(nil, nil, "GameFontHighlight")
	SETTOOLTIPXText:SetPoint("CENTER", SETTOOLTIPX, "LEFT", -60, 0)
	SETTOOLTIPXText:SetText("X Position")
	
	--TOOLTIP Y
	local SETTOOLTIPY = CreateFrame("EditBox", nil, SETTOOLTIP, "InputBoxTemplate")
	SETTOOLTIPY:SetPoint("CENTER", SETTOOLTIP, "CENTER", 45, -10)
	SETTOOLTIPY:SetWidth(100)
	SETTOOLTIPY:SetHeight(10)
	SETTOOLTIPY:SetAutoFocus(false)
	SETTOOLTIPY:Show()
	SETTOOLTIPY:SetText(SUIDB.TOOLTIPY)
	
	local SETTOOLTIPYText = SETTOOLTIP:CreateFontString(nil, nil, "GameFontHighlight")
	SETTOOLTIPYText:SetPoint("CENTER", SETTOOLTIPY, "LEFT", -60, 0)
	SETTOOLTIPYText:SetText("Y Position")
	
	--BUTTON
	local SETTOOLTIPButton = CreateFrame("Button", nil, SETTOOLTIP, "UIPanelButtonTemplate")
	SETTOOLTIPButton:SetPoint("BOTTOMLEFT", SETTOOLTIP, "BOTTOMLEFT", 20, 18)
	SETTOOLTIPButton:SetWidth(50)
	SETTOOLTIPButton:SetHeight(25)
	SETTOOLTIPButton:SetText("Save")
	
	SETTOOLTIPButton:SetScript("OnClick", function(self, button, down)
	SUIDB.TOOLTIPX = (SETTOOLTIPX:GetText())
	SUIDB.TOOLTIPY = (SETTOOLTIPY:GetText())
	SETTOOLTIP:Hide()
	SUI:Show()
	end)
	
end

--[[ Help ]]--
local function HELP()
	
	StaticPopupDialogs["HELP"] = {
		text = "Pls report Errors on WoWInterface.com or wispher me on Twitch.tv/Syiana",
		button1 = "Close",
		button2 = "Reset UI",
		OnAccept = function()
			SUISHOW()
		end,
		OnCancel = function()
			SUIDB.RESET = nil;
			ReloadUI()
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3, 
	  }
	  StaticPopup_Show ("HELP")

end

--[[ SUI ]]--
local title = SUI:CreateFontString(nil, nil, "GameFontNormalLarge")
title:SetPoint("TOP", 0, -32)
title:SetText("SUI Config") 

local button = CreateFrame("Button", nil, SUI, "UIPanelButtonTemplate")
button:SetPoint("BOTTOMLEFT", SUI, "BOTTOMLEFT", 16, 30)
button:SetWidth(100)
button:SetHeight(25)
button:SetText("Save & Reload")

button:SetScript("OnClick", function(self, button, down)
ReloadUI();
end)

local help = CreateFrame("Button", nil, SUI, "UIPanelButtonTemplate")
help:SetPoint("BOTTOMLEFT", SUI, "BOTTOMLEFT", 120, 30)
help:SetWidth(100)
help:SetHeight(25)
help:SetText("Help & Reset")

help:SetScript("OnClick", function(self, button, down)
SUI:Hide()
HELP()
end)

local setplayercastbar = CreateFrame("Button", nil, SUI, "UIPanelButtonGrayTemplate")
setplayercastbar:SetPoint("CENTER", SUI, "RIGHT", -230, -105)
setplayercastbar:SetWidth(125)
setplayercastbar:SetHeight(30)
setplayercastbar:SetText("Player Castbar")

setplayercastbar:SetScript("OnClick", function(self, button, down)
SUI:Hide()
SETPLAYERCASTBAR()
end)

local settargetcastbar = CreateFrame("Button", nil, SUI, "UIPanelButtonGrayTemplate")
settargetcastbar:SetPoint("CENTER", SUI, "RIGHT", -90, -105)
settargetcastbar:SetWidth(125)
settargetcastbar:SetHeight(30)
settargetcastbar:SetText("Target Castbar")

settargetcastbar:SetScript("OnClick", function(self, button, down)
SUI:Hide()
SETTARGETCASTBAR()
end)

local setfpsms = CreateFrame("Button", nil, SUI, "UIPanelButtonGrayTemplate")
setfpsms:SetPoint("CENTER", SUI, "RIGHT", -90, -145)
setfpsms:SetWidth(125)
setfpsms:SetHeight(30)
setfpsms:SetText("FPS/MS")

setfpsms:SetScript("OnClick", function(self, button, down)
SUI:Hide()
SETFPSMS()
end)

local setcolor = CreateFrame("Button", nil, SUI, "UIPanelButtonGrayTemplate")
setcolor:SetPoint("CENTER", SUI, "RIGHT", -230, -145)
setcolor:SetWidth(125)
setcolor:SetHeight(30)
setcolor:SetText("Color")

setcolor:SetScript("OnClick", function(self, button, down)
SUI:Hide()
COLOR()
end)

local setskins = CreateFrame("Button", nil, SUI, "UIPanelButtonGrayTemplate")
setskins:SetPoint("CENTER", SUI, "RIGHT", -230, -185)
setskins:SetWidth(125)
setskins:SetHeight(30)
setskins:SetText("Skins")

setskins:SetScript("OnClick", function(self, button, down)
SUI:Hide()
SKINS()
end)

local settooltip = CreateFrame("Button", nil, SUI, "UIPanelButtonGrayTemplate")
settooltip:SetPoint("CENTER", SUI, "RIGHT", -90, -185)
settooltip:SetWidth(125)
settooltip:SetHeight(30)
settooltip:SetText("Tooltip")

settooltip:SetScript("OnClick", function(self, button, down)
SUI:Hide()
SETTOOLTIP()
end)

local support = SUI:CreateFontString(nil, nil, "GameFontNormalLarge")
support:SetPoint("RIGHT", button, "RIGHT", 330, 25)
support:SetText("Support me on") 
support:SetTextColor(248, 248, 255)

local twitch = SUI:CreateFontString(nil, nil, "GameFontNormalLarge")
twitch:SetPoint("RIGHT", button, "RIGHT", 340, 5)
twitch:SetText("Twitch.tv/Syiana") 
twitch:SetTextColor(248, 248, 255)

-- UI
local UITitle = SUI:CreateFontString(nil, nil, "GameFontNormalLarge")
UITitle:SetPoint("TOPLEFT", 20, -75)
UITitle:SetText("UI") 

--[[ UnitFrames ]]--
local CustomUnitFramesBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
CustomUnitFramesBtn:SetPoint("TOPLEFT", UITitle, "BOTTOMLEFT", 0,-10)
CustomUnitFramesBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.UNITFRAMES = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Unitframes Enabled",0,1,0);
		SUIDB.UNITFRAMES = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Unitframes Disabled",1,0,0);
		SUIDB.UNITFRAMES = false
	end
end)
CustomUnitFramesBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.UNITFRAMES)
end)

CustomUnitFramesBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Bigger Unitframes with Class Colors.", 248, 248, 255)
	GameTooltip:Show()
end)
CustomUnitFramesBtn:SetScript("OnLeave", GameTooltip_Hide)

local CustomUnitFramesBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
CustomUnitFramesBtnText:SetPoint("LEFT", CustomUnitFramesBtn, "RIGHT", 0, 1)
CustomUnitFramesBtnText:SetText("Custom Unitframes")

--[[ Cast Bars ]]--
local CustomCastbarsBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
CustomCastbarsBtn:SetPoint("TOPLEFT", CustomUnitFramesBtn, "BOTTOMLEFT")
CustomCastbarsBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.CASTBARS = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Castbars Enabled",0,1,0);
		SUIDB.CASTBARS = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Castbars Disabled",1,0,0);
		SUIDB.CASTBARS = false
	end
end)
CustomCastbarsBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.CASTBARS)
end)

CustomCastbarsBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Custom Castbar design with Icons and Timers.", 248, 248, 255)
	GameTooltip:Show()
end)
CustomCastbarsBtn:SetScript("OnLeave", GameTooltip_Hide)

local CustomCastbarsBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
CustomCastbarsBtnText:SetPoint("LEFT", CustomCastbarsBtn, "RIGHT", 0, 1)
CustomCastbarsBtnText:SetText("Custom Castbars")

--[[ Hotkeys ]]--
local HotKeysBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
HotKeysBtn:SetPoint("TOPLEFT", CustomCastbarsBtn, "BOTTOMLEFT")
HotKeysBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.HOTKEYS = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Hotkeys Enabled",0,1,0);
		SUIDB.HOTKEYS = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Hotkeys Disabled",1,0,0);
		SUIDB.HOTKEYS = false
	end
end)
HotKeysBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.HOTKEYS)
end)

HotKeysBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows the Actionbar Hotkeys.", 248, 248, 255)
	GameTooltip:Show()
end)
HotKeysBtn:SetScript("OnLeave", GameTooltip_Hide)

local HotKeysBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
HotKeysBtnText:SetPoint("LEFT", HotKeysBtn, "RIGHT", 0, 1)
HotKeysBtnText:SetText("HotKeys")

--[[ Gryphones ]]--
local GryphonesBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
GryphonesBtn:SetPoint("TOPLEFT", HotKeysBtn, "BOTTOMLEFT")
GryphonesBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.GRYPHONES = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Gryphones Enabled",0,1,0);
		SUIDB.GRYPHONES = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Gryphones Disabled",1,0,0);
		SUIDB.GRYPHONES = false
	end
end)
GryphonesBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.GRYPHONES)
end)

GryphonesBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows Gryphones left and right of the Actionsbars.", 248, 248, 255)
	GameTooltip:Show()
end)
GryphonesBtn:SetScript("OnLeave", GameTooltip_Hide)

local GryphonesBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
GryphonesBtnText:SetPoint("LEFT", GryphonesBtn, "RIGHT", 0, 1)
GryphonesBtnText:SetText("Gryphones")

--[[ Chat ]]--
local CustomChatBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
CustomChatBtn:SetPoint("RIGHT", CustomUnitFramesBtn, "RIGHT", 160,0)
CustomChatBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.CHAT = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Custom Chat Enabled",0,1,0);
		SUIDB.CHAT = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Custom Chat Disabled",1,0,0);
		SUIDB.CHAT = false
	end
end)
CustomChatBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.CHAT)
end)

CustomChatBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Hide the chat buttons and moves the Friendlist down to the Bags.", 248, 248, 255)
	GameTooltip:Show()
end)
CustomChatBtn:SetScript("OnLeave", GameTooltip_Hide)

local CustomChatBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
CustomChatBtnText:SetPoint("LEFT", CustomChatBtn, "RIGHT", 0, 1)
CustomChatBtnText:SetText("Custom Chat")

--[[ Tooltip ]]--
local CustomTooltipBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
CustomTooltipBtn:SetPoint("TOPLEFT", CustomChatBtn, "BOTTOMLEFT")
CustomTooltipBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.TOOLTIP = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Custom Tooltip Enabled",0,1,0);
		SUIDB.TOOLTIP = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Custom Tooltip Disabled",1,0,0);
		SUIDB.TOOLTIP = false
	end
end)
CustomTooltipBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.TOOLTIP)
end)

CustomTooltipBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("A custom Tooltip Design shows Guild Ranks etc.", 248, 248, 255)
	GameTooltip:Show()
end)
CustomTooltipBtn:SetScript("OnLeave", GameTooltip_Hide)

local CustomTooltipBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
CustomTooltipBtnText:SetPoint("LEFT", CustomTooltipBtn, "RIGHT", 0, 1)
CustomTooltipBtnText:SetText("Custom Tooltip")

--[[ Dark Frames ]]--
local DarkFramesBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
DarkFramesBtn:SetPoint("TOPLEFT", CustomTooltipBtn, "BOTTOMLEFT")
DarkFramesBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.DARKFRAMES = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Dark Frames Enabled",0,1,0);
		SUIDB.DARKFRAMES = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Dark Frames Disabled",1,0,0);
		SUIDB.DARKFRAMES = false
	end
end)
DarkFramesBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.DARKFRAMES)
end)

DarkFramesBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Skins the Interface Black or the color that you have selected.", 248, 248, 255)
	GameTooltip:Show()
end)
DarkFramesBtn:SetScript("OnLeave", GameTooltip_Hide)

local DarkFramesBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
DarkFramesBtnText:SetPoint("LEFT", DarkFramesBtn, "RIGHT", 0, 1)
DarkFramesBtnText:SetText("Dark Frames")

--[[ Range ]]--
local RangeBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
RangeBtn:SetPoint("TOPLEFT", DarkFramesBtn, "BOTTOMLEFT")
RangeBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.RANGE = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Spell Range Enabled",0,1,0);
		SUIDB.RANGE = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Spell Range Disabled",1,0,0);
		SUIDB.RANGE = false
	end
end)
RangeBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.RANGE)
end)

RangeBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("When your Target is out of range the Actionsbar Buttons are Red.", 248, 248, 255)
	GameTooltip:Show()
end)
RangeBtn:SetScript("OnLeave", GameTooltip_Hide)

local RangeBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
RangeBtnText:SetPoint("LEFT", RangeBtn, "RIGHT", 0, 1)
RangeBtnText:SetText("Spell Range")

--[[ Short Bar ]]--
local ShortBarBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
ShortBarBtn:SetPoint("RIGHT", CustomChatBtn, "RIGHT", 160,0)
ShortBarBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.SHORTBAR = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("ShortBar Enabled",0,1,0);
		SUIDB.SHORTBAR = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("ShortBar Disabled",1,0,0);
		SUIDB.SHORTBAR = false
	end
end)
ShortBarBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.SHORTBAR)
end)

ShortBarBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Custom Actionsbar without Game menu.", 248, 248, 255)
	GameTooltip:Show()
end)
ShortBarBtn:SetScript("OnLeave", GameTooltip_Hide)

local ShortBarBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
ShortBarBtnText:SetPoint("LEFT", ShortBarBtn, "RIGHT", 0, 1)
ShortBarBtnText:SetText("ShortBar")

--[[ Coords ]]--
local CoordsBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
CoordsBtn:SetPoint("TOPLEFT", ShortBarBtn, "BOTTOMLEFT")
CoordsBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.COORDS = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Map Coords Enabled",0,1,0);
		SUIDB.COORDS = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Map Coords Disabled",1,0,0);
		SUIDB.COORDS = false
	end
end)
CoordsBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.COORDS)
end)

CoordsBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows Coords on Bottomleft in the Map.", 248, 248, 255)
	GameTooltip:Show()
end)
CoordsBtn:SetScript("OnLeave", GameTooltip_Hide)

local CoordsBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
CoordsBtnText:SetPoint("LEFT", CoordsBtn, "RIGHT", 0, 1)
CoordsBtnText:SetText("Map Coords")

--[[ OrderhallBar ]]--
local OrderhallBarBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
OrderhallBarBtn:SetPoint("TOPLEFT", CoordsBtn, "BOTTOMLEFT")
OrderhallBarBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.ORDERHALLBAR = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("OrderhallBar Enabled",0,1,0);
		SUIDB.ORDERHALLBAR = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("OrderhallBar Disabled",1,0,0);
		SUIDB.ORDERHALLBAR = false
	end
end)
OrderhallBarBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.ORDERHALLBAR)
end)

OrderhallBarBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows the Orderhallbar at the Top.", 248, 248, 255)
	GameTooltip:Show()
end)
OrderhallBarBtn:SetScript("OnLeave", GameTooltip_Hide)

local OrderhallBarBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
OrderhallBarBtnText:SetPoint("LEFT", OrderhallBarBtn, "RIGHT", 0, 1)
OrderhallBarBtnText:SetText("OrderhallBar")

--[[ TalkingHead ]]--
local TalkingHeadBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
TalkingHeadBtn:SetPoint("TOPLEFT", OrderhallBarBtn, "BOTTOMLEFT")
TalkingHeadBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.TALKINGHEAD = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("TalkingHead Enabled",0,1,0);
		SUIDB.TALKINGHEAD = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("TalkingHead Disabled",1,0,0);
		SUIDB.TALKINGHEAD = false
	end
end)
TalkingHeadBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.TALKINGHEAD)
end)

TalkingHeadBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows the Talkinghead over the Actionbar.", 248, 248, 255)
	GameTooltip:Show()
end)
TalkingHeadBtn:SetScript("OnLeave", GameTooltip_Hide)

local TalkingHeadBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
TalkingHeadBtnText:SetPoint("LEFT", TalkingHeadBtn, "RIGHT", 0, 1)
TalkingHeadBtnText:SetText("TalkingHead")

---------------------
--     MISCS       --
---------------------

local ScriptsTitle = SUI:CreateFontString("ScriptsTitle", nil, "GameFontNormalLarge")
ScriptsTitle:SetPoint("TOPLEFT", GryphonesBtn, "BOTTOMLEFT", 0, -10)
ScriptsTitle:SetText("MISCS")

--[[ Safequeue ]]--
local SafequeueBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
SafequeueBtn:SetPoint("TOPLEFT", ScriptsTitle, "BOTTOMLEFT", 0,-10)
SafequeueBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.SAFEQUEUE = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Safequeue Enabled",0,1,0);
		SUIDB.SAFEQUEUE = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Safequeue Disabled",1,0,0);
		SUIDB.SAFEQUEUE = false
	end
end)
SafequeueBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.SAFEQUEUE)
end)

SafequeueBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows Time left for joining the Arena when the Q pops.", 248, 248, 255)
	GameTooltip:Show()
end)
SafequeueBtn:SetScript("OnLeave", GameTooltip_Hide)

local SafequeueBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
SafequeueBtnText:SetPoint("LEFT", SafequeueBtn, "RIGHT", 0, 1)
SafequeueBtnText:SetText("Safequeue")

--[[ LoseControl ]]--
local LoseControlBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
LoseControlBtn:SetPoint("TOPLEFT", SafequeueBtn, "BOTTOMLEFT")
LoseControlBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.LOSECONTROL = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("LoseControl Enabled",0,1,0);
		SUIDB.LOSECONTROL = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("LoseControl Disabled",1,0,0);
		SUIDB.LOSECONTROL = false
	end
end)
LoseControlBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.LOSECONTROL)
end)

LoseControlBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Hides stuff from the PvP Losecontrol in the Middle of the Screen.", 248, 248, 255)
	GameTooltip:Show()
end)
LoseControlBtn:SetScript("OnLeave", GameTooltip_Hide)

local  LoseControlBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
LoseControlBtnText:SetPoint("LEFT",  LoseControlBtn, "RIGHT", 0, 1)
LoseControlBtnText:SetText("LoseControl")

--[[ TabBinder ]]--
local TabBinderBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
TabBinderBtn:SetPoint("TOPLEFT", LoseControlBtn, "BOTTOMLEFT")
TabBinderBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.TABBINDER = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("TabBinder Enabled",0,1,0);
		SUIDB.TABBINDER  = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("TabBinder Disabled",1,0,0);
		SUIDB.TABBINDER  = false
	end
end)
TabBinderBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.TABBINDER)
end)

TabBinderBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Change the Tabkey to Players only if you are in a PvP Zone.", 248, 248, 255)
	GameTooltip:Show()
end)
TabBinderBtn:SetScript("OnLeave", GameTooltip_Hide)

local  TabBinderBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
TabBinderBtnText:SetPoint("LEFT",  TabBinderBtn, "RIGHT", 0, 1)
TabBinderBtnText:SetText("TabBinder")

--[[ ShowRaid ]]--
local ShowRaidBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
ShowRaidBtn:SetPoint("TOPLEFT", TabBinderBtn, "BOTTOMLEFT")
ShowRaidBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.SHOWRAID = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("ShowRaid Enabled",0,1,0);
		SUIDB.SHOWRAID  = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("ShowRaid Disabled",1,0,0);
		SUIDB.SHOWRAID  = false
	end
end)
ShowRaidBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.SHOWRAID)
end)

ShowRaidBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows the Raidframe also when not in a Group.", 248, 248, 255)
	GameTooltip:Show()
end)
ShowRaidBtn:SetScript("OnLeave", GameTooltip_Hide)

local  ShowRaidBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
ShowRaidBtnText:SetPoint("LEFT",  ShowRaidBtn, "RIGHT", 0, 1)
ShowRaidBtnText:SetText("ShowRaid")

--[[ Hoverbind ]]--
local HoverBindBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
HoverBindBtn:SetPoint("RIGHT", SafequeueBtn, "RIGHT", 160,0)
HoverBindBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.HOVERBIND = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("HoverBind Enabled",0,1,0);
		SUIDB.HOVERBIND = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Hoverbind Disabled",1,0,0);
		SUIDB.HOVERBIND = false
	end
end)
HoverBindBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.HOVERBIND)
end)

HoverBindBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("You can set Keybinds on the Actionsbar when you type /hb in the Chat.", 248, 248, 255)
	GameTooltip:Show()
end)
HoverBindBtn:SetScript("OnLeave", GameTooltip_Hide)

local HoverBindBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
HoverBindBtnText:SetPoint("LEFT", HoverBindBtn, "RIGHT", 0, 1)
HoverBindBtnText:SetText("Hoverbind")

--[[ Charlinks ]]--
local CharlinksBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
CharlinksBtn:SetPoint("TOPLEFT", HoverBindBtn, "BOTTOMLEFT")
CharlinksBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.CHARLINKS = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Charlinks Enabled",0,1,0);
		SUIDB.CHARLINKS = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Charlinks Disabled",1,0,0);
		SUIDB.CHARLINKS = false
	end
end)
CharlinksBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.CHARLINKS)
end)

CharlinksBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("You have a Characterlinks Menu when you Rightclick a Target.", 248, 248, 255)
	GameTooltip:Show()
end)
CharlinksBtn:SetScript("OnLeave", GameTooltip_Hide)

local CharlinksBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
CharlinksBtnText:SetPoint("LEFT",  CharlinksBtn, "RIGHT", 0, 1)
CharlinksBtnText:SetText("Charlinks")

--[[ ItemLevel ]]--
local ItemLevelBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
ItemLevelBtn:SetPoint("TOPLEFT", CharlinksBtn, "BOTTOMLEFT")
ItemLevelBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.ITEMLEVEL = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Item Level Enabled",0,1,0);
		SUIDB.ITEMLEVEL = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Item Level Disabled",1,0,0);
		SUIDB.ITEMLEVEL = false
	end
end)
ItemLevelBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.ITEMLEVEL)
end)

ItemLevelBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows the Itemlevel in the Character Menu.", 248, 248, 255)
	GameTooltip:Show()
end)
ItemLevelBtn:SetScript("OnLeave", GameTooltip_Hide)

local ItemLevelBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
ItemLevelBtnText:SetPoint("LEFT",  ItemLevelBtn, "RIGHT", 0, 1)
ItemLevelBtnText:SetText("ItemLevel")

--[[ InCombat ]]
local InCombatBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
InCombatBtn:SetPoint("TOPLEFT", ItemLevelBtn, "BOTTOMLEFT")
InCombatBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.INCOMBAT = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("InCombat Enabled",0,1,0);
		SUIDB.INCOMBAT = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("InCombat Disabled",1,0,0);
		SUIDB.INCOMBAT = false
	end
end)
InCombatBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.INCOMBAT)
end)

InCombatBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows a CombatIcon on the TargetFrame when the Target is in Combat.", 248, 248, 255)
	GameTooltip:Show()
end)
InCombatBtn:SetScript("OnLeave", GameTooltip_Hide)

local InCombatBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
InCombatBtnText:SetPoint("LEFT",  InCombatBtn, "RIGHT", 0, 1)
InCombatBtnText:SetText("InCombat")

--[[ FriendList ]]--
local FriendListBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
FriendListBtn:SetPoint("RIGHT", HoverBindBtn, "RIGHT", 160,0)
FriendListBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.FRIENDLIST = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Friend Colors Enabled",0,1,0);
		SUIDB.FRIENDLIST = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Friend Colors Disabled",1,0,0);
		SUIDB.FRIENDLIST = false
	end
end)
FriendListBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.FRIENDLIST)
end)

FriendListBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Friendlist Names colored by Class.", 248, 248, 255)
	GameTooltip:Show()
end)
FriendListBtn:SetScript("OnLeave", GameTooltip_Hide)

local FriendListBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
FriendListBtnText:SetPoint("LEFT", FriendListBtn, "RIGHT", 0, 1)
FriendListBtnText:SetText("Friend Colors")

--[[ SGrid ]]--
local SGridBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
SGridBtn:SetPoint("TOPLEFT", FriendListBtn, "BOTTOMLEFT")
SGridBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.SGRID = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("SGrid Enabled",0,1,0);
		SUIDB.SGRID = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("SGrid Disabled",1,0,0);
		SUIDB.SGRID = false
	end
end)
SGridBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.SGRID)
end)

SGridBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Type /sgrid + value 32/64/96/128.", 248, 248, 255)
	GameTooltip:Show()
end)
SGridBtn:SetScript("OnLeave", GameTooltip_Hide)

local SGridBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
SGridBtnText:SetPoint("LEFT",  SGridBtn, "RIGHT", 0, 1)
SGridBtnText:SetText("SGrid")

--[[ Stats ]]--
local StatsBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
StatsBtn:SetPoint("TOPLEFT", SGridBtn, "BOTTOMLEFT")
StatsBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.STATS = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Stats Enabled",0,1,0);
		SUIDB.STATS = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Stats Disabled",1,0,0);
		SUIDB.STATS = false
	end
end)
StatsBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.STATS)
end)

StatsBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows MS/FPS at Bottomright of the Screen you can move it with Alt + Leftclick.", 248, 248, 255)
	GameTooltip:Show()
end)
StatsBtn:SetScript("OnLeave", GameTooltip_Hide)

local StatsBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
StatsBtnText:SetPoint("LEFT",  StatsBtn, "RIGHT", 0, 1)
StatsBtnText:SetText("FPS/MS")

--[[ AutoRep ]]--
local AutoRepBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
AutoRepBtn:SetPoint("TOPLEFT", StatsBtn, "BOTTOMLEFT")
AutoRepBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.AUTOREP = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("AutoRep Enabled",0,1,0);
		SUIDB.AUTOREP = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("AutoRep Disabled",1,0,0);
		SUIDB.AUTOREP = false
	end
end)
AutoRepBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.AUTOREP)
end)

AutoRepBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Auto Repairs your Char when you open a Vendor.", 248, 248, 255)
	GameTooltip:Show()
end)
AutoRepBtn:SetScript("OnLeave", GameTooltip_Hide)

local AutoRepBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
AutoRepBtnText:SetPoint("LEFT",  AutoRepBtn, "RIGHT", 0, 1)
AutoRepBtnText:SetText("AutoRep")

--[[ KeyPress ]]--
local KeyPressBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
KeyPressBtn:SetPoint("TOPLEFT", ShowRaidBtn, "BOTTOMLEFT")
KeyPressBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.KEYPRESS = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("KeyPress Enabled",0,1,0);
		SUIDB.KEYPRESS = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("KeyPress Disabled",1,0,0);
		SUIDB.KEYPRESS = false
	end
end)
KeyPressBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.KEYPRESS)
end)

KeyPressBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("KeyPress shows Visual Effects on the Button that you press on the Actionbar.", 248, 248, 255)
	GameTooltip:Show()
end)
KeyPressBtn:SetScript("OnLeave", GameTooltip_Hide)

local KeyPressBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
KeyPressBtnText:SetPoint("LEFT",  KeyPressBtn, "RIGHT", 0, 1)
KeyPressBtnText:SetText("KeyPress")

--[[ Skins ]]
local SkinsBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
SkinsBtn:SetPoint("TOPLEFT", InCombatBtn, "BOTTOMLEFT")
SkinsBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.SKINS = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Skins Enabled",0,1,0);
		SUIDB.SKINS = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Skins Disabled",1,0,0);
		SUIDB.SKINS = false
	end
end)
SkinsBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.SKINS)
end)

SkinsBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Skins All Frames Black.", 248, 248, 255)
	GameTooltip:Show()
end)
SkinsBtn:SetScript("OnLeave", GameTooltip_Hide)

local SkinsBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
SkinsBtnText:SetPoint("LEFT",  SkinsBtn, "RIGHT", 0, 1)
SkinsBtnText:SetText("Skins Beta!")

--[[ EasyDelete ]]
local EasyDelteBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
EasyDelteBtn:SetPoint("TOPLEFT", AutoRepBtn, "BOTTOMLEFT")
EasyDelteBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.EASYDELETE = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("EasyDelete Enabled",0,1,0);
		SUIDB.EASYDELETE = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("EasyDelete Disabled",1,0,0);
		SUIDB.EASYDELETE = false
	end
end)
EasyDelteBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.EASYDELETE)
end)

EasyDelteBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("When you delete a Item you can just cofirme without typing delete.", 248, 248, 255)
	GameTooltip:Show()
end)
EasyDelteBtn:SetScript("OnLeave", GameTooltip_Hide)

local EasyDelteBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
EasyDelteBtnText:SetPoint("LEFT",  EasyDelteBtn, "RIGHT", 0, 1)
EasyDelteBtnText:SetText("EasyDelete")

---------------------
--    ANNOUNCE     --
---------------------

local AnnounceTitle = SUI:CreateFontString("AnnounceTitle", nil, "GameFontNormalLarge")
AnnounceTitle:SetPoint("TOPLEFT", ShowRaidBtn, "BOTTOMLEFT", 0, -35)
AnnounceTitle:SetText("ANNOUNCE")

--[[ Interrupt ]]--
local InterruptBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
InterruptBtn:SetPoint("TOPLEFT", AnnounceTitle, "BOTTOMLEFT", 0,-10)
InterruptBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.INTERRUPT = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("Interrupt Enabled",0,1,0);
		SUIDB.INTERRUPT = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("Interrupt Disabled",1,0,0);
		SUIDB.INTERRUPT = false
	end
end)
InterruptBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.INTERRUPT)
end)

InterruptBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Announce your Interrupts in the Chat.", 248, 248, 255)
	GameTooltip:Show()
end)
InterruptBtn:SetScript("OnLeave", GameTooltip_Hide)

local InterruptBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
InterruptBtnText:SetPoint("LEFT", InterruptBtn, "RIGHT", 0, 1)
InterruptBtnText:SetText("Interrupt")

--[[ PullTimer ]]--
local PullTimerBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
PullTimerBtn:SetPoint("TOPLEFT", InterruptBtn, "BOTTOMLEFT")
PullTimerBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.AUTOREP = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("PullTimer Enabled",0,1,0);
		SUIDB.PULLTIMER = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("PullTimer Disabled",1,0,0);
		SUIDB.PULLTIMER = false
	end
end)
PullTimerBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.PULLTIMER)
end)

PullTimerBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("Shows a Pulltimer when someone starts a Timer with DBM or Bigwigs.", 248, 248, 255)
	GameTooltip:Show()
end)
PullTimerBtn:SetScript("OnLeave", GameTooltip_Hide)

local PullTimerBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
PullTimerBtnText:SetPoint("LEFT",  PullTimerBtn, "RIGHT", 0, 1)
PullTimerBtnText:SetText("PullTimer")

---------------------
--    FIXEs        --
---------------------

local FIXESTitle = SUI:CreateFontString("FIXESTitle", nil, "GameFontNormalLarge")
FIXESTitle:SetPoint("TOPLEFT", PullTimerBtn, "BOTTOMLEFT", 0, -10)
FIXESTitle:SetText("FIXES")

--[[ Raidframe FIX ]]--
local RaidFrameFixBtn = CreateFrame("CheckButton", nil, SUI, "OptionsBaseCheckButtonTemplate")
RaidFrameFixBtn:SetPoint("TOPLEFT", FIXESTitle, "BOTTOMLEFT", 0,-10)
RaidFrameFixBtn:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	SUIDB.RAIDFRAMEFIX = tick
	if tick then
		DEFAULT_CHAT_FRAME:AddMessage("RaidFrameFix Enabled",0,1,0);
		SUIDB.RAIDFRAMEFIX = true
	else
		DEFAULT_CHAT_FRAME:AddMessage("RaidFrameFix Disabled",1,0,0);
		SUIDB.RAIDFRAMEFIX = false
	end
end)
RaidFrameFixBtn:SetScript("OnShow", function(frame)
frame:SetChecked(SUIDB.RAIDFRAMEFIX)
end)

RaidFrameFixBtn:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
	GameTooltip:AddLine("This is a Fix for the bug when someone leaves the Raid while you are in Combat, but it causing some other Errors i will look into it.", 248, 248, 255)
	GameTooltip:Show()
end)
RaidFrameFixBtn:SetScript("OnLeave", GameTooltip_Hide)

local RaidFrameFixBtnText = SUI:CreateFontString(nil, nil, "GameFontHighlight")
RaidFrameFixBtnText:SetPoint("LEFT", RaidFrameFixBtn, "RIGHT", 0, 1)
RaidFrameFixBtnText:SetText("RaidFrame")

SUI:Show()
end
--[[ Slash Handler ]]--
SlashCmdList["SUI"] = function() SUISHOW()end
SLASH_SUI1 = "/SUI"
