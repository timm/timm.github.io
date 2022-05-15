return {
  author="Tim Menzies",
  site="Tim Menzies",
  page= {},
  markup = function (text,render)
             return markdown(render(text))
           end,
  rimg = function (text,render)
               return "<img src='img/" .. render(text) .. "' align=right width=150>"
         end,
  css = {
    {url= "fonts.googleapis.com/css?family=Lato:400,700"},
    {url="local.css"}
  },
  home="menzies.us",
  mantra="ex-nurse, taxi-driver, journalist, rocketman (hey, it all made sense at the time)",
  footer =[[
 ,-_|\    "And I somehow fancy that I'd like to change with Clancy,             
/     \    Like to take a turn at droving where the seasons come and go,        
\_,-._*    While he faced the round eternal of grant writings and the journals -
     v     But I doubt he'd like the coding, Clancy, of 'The Overflow'."        ]]
}
