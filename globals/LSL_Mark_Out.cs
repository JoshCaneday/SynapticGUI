using Godot;
using System;
using LSL;

public partial class LSL_Mark_Out : Node
{

    StreamInfo inf;
    StreamOutlet outl;
    public override void _Ready()
    {
        inf = new StreamInfo("GUIMarkerStream", "Markers", 1, 0, channel_format_t.cf_string, "JoshuaCanedayRulez");
        outl = new StreamOutlet(inf);
    }

    public void SendMarker(string marker)
    {
        outl.push_sample(new string[] { marker });
    }
}
