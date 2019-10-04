local mainFrame = CreateFrame("Frame",nil,UIParent)
mainFrame:Hide()
mainFrame:SetFrameStrata("BACKGROUND")
mainFrame:SetWidth(300)
mainFrame:SetHeight(400)

mainFrame.text = mainFrame:CreateFontString(nil, "ARTWORK")
mainFrame.text:SetFont("Fonts\\ARIALN.ttf", 15, "THICKOUTLINE, MONOCHROME")
mainFrame.text:SetPoint("TOPLEFT",5,-5)
mainFrame.text:SetTextColor(200, 100, 0)

myHeader = SushiHeader()
myText = SushiHeader()
myHeader:Hide()

mainFrame:RegisterEvent("TRADE_SKILL_SHOW")
mainFrame:RegisterEvent("TRADE_SKILL_CLOSE")
mainFrame:SetScript(
    "OnEvent",
    function(self, event, ...)
		if event == "TRADE_SKILL_SHOW" then
			local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();

			myHeader:SetLabel(tradeskillName .. " " .. currentLevel .. "/" .. maxLevel)
			myHeader:SetUnderlined(true)
			myHeader:SetPoint("TOPLEFT", "TradeSkillFrame", "TOPRIGHT", -25, -18)
			myHeader:SetWidth(300)
			--			local texture = myHeader:CreateTexture('BACKGROUND')
			--			texture:SetTexture(1, 0, 1)
			--			texture:SetAllPoints(myHeader)
			--			myHeader.texture = texture
			myHeader:Show()

			myText:SetText('This is the power of headers. Great for writing text and sectioning menus.')
			myText:SetFont('GameFontHighlightSmall')
			myText:SetPoint("TOPLEFT", "TradeSkillFrame", "TOPRIGHT", -25, -40)
			myText:SetWidth(300)
			myText:Show()

	--		myGroup:SetWidth(150)
	--		myGroup:SetPoint("TOPLEFT", "TradeSkillFrame", "TOPRIGHT", -30, -15)

	--		mainFrame:SetPoint("TOPLEFT", "TradeSkillFrame", "TOPRIGHT", -30, -15)
			-- print(GetTradeSkillSelectionIndex())
			-- print(GetFirstTradeSkill())
	--		addSkillText(mainFrame)
			-- print(tradeskillName, currentLevel, maxLevel)
	--		mainFrame:Show()
		elseif event == "TRADE_SKILL_CLOSE" then
			myHeader:Hide()
			myText:Hide()
		end
    end
)

function addSkillText(mainFrame)
	local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();
	mainFrame.text:SetText(tradeskillName .. " " .. currentLevel .. "/" .. maxLevel)
end

