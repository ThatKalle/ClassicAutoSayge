-- File: ClassicAutoSayge.lua
-- Name: ClassicAutoSayge
-- Author: ThatKalle
-- Description: A minimalist Darkmoon Faire Sayge auto gossip Addon.
-- Version: 2.1.1

local _, A = ...

A.colorHex = "6ae597"
A.addonName = "|cff" .. A.colorHex .. "ClassicAutoSayge|r "
A.options = {["1"]=true, ["2"]=true, ["3"]=true}

local E = CreateFrame("Frame")
E:RegisterEvent("ADDON_LOADED")
E:RegisterEvent("PLAYER_ENTERING_WORLD")
E:RegisterEvent("GOSSIP_SHOW")
E:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, ...)
end)

function E:ADDON_LOADED(name)
    if name ~= "ClassicAutoSayge" then
        return
    end
    ClassicAutoSayge = ClassicAutoSayge or {}
    ClassicAutoSayge.firstOption = ClassicAutoSayge.firstOption or ""
    ClassicAutoSayge.secondOption = ClassicAutoSayge.secondOption or ""

    if ClassicAutoSayge.loginMessage == nil then
        ClassicAutoSayge.loginMessage = true
    end

    SLASH_CLASSICAUTOSAYGE1 = "/ClassicAutoSayge"
    SLASH_CLASSICAUTOSAYGE2 = "/cas"
    SlashCmdList.CLASSICAUTOSAYGE = function(msg)
        A:SlashCommand(msg)
    end

    A:CreateOptionsMenu()
    A.loaded = true
end

function E:PLAYER_ENTERING_WORLD(login, reloadUI)
    if (login or reloadUI) and ClassicAutoSayge.loginMessage and A.loaded then
        print(A.addonName .. "loaded v" .. GetAddOnMetadata("ClassicAutoSayge", "Version") .. " - /cas")
        if A.options[ClassicAutoSayge.firstOption] then
            print("|cff" .. A.colorHex .. "First Option: |r" .. ClassicAutoSayge.firstOption)
        else
            print("|cff" .. A.colorHex .. "First Option: |rinvalid")
        end
        if A.options[ClassicAutoSayge.secondOption] then
            print("|cff" .. A.colorHex .. "Second Option: |r" .. ClassicAutoSayge.secondOption)
        else
            print("|cff" .. A.colorHex .. "Second Option: |rinvalid")
        end
    end
end

function E:GOSSIP_SHOW()
    local npcGuid = UnitGUID("target") or nil
    if A.options[ClassicAutoSayge.firstOption] and A.options[ClassicAutoSayge.secondOption] then
        if npcGuid then
            local void, void, void, void, void, npcID = strsplit("-", npcGuid)
            if npcID then
                -- Sayge
                if npcID == "14822" then
                    local void, gossipType = GetGossipOptions()
                    if gossipType then
                        if gossipType == "gossip" then
                            local gossipOptionsNum = GetNumGossipOptions()
                            if gossipOptionsNum == 1 then
                                SelectGossipOption(1)
                            end
                            if gossipOptionsNum == 4 then
                                SelectGossipOption(ClassicAutoSayge.firstOption)
                            end
                            if gossipOptionsNum == 3 then
                                SelectGossipOption(ClassicAutoSayge.secondOption)
                            end
                        end
                    end
                end
            end
        end
    end
end

function A:SlashCommand(args)
    local command = strsplit(" ", args, 1)
    command = command:lower()
    InterfaceOptionsFrame_OpenToCategory(A.optionsPanel)
    InterfaceOptionsFrame_OpenToCategory(A.optionsPanel)
end
