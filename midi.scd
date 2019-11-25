MIDIClient.init;
~midiOut = MIDIOut(1);
~dirt.soundLibrary.addMIDI(\midi, ~midiOut);

(
Pbindef(\aem, \type, \midi, \midiout, a, \chan, 0,
	\scale, Scale.harmonicMinor,
	\dur, 1/2,
	// \degree, Pseq([0,2,4],inf),
	\degree, Pwhite(0,7),
	\octave, 3,
	\legato, Pwhite(),
).play;
)