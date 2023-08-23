
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

        host20: TsnDevice {
            @display("p=300,200");
        }
        switch20: LocalTsnSwitch {
            @display("p=300,200");
        }

        host21: TsnDevice {
            @display("p=300,200");
        }
        switch21: LocalTsnSwitch {
            @display("p=300,200");
        }

        host22: TsnDevice {
            @display("p=300,200");
        }
        switch22: LocalTsnSwitch {
            @display("p=300,200");
        }

        host23: TsnDevice {
            @display("p=300,200");
        }
        switch23: LocalTsnSwitch {
            @display("p=300,200");
        }

        host24: TsnDevice {
            @display("p=300,200");
        }
        switch24: LocalTsnSwitch {
            @display("p=300,200");
        }

        host25: TsnDevice {
            @display("p=300,200");
        }
        switch25: LocalTsnSwitch {
            @display("p=300,200");
        }

        host26: TsnDevice {
            @display("p=300,200");
        }
        switch26: LocalTsnSwitch {
            @display("p=300,200");
        }

        host27: TsnDevice {
            @display("p=300,200");
        }
        switch27: LocalTsnSwitch {
            @display("p=300,200");
        }

        host28: TsnDevice {
            @display("p=300,200");
        }
        switch28: LocalTsnSwitch {
            @display("p=300,200");
        }

        host29: TsnDevice {
            @display("p=300,200");
        }
        switch29: LocalTsnSwitch {
            @display("p=300,200");
        }

        host30: TsnDevice {
            @display("p=300,200");
        }
        switch30: LocalTsnSwitch {
            @display("p=300,200");
        }

        host31: TsnDevice {
            @display("p=300,200");
        }
        switch31: LocalTsnSwitch {
            @display("p=300,200");
        }

        host32: TsnDevice {
            @display("p=300,200");
        }
        switch32: LocalTsnSwitch {
            @display("p=300,200");
        }

        host33: TsnDevice {
            @display("p=300,200");
        }
        switch33: LocalTsnSwitch {
            @display("p=300,200");
        }

        host34: TsnDevice {
            @display("p=300,200");
        }
        switch34: LocalTsnSwitch {
            @display("p=300,200");
        }

        host35: TsnDevice {
            @display("p=300,200");
        }
        switch35: LocalTsnSwitch {
            @display("p=300,200");
        }

        host36: TsnDevice {
            @display("p=300,200");
        }
        switch36: LocalTsnSwitch {
            @display("p=300,200");
        }

        host37: TsnDevice {
            @display("p=300,200");
        }
        switch37: LocalTsnSwitch {
            @display("p=300,200");
        }

        host38: TsnDevice {
            @display("p=300,200");
        }
        switch38: LocalTsnSwitch {
            @display("p=300,200");
        }

        host39: TsnDevice {
            @display("p=300,200");
        }
        switch39: LocalTsnSwitch {
            @display("p=300,200");
        }

        host40: TsnDevice {
            @display("p=300,200");
        }
        switch40: LocalTsnSwitch {
            @display("p=300,200");
        }

        host41: TsnDevice {
            @display("p=300,200");
        }
        switch41: LocalTsnSwitch {
            @display("p=300,200");
        }

        host42: TsnDevice {
            @display("p=300,200");
        }
        switch42: LocalTsnSwitch {
            @display("p=300,200");
        }

        host43: TsnDevice {
            @display("p=300,200");
        }
        switch43: LocalTsnSwitch {
            @display("p=300,200");
        }

        host44: TsnDevice {
            @display("p=300,200");
        }
        switch44: LocalTsnSwitch {
            @display("p=300,200");
        }

        host45: TsnDevice {
            @display("p=300,200");
        }
        switch45: LocalTsnSwitch {
            @display("p=300,200");
        }

        host46: TsnDevice {
            @display("p=300,200");
        }
        switch46: LocalTsnSwitch {
            @display("p=300,200");
        }

        host47: TsnDevice {
            @display("p=300,200");
        }
        switch47: LocalTsnSwitch {
            @display("p=300,200");
        }

        host48: TsnDevice {
            @display("p=300,200");
        }
        switch48: LocalTsnSwitch {
            @display("p=300,200");
        }

        host49: TsnDevice {
            @display("p=300,200");
        }
        switch49: LocalTsnSwitch {
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
        host20.ethg++ <--> EthernetLink <--> switch20.ethg++;
        host21.ethg++ <--> EthernetLink <--> switch21.ethg++;
        host22.ethg++ <--> EthernetLink <--> switch22.ethg++;
        host23.ethg++ <--> EthernetLink <--> switch23.ethg++;
        host24.ethg++ <--> EthernetLink <--> switch24.ethg++;
        host25.ethg++ <--> EthernetLink <--> switch25.ethg++;
        host26.ethg++ <--> EthernetLink <--> switch26.ethg++;
        host27.ethg++ <--> EthernetLink <--> switch27.ethg++;
        host28.ethg++ <--> EthernetLink <--> switch28.ethg++;
        host29.ethg++ <--> EthernetLink <--> switch29.ethg++;
        host30.ethg++ <--> EthernetLink <--> switch30.ethg++;
        host31.ethg++ <--> EthernetLink <--> switch31.ethg++;
        host32.ethg++ <--> EthernetLink <--> switch32.ethg++;
        host33.ethg++ <--> EthernetLink <--> switch33.ethg++;
        host34.ethg++ <--> EthernetLink <--> switch34.ethg++;
        host35.ethg++ <--> EthernetLink <--> switch35.ethg++;
        host36.ethg++ <--> EthernetLink <--> switch36.ethg++;
        host37.ethg++ <--> EthernetLink <--> switch37.ethg++;
        host38.ethg++ <--> EthernetLink <--> switch38.ethg++;
        host39.ethg++ <--> EthernetLink <--> switch39.ethg++;
        host40.ethg++ <--> EthernetLink <--> switch40.ethg++;
        host41.ethg++ <--> EthernetLink <--> switch41.ethg++;
        host42.ethg++ <--> EthernetLink <--> switch42.ethg++;
        host43.ethg++ <--> EthernetLink <--> switch43.ethg++;
        host44.ethg++ <--> EthernetLink <--> switch44.ethg++;
        host45.ethg++ <--> EthernetLink <--> switch45.ethg++;
        host46.ethg++ <--> EthernetLink <--> switch46.ethg++;
        host47.ethg++ <--> EthernetLink <--> switch47.ethg++;
        host48.ethg++ <--> EthernetLink <--> switch48.ethg++;
        host49.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch35.ethg++;
}
