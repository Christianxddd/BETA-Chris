local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "ChrisPanelGUI"

-- Ícono flotante
local iconButton = Instance.new("ImageButton", ScreenGui)
iconButton.Name = "OpenPanelButton"
iconButton.Size = UDim2.new(0, 50, 0, 50)
iconButton.Position = UDim2.new(0, 20, 0, 100)
iconButton.BackgroundTransparency = 1
iconButton.Image = "rbxassetid://17625889768"

-- Panel principal
local mainPanel = Instance.new("Frame", ScreenGui)
mainPanel.Size = UDim2.new(0, 500, 0, 300)
mainPanel.Position = UDim2.new(0.5, -250, 0.5, -150)
mainPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainPanel.Visible = false
mainPanel.Active = true
mainPanel.Draggable = true

Instance.new("UICorner", mainPanel).CornerRadius = UDim.new(0, 10)

-- Función para crear secciones
local function createSection(name, pos)
	local btn = Instance.new("TextButton", mainPanel)
	btn.Size = UDim2.new(0, 240, 0, 40)
	btn.Position = pos
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

	local content = Instance.new("Frame", mainPanel)
	content.Size = UDim2.new(1, -20, 1, -100)
	content.Position = UDim2.new(0, 10, 0, 90)
	content.BackgroundTransparency = 1
	content.Visible = false

	btn.MouseButton1Click:Connect(function()
		for _, child in ipairs(mainPanel:GetChildren()) do
			if child:IsA("Frame") and child ~= content then
				child.Visible = false
			end
		end
		content.Visible = not content.Visible
	end)

	return content
end

-- Crear secciones
local comandos = createSection("Comandos", UDim2.new(0, 10, 0, 10))
local juegos = createSection("Juegos Populares", UDim2.new(0, 250, 0, 10))
local utilidades = createSection("Utilidades", UDim2.new(0, 10, 0, 60))
local creditos = createSection("Créditos", UDim2.new(0, 250, 0, 60))

-- Contenido: COMANDOS
local velocidad = Instance.new("TextButton", comandos)
velocidad.Size = UDim2.new(0, 180, 0, 30)
velocidad.Position = UDim2.new(0, 0, 0, 0)
velocidad.Text = "Velocidad x2"
velocidad.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
end)

local salto = Instance.new("TextButton", comandos)
salto.Size = UDim2.new(0, 180, 0, 30)
salto.Position = UDim2.new(0, 0, 0, 40)
salto.Text = "Salto x2"
salto.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)

-- Contenido: JUEGOS POPULARES
local blox = Instance.new("TextButton", juegos)
blox.Size = UDim2.new(0, 200, 0, 30)
blox.Position = UDim2.new(0, 0, 0, 0)
blox.Text = "Script Blox Fruits"
blox.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Christianxddd/blox/main/blox.lua"))()
end)

-- Contenido: UTILIDADES
local esp = Instance.new("TextButton", utilidades)
esp.Size = UDim2.new(0, 180, 0, 30)
esp.Position = UDim2.new(0, 0, 0, 0)
esp.Text = "Activar ESP"
esp.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
end)

-- Contenido: CRÉDITOS
local yt = Instance.new("TextButton", creditos)
yt.Size = UDim2.new(0, 180, 0, 30)
yt.Position = UDim2.new(0, 0, 0, 0)
yt.Text = "YouTube: Christianxdd"
yt.MouseButton1Click:Connect(function()
	setclipboard("https://youtube.com/@Christianxdd")
end)

local tiktok = Instance.new("TextButton", creditos)
tiktok.Size = UDim2.new(0, 180, 0, 30)
tiktok.Position = UDim2.new(0, 0, 0, 40)
tiktok.Text = "TikTok: @christianxdd"
tiktok.MouseButton1Click:Connect(function()
	setclipboard("https://tiktok.com/@christianxdd")
end)

-- Alternar visibilidad del panel
local panelVisible = false
iconButton.MouseButton1Click:Connect(function()
	panelVisible = not panelVisible
	mainPanel.Visible = panelVisible
end)
