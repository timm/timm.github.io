lustache = require "lustache"
markdown = require "markdown"
about    = require "about"
----------------------------------------
function render(txt) return lustache:render(txt,about) end

function title(str)    
    for s in str:gmatch"[^\n]+" do
      if string.sub(s,1,2) == "# " then
        return string.sub(s,3)
end end end

function slurp(file)
    local f = io.open(file, "rb")
    local content = f:read("*all")
    f:close()
    return content
end	    
----------------------------------------
news = require "news"
about.news   = news
briefs = {}

klass=1
for i=1,10 do
  if i > #news then break end
  klass = 1 - klass
  tmp   = news[i].item
  tmp.n = klass
  briefs[#briefs + 1] = {item = tmp}
end

about.briefs = briefs
-----------------------------------------
raw = arg[1] and slurp(arg[1]) or f:read("*all")

about.title = title(raw)

about.main = markdown(raw)

print(render(render(slurp("../etc/template.html"))))
