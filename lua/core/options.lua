local p = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = ","

--- UI / Apariencia Visual
p.termguicolors = true -- Habilita colores de 24-bit
p.laststatus = 3 -- Siempre muestra la barra de estado
p.cmdheight = 0 -- Oculta la línea de comandos hasta que se necesite
p.showmode = false -- No mostrar el modo actual (ej. -- INSERT --)
p.colorcolumn = "100" -- Línea vertical en la columna 100
p.signcolumn = "yes" -- Muestra siempre la columna de signos (para git, LSP, etc.)
p.cursorline = true -- Resalta la línea actual del cursor
p.cursorlineopt = "number" -- Resalta solo el número de la línea actual
p.number = true -- Muestra los números de línea
p.conceallevel = 0 -- Muestra todos los símbolos (ej. `*` en Markdown)
p.list = false -- No mostrar caracteres invisibles por defecto
p.listchars = { space = "·", trail = "⋅", tab = "→ " }

--- Comportamiento del Editor
-- Indentación
p.expandtab = true -- Usa espacios en lugar de tabs
p.shiftwidth = 4 -- Tamaño de la indentación
p.tabstop = 4 -- Ancho de un carácter de tabulación
p.softtabstop = 4 -- Espacios a insertar/borrar al usar Tab/Backspace

-- Búsqueda
p.incsearch = true -- Muestra resultados de búsqueda mientras escribes
p.smartcase = true -- Ignora mayúsculas en la búsqueda si todo está en minúsculas

-- Ventanas y Splits
p.splitright = true -- Los nuevos splits verticales aparecen a la derecha
p.splitbelow = true -- Los nuevos splits horizontales aparecen abajo
p.splitkeep = "screen" -- Mantiene la posición del cursor en splits

-- General
p.clipboard = "unnamedplus" -- Sincronización con el portapapeles del sistema
p.mouse = "" -- Deshabilita el ratón
p.updatetime = 250 -- Tiempo para que se disparen eventos como CursorHold
-- p.timeoutlen = 400 -- Tiempo de espera para secuencias de teclas

--- Manejo de Archivos
p.swapfile = false -- No crear archivos swap
p.backup = false -- No crear archivos de backup
p.undofile = true -- Habilita el historial de deshacer persistente
p.undolevels = 10000 -- Niveles máximos de deshacer

-- Ortografía
p.spelllang = { "es", "en" }
p.spell = false -- Deshabilitada por defecto

-- Rendimiento y Arranque
p.shortmess:append("sI") -- Deshabilita el mensaje de bienvenida de Neovim
p.syntax = "off" -- Deshabilita el motor de sintaxis por regex (opcional)

-- Deshabilitar proveedores integrados para acelerar el arranque
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
