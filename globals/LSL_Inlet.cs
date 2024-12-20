using Godot;
using System;
using LSL;

// Adaptation of essential functions from
// https://github.com/labstreaminglayer/liblsl-Csharp/blob/master/examples/ReceiveData/ReceiveData.cs
public partial class LSL_Inlet : Node
{
    public StreamInfo[] stream_infos;
    private StreamInlet stream_inlet;
    public int num_channels;

    public override void _Ready() { }

    // This is a procedure that connects to a stream given certain properties
    // since we can't really pass around values within GDScript from C#
    // namely, C# types are not available to GDScript I don't think...
    public void connect_to_stream(string prop, string value, int num_channels_)
    {
        StreamInfo[] results = LSL.LSL.resolve_stream(prop, value, 1, 1.0);
        stream_infos = results;
        if (results.Length == 0)
        {
            return;
        }
        stream_inlet = new StreamInlet(results[0]);
        results.DisposeArray();
        num_channels = num_channels_;
    }

    // Takes no arguments with the assumption that global vars were previously set
    public string[] pull_sample(float timeout)
    {
        string[] samples = new string[num_channels];
        stream_inlet.pull_sample(samples, timeout);
        return samples;
    }
    public bool has_stream_inlet()
    {
        return stream_inlet != null;
    }
}
