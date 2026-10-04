lua
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")

local active = false

local gui = Instance.new("ScreenGui")
gui.Name = "EloyGalianUI"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local border = Instance.new("Frame")
border.Size = UDim2.new(0, 180, 0, 90)
border.Position = UDim2.new(0.5, -90, 0.7, 0)
border.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
border.BorderSizePixel = 0
border.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = border

local inner = Instance.new("Frame")
inner.Size = UDim2.new(1, -4, 1, -4)
inner.Position = UDim2.new(0, 2, 0, 2)
inner.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
inner.BorderSizePixel = 0
inner.Parent = border

local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(0, 8)
innerCorner.Parent = inner

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 110, 0, 42)
button.Position = UDim2.new(0.5, -55, 0, 8)
button.BackgroundTransparency = 1
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 22
button.Font = Enum.Font.GothamBold
button.Text = "OFF"
button.BorderSizePixel = 0
button.Parent = inner

local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -25)
credit.BackgroundTransparency = 1
credit.TextColor3 = Color3.fromRGB(180, 180, 180)
credit.TextSize = 13
credit.Font = Enum.Font.Gotham
credit.Text = "by: eloygalian"
credit.Parent = inner

local function toggle()
    active = not active
    button.Text = active and "ON" or "OFF"
end

button.MouseButton1Click:Connect(toggle)

UIS.InputBegan:Connect(function(input, processed)
    if processed then
        return
    end

    if input.KeyCode == Enum.KeyCode.E then
        toggle()
    end
end)

task.spawn(function()
    local hue = 0

    while gui.Parent do
        hue = (hue + 0.005) % 1
        border.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        task.wait()
    end
end)

task.spawn(function()
    while gui.Parent do
        if active then
            VIM:SendKeyEvent(true, Enum.KeyCode.F, false, game)
            task.wait(0.05)
            VIM:SendKeyEvent(false, Enum.KeyCode.F, false, game)
            task.wait(0.05)
        else
            task.wait(0.5)
        end
    end
end)
