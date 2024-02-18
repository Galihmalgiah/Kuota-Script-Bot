BlockID = 4584 -- ID Block
delay = 350 -- Delay Rotation, Recommend 500!!
Trash1 = 5028 -- ID Item Want To Trash
Trash2 = 5030 -- ID Item Want To Trash

seed = BlockID + 1

dialog = [[add_label_with_icon|big|`0Script Rotation`9 By JTFS GT|left|]]..BlockID..[[|
add_spacer|small|
add_textbox|`0Script Information  |left|
add_textbox|`0BlockID         :`c ]] .. BlockID .. [[|left|
add_textbox|`0SeedID          :`c ]] .. seed .. [[|left|
add_textbox|`0Item Target   :`c ]] .. delay .. [[|left|
add_textbox|`0Trash Slot 1    :`c ]] .. Trash1 .. [[|left|
add_textbox|`0Trash Slot 2    :`c ]] .. Trash2 .. [[|left|
add_spacer|small|
add_textbox|`0Rules : |left|
add_textbox|`!- Dont Sell This Free Script!!|left|
add_textbox|`!- Dont Decrypt My Script!!|left|
add_textbox|`!- If You Bought This Script You Are Anak Ajg|left|
add_spacer|small|
add_textbox|`9Tutorial How To Use This Script See On My Youtube, Link Bellow!!|left|
add_textbox|`9Also Dont Forget Join My Discord, Link Bellow!!|left|
add_spacer|small|
add_url_button||`$YouTube``|NOFLAGS|https://youtube.com/c/JTFSGT|Open Link?|0|0|
add_url_button||`$Discord``|NOFLAGS|https://discord.gg/9XBfNh9RUb|Open Link?|0|0|
add_quick_exit|]]

SendPacket(2, "action|input\n|text|Script By JTFS GT")
SendPacket(2, "action|input\n|text|/troll")

var = {}
var.v0 = "OnDialogRequest"
var.v1 = dialog
SendVariant(var)

function t(teks)
p={}
p.v0 = "OnTextOverlay"
p.v1 = ""..teks..""
SendVariant(p)
end

LogToConsole("`0[`9JTFS`0] Script Starting!")

Sleep(700)
EditToggle("ModFly",true)
EditToggle("AntiPunch",true)
EditToggle("Fast Take",true)



function drop(itemID)
SendPacket(2, "action|drop\n|itemID|"..itemID)
SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|"..itemID.."|\ncount|80")
Sleep(1000)
end

function trash(itemID)
for _, v in pairs(GetInventory())
do
if v.id == itemID then
SendPacket(2, "action|trash\n|itemID|"..itemID)
SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..itemID.."|\ncount|"..v.amount)
Sleep(1000)
     end
  end
end

function place(id)
    pkt = {}
    pkt.x = GetLocal().posX
    pkt.y = GetLocal().posY
    pkt.px = math.floor(GetLocal().posX/32)
    pkt.py = math.floor(GetLocal().posY/32)
    pkt.type = 3
    pkt.value = id;
    SendPacketRaw(false, pkt)
end

function Punch()
    pkt = {}
    pkt.type = 3
    pkt.value = 18
    pkt.px = math.floor(GetLocal().posX/32)
    pkt.py = math.floor(GetLocal().posY/32)
    pkt.x = GetLocal().posX
    pkt.y = GetLocal().posY
    SendPacketRaw(false,pkt)
end

function put(x, y)
    pkt = {}
    pkt.x = GetLocal().posX
    pkt.y = GetLocal().posY
    pkt.px = x
    pkt.py = y
    pkt.type = 3
    pkt.value = BlockID
    SendPacketRaw(false, pkt)
end

function hit(x, y)
    pkt = {}
    pkt.type = 3
    pkt.value = 18
    pkt.px = x
    pkt.py = y
    pkt.x = GetLocal().posX
    pkt.y = GetLocal().posY
    SendPacketRaw(false,pkt)
end

function cek(id)
        for _, item in pairs(GetInventory()) do
if (item.id == id) then
return item.amount
                end
        end
        return 0
end


function take(x,y,id)
  local pkt = {}
  pkt.type = 11;
  pkt.value = id;
  pkt.x = x;
  pkt.y = y;
SendPacketRaw(false, pkt)
end

function takes()
  for _, obj in pairs(GetObjectList()) do
    if(math.abs(GetLocal().posX - obj.posX) < 70 and math.abs(GetLocal().posY - obj.posY) < 32) then
Sleep(50)
      take(obj.posX,obj.posY,obj.id)
     end
  end
end

function takes_1()
  for _, obj in pairs(GetObjectList()) do
    if(math.abs(GetLocal().posX - obj.posX) < 70 and math.abs(GetLocal().posY - obj.posY) < 32) then
      take(obj.posX,obj.posY,obj.id)
     end
  end
end

function plant()
Sleep(1000)
t("Bot Status [`2PLANT`0]")
Sleep(500)
   for _, tile in pairs (GetTiles()) do
      if (tile.fg == 0) and GetTiles(tile.x, tile.y + 1).coltype ~= 0 then
         FindPath(tile.x, tile.y)
            Sleep(delay)
               place(seed)
            Sleep(200)
          if cek(seed) == 0 then
          harvest()
           end
        end
     end
end

function harvest()
Sleep(200)
t("Bot Status [`2HARVEST`0]")
Sleep(700)
if cek(BlockID) <= 150 then
for _, tile in pairs(GetTiles()) do
if(tile.fg == seed) and (tile.readyharvest == true) then
    FindPath(tile.x,tile.y)
    Sleep(delay)
       Punch()
        takes_1()
        Sleep(200)
      if cek(BlockID) >= 150 then
      Sleep(1000)
      pnb()
              end
          end
       end
    end
end

function pnb_1()
   while GetTiles(GetLocal().posX//32-1, GetLocal().posY//32).fg == BlockID do
   Sleep(200)
hit(math.floor(GetLocal().posX/32-1),math.floor(GetLocal().posY/32))
     end
if GetTiles(GetLocal().posX//32-1, GetLocal().posY//32).fg == 0 then
Sleep(100)
put(math.floor(GetLocal().posX/32-1),math.floor(GetLocal().posY/32))
   end
end

function pnb()
   Sleep(200)
t("Bot Status [`2BREAKING`0]")
   Sleep(500)
   FindPath(1, 1)
   Sleep(400)
if cek(BlockID) >= 150 then
      Sleep(1500)
      run = true
pnb_block = tonumber(cek(BlockID))
      Sleep(200)
t("Breaking [`2"..pnb_block.."`0] Block")
       while run do
          pnb_1()
         takes()
          if cek(BlockID) == 0 then
     Sleep(500)
          run = false
    Sleep(200)
t("Succes Breaking [`2"..pnb_block.."`0] Block")
Sleep(500)
plant()
         elseif cek(seed) >= 180 then
         run = false
    Sleep(400)
t("Bot Status [`2DROP SEED`0]")
            FindPath(3, 1)
            Sleep(1000)
            drop(seed)
            Sleep(1000)
            FindPath(1, 1)
            Sleep(2000)
            t("Back Breaking [`2"..cek(BlockID).."`0] Block")
             run = true
            end
         end
     end
end



function main()
if cek(Trash1) >= 30 or cek(Trash2) >= 30 then
t("Bot Status [`2TRASHING ITEM`0]")
  Sleep(200)
  trash(Trash1)
  Sleep(500)
  trash(Trash2)
  Sleep(500)
end
     Sleep(200)
     harvest()
     Sleep(200)
     pnb()
     Sleep(200)
     plant()
end

function  AvoidException()
  if pcall(function()
main()
  end) == false then
    AvoidException()
  end
end

AvoidException()