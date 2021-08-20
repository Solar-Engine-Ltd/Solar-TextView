local TextView = {
    new = function(self, args)
        local currentText
        local words
        local lines

        local function generateText(o)
            local left = o.x - o.w * o.aX
            local top = o.y
            local width = left + o.w

            if currentText and o.text:match(currentText .. ".*") then
                o.text = o.text:gsub(currentText, "")
            else
                words = {}
                lines = { [1] = {} }
            end

            currentText = o.text

            for capture in o.text:gmatch(".-%s+") do
                local x = #words == 0 and left or words[#words].x + words[#words].width
                local y = #words == 0 and top or words[#words].y

                local word = display.newText{
                    text = capture,
                    x = x,
                    y = y
                }
                word:setFillColor(0)
                word.anchorX = 0
                word.anchorY = 0
                o.parent:insert(word)

                local outOfLimit = word.contentBounds.xMax > width
                if outOfLimit then
                    if capture:match(".-%s+") then
                        word.text = capture:gsub("%s+", "")
                        outOfLimit = word.contentBounds.xMax > width
                    end

                    if outOfLimit then
                        word.y = words[#words].y + words[#words].height
                        word.x = left
                    end

                    lines[#lines + 1] = {}
                end

                words[#words + 1] = word

                -- TODO: replace for list
                lines[#lines][#lines[#lines] + 1] = word
            end

            if #words > 0 then
                words[#words].text = words[#words].text:gsub(" ", "", 1)
            end
        end

        local textViewObject = display.newGroup()

        options = {
            x = tonumber(args.x) or 0,
            y = tonumber(args.y) or 0,
            w = tonumber(args.w) or display.contentWidth,
            h = tonumber(args.h) or nil,
            text = (type(args.text) == "string" or type(args.text) == "number" or type(args.text) == "boolean")
                and tostring(args.text) .. " " or "",
            aX = tonumber(args.aX) or 0.5,
            aY = tonumber(args.aY) or 0.5,
            parent = textViewObject
        };

        generateText(options)

        function textViewObject:setText(t)
            options.text = t
            generateText(options)
        end

        return textViewObject
    end
}

setmetatable(TextView, { __call = function(t, ...) return TextView:new(...) end })

return TextView