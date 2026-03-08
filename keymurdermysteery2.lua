-- Services
local Clipboard = setclipboard or print -- Uses exploit-specific clipboard function
local CoreGui = game:GetService("CoreGui")

-- Create UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NagiHubKeySystem"
ScreenGui.Parent = (gethui and gethui()) or CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Allows you to move the window
MainFrame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Nagi Hub | Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = MainFrame

-- Close Button (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Parent = MainFrame

-- Key TextBox
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0, 240, 0, 40)
KeyInput.Position = UDim2.new(0.5, -120, 0.4, 0)
KeyInput.PlaceholderText = "Enter Key Here..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Parent = MainFrame

-- Verify Button
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0, 115, 0, 40)
VerifyBtn.Position = UDim2.new(0.5, -120, 0.7, 0)
VerifyBtn.Text = "Verify Key"
VerifyBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Parent = MainFrame

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0, 115, 0, 40)
GetKeyBtn.Position = UDim2.new(0.5, 5, 0.7, 0)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 180)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.Parent = MainFrame

--- Functionality ---

-- Close Script
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Get Key (Copy to Clipboard)
GetKeyBtn.MouseButton1Click:Connect(function()
    local link = "https://link-hub.net/3016568/ot0TrgQjcKIN"
    if setclipboard then
        setclipboard(link)
        GetKeyBtn.Text = "Link Copied!"
        task.wait(2)
        GetKeyBtn.Text = "Get Key"
    else
        warn("Your executor does not support setclipboard.")
    end
end)

-- Verify Key
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "NagiHubKey" then
        VerifyBtn.Text = "Correct! Loading..."
        task.wait(1)
        
        -- Load the actual script
        loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()
        
        -- Destroy the key system
        ScreenGui:Destroy()
    else
        VerifyBtn.Text = "Invalid Key!"
        task.wait(2)
        VerifyBtn.Text = "Verify Key"
    end
end)
