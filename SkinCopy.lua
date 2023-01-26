behaviour("SkinCopy")

function SkinCopy:Start()
    self.script.StartCoroutine(self:DelayedStart())
end

function SkinCopy:DelayedStart()
    return function()
		coroutine.yield(WaitForSeconds(3))
        self.gameObject.GetComponent(SkinnedMeshRenderer).sharedMesh = ActorManager.GetTeamSkin(Team.Blue).characterSkin.mesh
        self.gameObject.GetComponent(SkinnedMeshRenderer).sharedMaterials = ActorManager.GetTeamSkin(Team.Blue).characterSkin.materials
    end    
end