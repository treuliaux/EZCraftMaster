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

_G["myHeader"] = myHeader
_G["myText"] = myText

mainFrame:RegisterEvent("TRADE_SKILL_SHOW")
mainFrame:RegisterEvent("TRADE_SKILL_CLOSE")
mainFrame:SetScript(
    "OnEvent",
    function(self, event, ...)
      if event == "TRADE_SKILL_SHOW" then
        showMainFrame(myHeader)
        showText(myText)
      elseif event == "TRADE_SKILL_CLOSE" then
        myHeader:Hide()
        myText:Hide()
      end
    end
)

function showMainFrame(myHeader)
  local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();
  myHeader:SetLabel(tradeskillName .. " " .. currentLevel .. "/" .. maxLevel)
  myHeader:SetUnderlined(true)
  myHeader:SetPoint("TOPLEFT", "TradeSkillFrame", "TOPRIGHT", -25, -18)
  myHeader:SetWidth(300)
  myHeader:Show()
end

function showText(myText)

  local backdrop = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 1,
    tile = false,
    tileSize = 0,
    insets = {
        left = 0,
        right = 0,
        top = 1,
        bottom = -400,
    },
  }

  myText:SetText('This is the power of headers. Great for writing text and sectioning menus.')
  myText:SetFont('GameFontHighlightSmall')
  myText:SetPoint("TOPLEFT", "TradeSkillFrame", "TOPRIGHT", -25, -40)
  myText:SetWidth(300)
  myText:SetHeight(800)
  myText:SetBackdrop(backdrop)
  myText:Show()
end 