local mod	= DBM:NewMod(425, "DBM-Party-Classic", 6, 232)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("2019061413859")
mod:SetCreatureID(13601)
mod:SetEncounterID(427)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 21833"
)

--TODO, start or success for spell?
--TODO, support his other spells? technicaly they won't be cast if you stack on him
local warningGoblinDragonGun		= mod:NewSpellAnnounce(21833, 2)

local timerGoblinDragonGunCD		= mod:NewAITimer(180, 21833, nil, nil, nil, 3)

function mod:OnCombatStart(delay)
	timerGoblinDragonGunCD:Start(1-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 21833 then
		warningGoblinDragonGun:Show()
		timerGoblinDragonGunCD:Start()
	end
end
