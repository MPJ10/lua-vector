module(...,package.seeall)

Vector = {}
function Vector:New( ... )   
    x = {}
    local nLength = select('#', ...)
    if nLength == 0 then
        x = x or {}
    elseif nLength == 1 then
        x = {...}
    else
        local nNum,value = ...
        for k = 1,nNum do 
            x[k] = nNum
            k = k+1
        end
    end
    setmetatable(x,self)
    self.__index = self
    return x 
end

function Vector:push_back(val)
    table.insert( self, val )
end

function Vector:pop_back(val)
    if self:empty()==false then
      table.remove(self)
    else
        error("empty table")
    end
end

function Vector:at(location)
    if location>#self then
        error("out of range")
    else
        return self[location]
    end
end

function Vector:clear()
    for k = 1, #self do
        table.remove(self)
    end
end

function Vector:erase(beg, ed)
    for k = beg, ed do
        table.remove(self, beg)
    end
end

function Vector:swap(tbVector2)
    if getmetatable(self)==getmetatable(tbVector2) then
        tbTemp = tbVector2
        tbVector2 = self
        self = tbTemp
    end
end

function Vector:assign(num, val)
    self:clear()
    for k=1,num do
        self[k] = val
    end
end

function Vector:empty()
    if self[1]==nil then
        return true
    else
        return false  
    end
end

function Vector:back()
    return(self[#self])
end

function Vector.__eq(va,vb)
    if #va==#vb then
        for k=1,#va do
            if va[k]~=vb[k] then
                return false
            end
        end
        return true
    else
        return false
    end
end

function Vector.__add(va,vb)
    local vc = {}
    setmetatable(vc, Vector)
    Vector.__index=Vector
    for k = 1, #va do
        vc[k]=va[k]
    end
    for k = #va+1, #va+#vb do
        vc[k]=vb[k-#va]
    end
    return vc
end

function Vector:insert(...)
    local nLength = select('#', ...)
    if nLength==0 or nLength==1 then
        error("wrong parameter")
    elseif nLength==2 then
        local pos,val = ...
        table.insert(self, pos, val)
    elseif nLength==3 then
        local pos,num,val = ...
        for k = pos,pos+num-1 do
            table.insert(self, k ,val)
        end
    end
end

function Vector:front()
    return(self[1])
end


