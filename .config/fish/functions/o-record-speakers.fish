function o-record-speakers
ffmpeg -f pulse -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor recording.wav
end

