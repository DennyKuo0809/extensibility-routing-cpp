
package inet.tutorials.extensibility_routing;
import inet.networks.base.TsnNetworkBase;
import inet.node.ethernet.EthernetLink;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;

module LocalTsnSwitch extends TsnSwitch
{
    @defaultStatistic("gateStateChanged:vector"; module="eth[0].macLayer.queue.gate[0]");
}
network TSN_multipath extends TsnNetworkBase
{
    submodules:
        host0: TsnDevice {
            @display("p=300,200");
        }
        switch0: LocalTsnSwitch {
            @display("p=300,200");
        }

        host1: TsnDevice {
            @display("p=300,200");
        }
        switch1: LocalTsnSwitch {
            @display("p=300,200");
        }

        host2: TsnDevice {
            @display("p=300,200");
        }
        switch2: LocalTsnSwitch {
            @display("p=300,200");
        }

        host3: TsnDevice {
            @display("p=300,200");
        }
        switch3: LocalTsnSwitch {
            @display("p=300,200");
        }

        host4: TsnDevice {
            @display("p=300,200");
        }
        switch4: LocalTsnSwitch {
            @display("p=300,200");
        }

        host5: TsnDevice {
            @display("p=300,200");
        }
        switch5: LocalTsnSwitch {
            @display("p=300,200");
        }

        host6: TsnDevice {
            @display("p=300,200");
        }
        switch6: LocalTsnSwitch {
            @display("p=300,200");
        }

        host7: TsnDevice {
            @display("p=300,200");
        }
        switch7: LocalTsnSwitch {
            @display("p=300,200");
        }

        host8: TsnDevice {
            @display("p=300,200");
        }
        switch8: LocalTsnSwitch {
            @display("p=300,200");
        }

        host9: TsnDevice {
            @display("p=300,200");
        }
        switch9: LocalTsnSwitch {
            @display("p=300,200");
        }

    connections:
        host0.ethg++ <--> EthernetLink <--> switch0.ethg++;
        host1.ethg++ <--> EthernetLink <--> switch1.ethg++;
        host2.ethg++ <--> EthernetLink <--> switch2.ethg++;
        host3.ethg++ <--> EthernetLink <--> switch3.ethg++;
        host4.ethg++ <--> EthernetLink <--> switch4.ethg++;
        host5.ethg++ <--> EthernetLink <--> switch5.ethg++;
        host6.ethg++ <--> EthernetLink <--> switch6.ethg++;
        host7.ethg++ <--> EthernetLink <--> switch7.ethg++;
        host8.ethg++ <--> EthernetLink <--> switch8.ethg++;
        host9.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch8.ethg++;
}
