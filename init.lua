local mainFrame = CreateFrame("Frame",nil,UIParent)
mainFrame:Hide()
mainFrame:SetFrameStrata("BACKGROUND")
mainFrame:SetWidth(300)
mainFrame:SetHeight(400)

--mainFrame:SetBackdrop({
--	bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
--	insets = {top = 0, left = 0, bottom = 0, right = 0},
--})
--mainFrame:SetBackdropColor(1, 1, 1, 0)

local t = mainFrame:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
t:SetAllPoints(mainFrame)
mainFrame.texture = t

mainFrame.text = mainFrame:CreateFontString(nil, "ARTWORK")
mainFrame.text:SetFont("Fonts\\ARIALN.ttf", 15, "THICKOUTLINE, MONOCHROME")
mainFrame.text:SetPoint("TOPLEFT",5,-5)
mainFrame.text:SetTextColor(200, 100, 0)

mainFrame:RegisterEvent("TRADE_SKILL_SHOW")
mainFrame:RegisterEvent("TRADE_SKILL_CLOSE")
mainFrame:SetScript(
    "OnEvent",
    function(self, event, ...)
	if event == "TRADE_SKILL_SHOW" then
		mainFrame:SetPoint("TOPLEFT", "TradeSkillFrame", "TOPRIGHT", -30, -15)
		-- print(GetTradeSkillSelectionIndex())
		-- print(GetFirstTradeSkill())
		addSkillText(mainFrame)
		-- print(tradeskillName, currentLevel, maxLevel)
		mainFrame:Show()
	elseif event == "TRADE_SKILL_CLOSE" then
		mainFrame:Hide()
	end
    end
)

function addSkillText(mainFrame)
	local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();
	mainFrame.text:SetText(tradeskillName .. " " .. currentLevel .. "/" .. maxLevel)
end

