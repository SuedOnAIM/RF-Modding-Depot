behaviour("SoundAmbience")

function SoundAmbience:Start()
    self.targets.AudioSource.SetOutputAudioMixer(AudioMixer.World)
end