local mainFrame = CreateFrame("Frame",nil,UIParent)
mainFrame:Hide()
mainFrame:SetFrameStrata("BACKGROUND")
mainFrame:SetWidth(300)
mainFrame:SetHeight(120)
mainFrame:SetPoint("CENTER", 0, 0)

local t = mainFrame:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp")
t:SetAllPoints(mainFrame)
mainFrame.texture = t

mainFrame:RegisterEvent("TRADE_SKILL_SHOW")
mainFrame:RegisterEvent("TRADE_SKILL_CLOSE")
mainFrame:SetScript(
    "OnEvent",
    function(self, event, ...)
	if event == "TRADE_SKILL_SHOW" then
		-- print(GetTradeSkillSelectionIndex())
		local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();
		print(GetFirstTradeSkill())
		print(currentLevel)
		mainFrame:Show()
	elseif event == "TRADE_SKILL_CLOSE" then
		mainFrame:Hide()
	end
    end
)

