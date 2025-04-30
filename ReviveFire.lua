-- Register the behaviour
behaviour("ReviveFire")

function ReviveFire:Start()
    self.weapon = self.script.gameObject.GetComponent(Weapon)
    self.weapon.onFire.AddListener(self, "onFire")
end

function ReviveFire:onFire()
    local ray = Ray(self.weapon.currentMuzzleTransform.position, self.weapon.currentMuzzleTransform.forward)

    local targets = Physics.RaycastAll(ray, 2, RaycastTarget.ProjectileHit)
    for i = #targets, 1, -1 do
        local target = targets[i]
        local actor = target.collider.gameObject.GetComponentInParent(Actor)
        if (actor) then
            self:revive(actor)
            break
        else
            break
        end
    end
end

function ReviveFire:revive(actor)
    if (actor.isDead) then
        actor.SpawnAt(actor.position)
        Player.actor.squad.AddMember(actor)
    end
end
