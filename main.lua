-- PANEL COMPLETO Y ORDENADO
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
screenGui.Name = "CustomPanelUI"
screenGui.ResetOnSpawn = false

local panel = Instance.new("Frame", screenGui)
panel.Size = UDim2.new(0, 300, 0, 350)
panel.Position = UDim2.new(0, 100, 0, 160)
panel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
panel.Active = true
panel.Draggable = true
panel.Visible = false

local uicorner = Instance.new("UICorner", panel)
uicorner.CornerRadius = UDim.new(0, 10)

-- Toggle Panel al hacer clic en el icono
local icon = game:GetService("CoreGui"):WaitForChild("FloatingIcon"):FindFirstChild("DraggableIcon")
if icon then
	icon.MouseButton1Click:Connect(function()
		panel.Visible = not panel.Visible
	end)
end

-- Botones de secciones
local buttonHolder = Instance.new("Frame", panel)
buttonHolder.Size = UDim2.new(1, 0, 0, 40)
buttonHolder.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", buttonHolder)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.Padding = UDim.new(0, 5)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local sectionNames = {"Juegos Populares", "Comandos", "Utilidades", "Créditos"}
local sections = {}

for _, name in ipairs(sectionNames) do
	local button = Instance.new("TextButton", buttonHolder)
	button.Size = UDim2.new(0, 140, 1, -10)
	button.Text = name
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 14

	local uiCorner = Instance.new("UICorner", button)
	uiCorner.CornerRadius = UDim.new(0, 6)

	local frame = Instance.new("Frame", panel)
	frame.Size = UDim2.new(1, -20, 1, -60)
	frame.Position = UDim2.new(0, 10, 0, 50)
	frame.BackgroundTransparency = 1
	frame.Visible = false

	local list = Instance.new("UIListLayout", frame)
	list.Padding = UDim.new(0, 5)
	list.SortOrder = Enum.SortOrder.LayoutOrder

	sections[name] = frame

	button.MouseButton1Click:Connect(function()
		for secName, secFrame in pairs(sections) do
			secFrame.Visible = (secName == name) and not secFrame.Visible
		end
	end)
end

-- Scripts en Juegos Populares
local juegos = {
	{"Fly Race", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Christianxddd/flyrace/main/main.lua'))()"},
	{"Skibi Toilet", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Christianxddd/SKIB/main/main.lua'))()"},
	{"Anime Punch", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Christianxddd/animeee/main/main.lua'))()"},
	{"Backrooms", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Christianxddd/backroom/main/main.lua'))()"}
}
for _, data in ipairs(juegos) do
	local b = Instance.new("TextButton", sections["Juegos Populares"])
	b.Size = UDim2.new(1, -10, 0, 30)
	b.Text = data[1]
	b.TextColor3 = Color3.fromRGB(255, 255, 255)
	b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.MouseButton1Click:Connect(function()
		loadstring(data[2])()
	end)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
end

-- Comandos
local speed, jump = 16, 50

local function createCommand(name, callback)
	local btn = Instance.new("TextButton", sections["Comandos"])
	btn.Size = UDim2.new(1, -10, 0, 30)
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.MouseButton1Click:Connect(callback)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
end

createCommand("Velocidad +", function()
	speed = speed + 5
	player.Character.Humanoid.WalkSpeed = speed
end)
createCommand("Velocidad -", function()
	speed = math.max(5, speed - 5)
	player.Character.Humanoid.WalkSpeed = speed
end)
createCommand("Salto +", function()
	jump = jump + 10
	player.Character.Humanoid.JumpPower = jump
end)
createCommand("Salto -", function()
	jump = math.max(10, jump - 10)
	player.Character.Humanoid.JumpPower = jump
end)
createCommand("Activar ESP", function()
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character then
			local box = Instance.new("BoxHandleAdornment", plr.Character)
			box.Size = Vector3.new(4, 5, 2)
			box.Color3 = Color3.fromRGB(0, 255, 0)
			box.Transparency = 0.5
			box.Adornee = plr.Character:FindFirstChild("HumanoidRootPart")
			box.AlwaysOnTop = true
		end
	end
end)
createCommand("Desactivar ESP", function()
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr.Character then
			for _, obj in ipairs(plr.Character:GetChildren()) do
				if obj:IsA("BoxHandleAdornment") then
					obj:Destroy()
				end
			end
		end
	end
end)

-- Utilidades
local utilBtn = Instance.new("TextButton", sections["Utilidades"])
utilBtn.Size = UDim2.new(1, -10, 0, 30)
utilBtn.Text = "Infinity Yield"
utilBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
utilBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
utilBtn.Font = Enum.Font.Gotham
utilBtn.TextSize = 14
utilBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
Instance.new("UICorner", utilBtn).CornerRadius = UDim.new(0, 6)

-- Créditos
local creditos = {
	{"YouTube", "https://youtube.com/@gatogamer23"},
	{"Discord", "https://discord.gg/TU-LINK"},
	{"GitHub", "https://github.com/Christianxddd"}
}

for _, c in ipairs(creditos) do
	local b = Instance.new("TextButton", sections["Créditos"])
	b.Size = UDim2.new(1, -10, 0, 30)
	b.Text = c[1]
	b.TextColor3 = Color3.fromRGB(255, 255, 255)
	b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.MouseButton1Click:Connect(function()
		setclipboard(c[2])
	end)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
end
