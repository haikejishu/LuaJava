

sys = luajava.bindClass("java.lang.System")





print(getmetatable (sys))
sys =nil 
collectgarbage("collect")

y= luajava.bindClass("java.lang.System")
print(getmetatable (y))
y = nil 
collectgarbage("collect")

z = luajava.bindClass("java.lang.System")
print(getmetatable (z))
z= nil
collectgarbage("collect")


