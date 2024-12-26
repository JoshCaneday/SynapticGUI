using Godot;
using System;
using LSL;

public partial class LSL_Mark_Out : Node
{

    StreamInfo[] inf = new StreamInfo[4];
    StreamOutlet[] outl = new StreamOutlet[4];
    public override void _Ready() { }

    public void prepare_outlet_stream(string streamName, string type, int channelCount, int streamNum)
    {
        //Note that although I use streamName for both the name and sourceID here, in practice streamName should be more of a unique identifier but for now we will just do this
        inf[streamNum-1] = new StreamInfo(streamName, type, channelCount, 0, channel_format_t.cf_string, streamName);
        outl[streamNum-1] = new StreamOutlet(inf[streamNum-1]);
    }

    public void send_sample(float data, int streamNum)
    {
        outl[streamNum-1].push_sample(new float[] { data });
    }
}
