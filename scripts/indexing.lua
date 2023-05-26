function IndexDevices()
    Motors = {}
    Gearboxes ={}
    for side = 1, 2 do
        local count = DeviceCounts[side]
        for index = 0, count do
            local id = GetDeviceIdSide(side, index)
            local structureId = GetDeviceStructureId(id)
            if IsDeviceFullyBuilt(id) then
                if  GetDeviceType(id) == GearboxSaveName then
                    if not Gearboxes[structureId] then 
                        Gearboxes[structureId] = 1 
                    else
                        Gearboxes[structureId] = Gearboxes[structureId] + 1
                    end
                elseif  GetDeviceType(id) == EngineSaveName then
                    if not Motors[structureId] then 
                        Motors[structureId] = 1 
                    else
                        Motors[structureId] = Motors[structureId] + 1
                    end
                end
            end
            
        end
    end
end

function IndexLinks(frame)
    
    RoadLinks = {}
    
    if frame % 25 == 0 then
        RoadStructures = {}
    end
    RoadCoords = {}
    RoadStructureBoundaries = {}
    EnumerateStructureLinks(0, -1, "DetermineLinks", true)
    for side, teams in pairs(data.teams) do
        for index, team in pairs(teams) do
            EnumerateStructureLinks(team, -1, "DetermineLinks", false)
        end
    end
    IndexRoadStructures(frame)
end

function DetermineLinks(nodeA, nodeB, linkPos, saveName, deviceId)
    --BetterLog(saveName)
    if saveName == RoadSaveName then 
        table.insert(RoadLinks, {nodeA = nodeA, nodeB = nodeB})
    end
    return true
end



function IndexTerrainBlocks()
    data.terrainCollisionBoxes = {}
    local terrainBlockCount = GetBlockCount()

    --loop through all terrain blocks
    for currentBlock = 0, terrainBlockCount - 1 do
        --create new array for that block
        Terrain[currentBlock + 1] = {}
        local vertexCount = GetBlockVertexCount(currentBlock)
        --loop through all vertexes in that block
        for currentVertex = 0, vertexCount - 1 do
            --adds to table for maths
            Terrain[currentBlock + 1][currentVertex + 1] = GetBlockVertexPos(currentBlock, currentVertex)
        end
        data.terrainCollisionBoxes[currentBlock + 1] = MinimumCircularBoundary(Terrain[currentBlock + 1])
        if ModDebug == true then
            SpawnCircle(data.terrainCollisionBoxes[currentBlock + 1], data.terrainCollisionBoxes[currentBlock + 1].r, {r = 255, g = 255, b = 255, a = 255}, 0.04)
        end
        
    end
end