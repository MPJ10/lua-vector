Vector=require("vector")
test1 = Vector.Vector:New(10,1)
test2 = Vector.Vector:New()
test1:push_back(2)
test1:insert(1,5,1)
--[[test3 = test1+test2
print(test1:back())
print(test1:front())
print(test1:empty())
print(test1==test3)]]
--test1:swap(test2)
for k,v in pairs(test1) do
    print("test1", k, v)
end
--[[for k,v in pairs(test3) do
    print("test3", k, v)
end
test3:assign(3, 11)
for k,v in pairs(test3) do
    print("test3", k, v)
end]]