-- File: ClassicAutoSayge.lua
-- Name: ClassicAutoSayge
-- Author: ThatKalle
-- Description: A minimalist Darkmoon Faire Sayge auto gossip Addon.
-- Version: 1.0.0

local firstOption = 2
local secondOption = 1

casFrame = CreateFrame("FRAME")

local function casRegisterEvents()
    casFrame:RegisterEvent("GOSSIP_SHOW")
end

local function SkipGossip()
    local void, gossipType = GetGossipOptions()
    if gossipType then
        if gossipType == "gossip" then
            local gossipOptionsNum = GetNumGossipOptions()
            if gossipOptionsNum == 1 then
                SelectGossipOption(1)
            end
            if gossipOptionsNum == 4 then
                print("Selecting Option " .. firstOption)
                SelectGossipOption(firstOption)
            end
            if gossipOptionsNum == 3 then
                print("Selecting Option " .. secondOption)
                SelectGossipOption(secondOption)
            end
        end
    end
end

casRegisterEvents()

casFrame:SetScript("OnEvent", function(__, event)
    if (event == "GOSSIP_SHOW") then
        local npcGuid = UnitGUID("target") or nil
        if npcGuid then
            local void, void, void, void, void, npcID = strsplit("-", npcGuid)
            if npcID then
                if npcID == "14822" -- Sayge
                then
                    SkipGossip()
                    return
                end
            end
        end
    end
end)
