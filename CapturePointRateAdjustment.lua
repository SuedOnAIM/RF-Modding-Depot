-- Register the behaviour, script by NefariousDrH
behaviour("CapturePointRateAdjustment")

function CapturePointRateAdjustment:Start()
    self.thisCapturePoint = self.gameObject.GetComponent(CapturePoint)
    self.thisDataContainer = self.gameObject.GetComponent(DataContainer)
    self.newCaptureRate = self.thisDataContainer.GetFloat("newCaptureRate")
end

function CapturePointRateAdjustment:Update()
    self.thisCapturePoint.captureRate = self.newCaptureRate
end