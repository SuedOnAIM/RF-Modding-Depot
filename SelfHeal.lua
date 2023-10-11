-- Register the behaviour
behaviour("SelfHeal")

function SelfHeal:Start()
    self.wpn = self.gameObject.GetComponent(Weapon)
    self.dataContainer = self.gameObject.GetComponent(DataContainer)
    self.healamount = self.dataContainer.GetFloat("healAmount")
    self.maxHP = Player.actor.maxHealth

    self.healTimer = self.dataContainer.GetFloat("healTimer")
    self.healing = false
    --[[if self.wpn == nil then
        return
    end]]
    self.wpn.onFire.AddListener(self, "OnWeaponFire")
end

function SelfHeal:OnWeaponFire()
    self.healing = true
end

function SelfHeal:Update()
    if self.healing == true then
        self.healTimer = self.healTimer - Time.deltaTime
        if self.healTimer <= 0 then
            if Player.actor.health + self.healamount < self.maxHP then
                Player.actor.health = Player.actor.health + self.healamount
                self.healing = false
                self.healTimer = self.dataContainer.GetFloat("healTimer")
            elseif Player.actor.health + self.healamount > self.maxHP then
                Player.actor.health = self.maxHP
                self.healing = false
                self.healTimer = self.dataContainer.GetFloat("healTimer")
            end
        end
    end
end