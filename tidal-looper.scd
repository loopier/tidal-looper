// https://tidalcycles.org/index.php/Creating_a_live_looper
SuperDirt.start;
(
var diversions=();
var dirt=~dirt;
SynthDef(\rec,{
	|buffer,duration|
	var line = Line.ar(dur:duration, doneAction:2);
	RecordBuf.ar(SoundIn.ar([0,1]), buffer, doneAction: Done.freeSelf, loop: 0);
	 s.record(duration: seconds);  //record to disk in thisProcess.platform.recordingsDir
}).add;

~diversions=diversions;
~diversions[\rec] = {
	var seconds = 1/(~cps*~speed);
	var frames = ~dirt.server.sampleRate*seconds;
	var bufferName = format("rec%",~n.asInteger).asSymbol;
	mod(~cycle,1/~speed).postln;
	if(mod(~cycle,1/~speed)==0,{
		var buffer = Buffer.alloc(~dirt.server,frames,~numChannels);
		~dirt.soundLibrary.addBuffer(bufferName, buffer);
		Synth(\rec,[buffer:buffer,duration:seconds]);
	});
	true;
};
~dirt.orbits[0].defaultParentEvent[\diversion] = { |e| diversions[~s].value; };
)