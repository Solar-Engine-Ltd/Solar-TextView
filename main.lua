local TextView = require("TextView")

local _Cx, _Cy = display.contentCenterX, display.contentCenterY
local _W, _H = display.contentWidth, display.contentHeight

local function generateRandomString()
    l1 = l1 or 1
    l2 = l2 or 99
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789       '
    local length = math.random(l1, l2)
    local str = ""

    charTable = {}
    for c in chars:gmatch"." do
        table.insert(charTable, c)
    end

    for i = 1, length do
        str = str .. charTable[math.random(1, #charTable)]
    end

    return str
end

local bg = display.newRect(_Cx, _Cy, _W, _H)
bg:setFillColor(1)

local tv = TextView{
    x = _Cx,
    y = _H / 4,
    w = _W * 0.9,
    aY = 0,
    text = [[Lorem ipsum dolor sit amet, consectetur          adipiscing elit. Maecenas a velit dignissim, consectetur sapien et, viverra enim. Proin neque ante, fermentum id risus ut, finibus finibus leo. Curabitur nec imperdiet est. Aliquam ultrices volutpat leo quis ullamcorper. Cras eu ante a lorem malesuada cursus. Curabitur consectetur lacinia ante sit amet molestie. Aliquam nisl felis, viverra posuere mollis at, scelerisque at dui.]]
}

local t = [[Lorem ipsum dolor sit amet, consectetur          adipiscing elit. Maecenas a velit dignissim, consectetur sapien et, viverra enim. Proin neque ante, fermentum id risus ut, finibus finibus leo. Curabitur nec imperdiet est. Aliquam ultrices volutpat leo quis ullamcorper. Cras eu ante a lorem malesuada cursus. Curabitur consectetur lacinia ante sit amet molestie. Aliquam nisl felis, viverra posuere mollis at, scelerisque at dui. Integer eu ante sed sem tincidunt ultrices eget id nulla. Sed laoreet purus et odio eleifend, sit amet molestie tellus placerat. Sed finibus ut leo quis condimentum. Fusce eu ornare nisi. Nulla ultricies nisl ex, eget gravida magna convallis eget. Proin ut mauris nec augue semper facilisis. Duis tempor non ligula eget scelerisque. Aliquam eget orci lacinia, tempus est vel, tincidunt enim. Curabitur faucibus neque elit, eu venenatis nunc malesuada vitae. Curabitur dictum turpis metus, id euismod libero ullamcorper ut. Integer ut leo non magna hendrerit interdum. Nunc ac convallis eros, a consequat elit.]]


timer.performWithDelay(3000, function()
    tv:setText(t)
end)