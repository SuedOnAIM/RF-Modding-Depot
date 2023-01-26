-- Register the behaviour
behaviour("CapPointAnimation")

function CapPointAnimation:Start()
    self.thisCapturePoint = self.gameObject.GetComponent(CapturePoint)
    GameEvents.onCapturePointCaptured.AddListener(self,"onCapturePointCaptured")
    GameEvents.onCapturePointNeutralized.AddListener(self,"onCapturePointNeutralized")
end

function CapPointAnimation:onCapturePointNeutralized(capturePoint, previousOwner)
    if self.thisCapturePoint.owner == Team.Neutral then 
        self.targets.blueCapObject.gameObject.SetActive(false)
        self.targets.redCapObject.gameObject.SetActive(false)
        self.targets.neutralCapObject.gameObject.SetActive(true)
    end
end

function CapPointAnimation:onCapturePointCaptured(capturePoint, newOwner)
    if self.thisCapturePoint.owner == Team.Blue then
        self.targets.blueCapObject.gameObject.SetActive(true)
        self.targets.redCapObject.gameObject.SetActive(false)
        self.targets.neutralCapObject.gameObject.SetActive(false)
        self.gameObject.GetComponent(CapturePoint).captureRate = 0
    else
        self.targets.blueCapObject.gameObject.SetActive(false)
        self.targets.redCapObject.gameObject.SetActive(true)
        self.targets.neutralCapObject.gameObject.SetActive(false)
    end
end