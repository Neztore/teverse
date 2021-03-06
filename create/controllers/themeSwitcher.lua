local controller = {}

local uiController = require("tevgit:create/controllers/ui.lua")
local themeController = require("tevgit:create/controllers/theme.lua")

controller.window = nil
controller.workshop = nil
controller.scrollView = nil

function controller.createUI(workshop) 
    controller.workshop = workshop
    controller.window = uiController.createWindow(workshop.interface, guiCoord(1, -400, 1, -50), guiCoord(0, 80, 0, 50), "Theme")
    controller.window.visible = false

    local toolsController = require("tevgit:create/controllers/tool.lua")
    local themeSwitcherButton = toolsController.createButton("windowsTab", "fa:s-swatchbook", "Themes")
    themeSwitcherButton:mouseLeftReleased(function ()
        controller.window.visible = not controller.window.visible
    end)

    local darkBtn = engine.construct("guiFrame", controller.window.content, {
        name = "input",
        size = guiCoord(0, 20, 0, 20),
        position = guiCoord(0, 5, 0, 5),
        text = "",
        backgroundAlpha = 0.75,
        backgroundColour = colour:fromRGB(66, 66, 76)
    })

    local lightBtn = engine.construct("guiFrame", controller.window.content, {
        name = "input",
        size = guiCoord(0, 20, 0, 20),
        position = guiCoord(0, 30, 0, 5),
        text = "",
        backgroundAlpha = 0.75,
        backgroundColour = colour:fromRGB(200,200,200)
    })

    local moreBtn = engine.construct("guiTextBox", controller.window.content, {
        name = "input",
        size = guiCoord(0, 20, 0, 20),
        position = guiCoord(0, 55, 0, 5),
        text = "+",
        backgroundAlpha = 0.75,
        backgroundColour = colour(1, 1, 1),
        textColour = colour(0, 0, 0),
        align = enums.align.middle
    })

    darkBtn:mouseLeftReleased(function()
        themeController.set(themeController.darkTheme)
    end)
    
    lightBtn:mouseLeftReleased(function()
        themeController.set(themeController.lightTheme)
    end)
    
    moreBtn:mouseLeftReleased(function()
        print("Open main theme chooser!")
    end)
end

return controller