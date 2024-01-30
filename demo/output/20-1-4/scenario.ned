
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

        host10: TsnDevice {
            @display("p=300,200");
        }
        switch10: LocalTsnSwitch {
            @display("p=300,200");
        }

        host11: TsnDevice {
            @display("p=300,200");
        }
        switch11: LocalTsnSwitch {
            @display("p=300,200");
        }

        host12: TsnDevice {
            @display("p=300,200");
        }
        switch12: LocalTsnSwitch {
            @display("p=300,200");
        }

        host13: TsnDevice {
            @display("p=300,200");
        }
        switch13: LocalTsnSwitch {
            @display("p=300,200");
        }

        host14: TsnDevice {
            @display("p=300,200");
        }
        switch14: LocalTsnSwitch {
            @display("p=300,200");
        }

        host15: TsnDevice {
            @display("p=300,200");
        }
        switch15: LocalTsnSwitch {
            @display("p=300,200");
        }

        host16: TsnDevice {
            @display("p=300,200");
        }
        switch16: LocalTsnSwitch {
            @display("p=300,200");
        }

        host17: TsnDevice {
            @display("p=300,200");
        }
        switch17: LocalTsnSwitch {
            @display("p=300,200");
        }

        host18: TsnDevice {
            @display("p=300,200");
        }
        switch18: LocalTsnSwitch {
            @display("p=300,200");
        }

        host19: TsnDevice {
            @display("p=300,200");
        }
        switch19: LocalTsnSwitch {
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
        host10.ethg++ <--> EthernetLink <--> switch10.ethg++;
        host11.ethg++ <--> EthernetLink <--> switch11.ethg++;
        host12.ethg++ <--> EthernetLink <--> switch12.ethg++;
        host13.ethg++ <--> EthernetLink <--> switch13.ethg++;
        host14.ethg++ <--> EthernetLink <--> switch14.ethg++;
        host15.ethg++ <--> EthernetLink <--> switch15.ethg++;
        host16.ethg++ <--> EthernetLink <--> switch16.ethg++;
        host17.ethg++ <--> EthernetLink <--> switch17.ethg++;
        host18.ethg++ <--> EthernetLink <--> switch18.ethg++;
        host19.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch16.ethg++;
}
