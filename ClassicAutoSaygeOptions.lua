-- File: ClassicAutoSaygeOptions.lua
-- Name: ClassicAutoSayge
-- Author: ThatKalle
-- Description: A minimalist Darkmoon Faire Sayge auto gossip Addon.
-- Version: 2.1.1

local _, A = ...

function A:CreateOptionsMenu()
    local optionsPanel = CreateFrame("Frame", "ClassicAutoSaygeOptions", UIParent)
    optionsPanel.name = "ClassicAutoSayge"
    InterfaceOptions_AddCategory(optionsPanel)

    local text = optionsPanel:CreateFontString(nil, "OVERLAY")
    text:SetFontObject("GameFontNormalHuge")
    text:SetText("ClassicAutoSayge Options")
    text:SetPoint("TOPLEFT", optionsPanel, "TOPLEFT", 20, -10)

    local firstOptionHeader = optionsPanel:CreateFontString(nil, "OVERLAY")
    firstOptionHeader:SetFontObject("GameFontNormal")
    firstOptionHeader:SetText("First Option")
    firstOptionHeader:SetPoint("TOPLEFT", text, "BOTTOMLEFT", 0, -15)

    local firstOptionBox = CreateFrame("EditBox", "firstOptionBox", optionsPanel, "InputBoxTemplate")
    firstOptionBox:SetPoint("TOPLEFT", firstOptionHeader, "BOTTOMLEFT", 5, 0)
    firstOptionBox:SetSize(200, 30)
    firstOptionBox:SetFontObject("ChatFontNormal")
    firstOptionBox:SetMultiLine(false)
    firstOptionBox:SetText(ClassicAutoSayge.firstOption)
    firstOptionBox:SetCursorPosition(0)
    firstOptionBox:SetAutoFocus(false)
    firstOptionBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    firstOptionBox:SetScript("OnKeyUp", function(self)
        ClassicAutoSayge.firstOption = self:GetText()
    end)
    firstOptionBox:SetScript("OnEnterPressed", function(self)
        ClassicAutoSayge.firstOption = self:GetText()
        self:ClearFocus()
    end)
    optionsPanel.firstOptionBox = firstOptionBox

    local secondOptionHeader = optionsPanel:CreateFontString(nil, "OVERLAY")
    secondOptionHeader:SetFontObject("GameFontNormal")
    secondOptionHeader:SetText("Second Option")
    secondOptionHeader:SetPoint("TOPLEFT", text, "TOPRIGHT", 30, -35)

    local secondOptionBox = CreateFrame("EditBox", "secondOptionBox", optionsPanel, "InputBoxTemplate")
    secondOptionBox:SetPoint("TOPLEFT", secondOptionHeader, "BOTTOMLEFT", 5, 0)
    secondOptionBox:SetSize(200, 30)
    secondOptionBox:SetFontObject("ChatFontNormal")
    secondOptionBox:SetMultiLine(false)
    secondOptionBox:SetText(ClassicAutoSayge.secondOption)
    secondOptionBox:SetCursorPosition(0)
    secondOptionBox:SetAutoFocus(false)
    secondOptionBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    secondOptionBox:SetScript("OnKeyUp", function(self)
        ClassicAutoSayge.secondOption = self:GetText()
    end)
    firstOptionBox:SetScript("OnEnterPressed", function(self)
        ClassicAutoSayge.secondOption = self:GetText()
        self:ClearFocus()
    end)
    optionsPanel.secondOptionBox = secondOptionBox

    local loginMessage = CreateFrame("CheckButton", nil, optionsPanel, "UICheckButtonTemplate")
    loginMessage:SetSize(25,25)
    loginMessage:SetPoint("BOTTOMLEFT", optionsPanel, "BOTTOMLEFT", 10, 3)
    loginMessage:SetScript("OnClick", function(self, button)
        ClassicAutoSayge.loginMessage = self:GetChecked()
    end)
    loginMessage:SetChecked(ClassicAutoSayge.loginMessage)
    optionsPanel.loginMessage = loginMessage

    local loginMessageText = loginMessage:CreateFontString(nil, "OVERLAY")
    loginMessageText:SetFontObject("GameFontNormal")
    loginMessageText:SetPoint("LEFT", loginMessage, "RIGHT", 3, 0)
    loginMessageText:SetText("Display login message")
    optionsPanel.loginMessageText = loginMessageText

    A.optionsPanel = optionsPanel

end
