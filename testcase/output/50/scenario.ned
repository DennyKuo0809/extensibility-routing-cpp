
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
        switch0.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch0.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch1.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch2.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch3.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch4.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch5.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch6.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch7.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch8.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch9.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch10.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch11.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch12.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch13.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch14.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch15.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch16.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch17.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch18.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch19.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch20.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch21.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch22.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch10.ethg++;
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
        switch23.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch23.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch24.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch25.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch26.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch27.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch28.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch29.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch30.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch31.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch32.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch33.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch34.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch35.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch36.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch37.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch38.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch39.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch40.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch41.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch42.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch11.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch18.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch23.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch46.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch43.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch5.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch44.ethg++ <--> EthernetLink <--> switch49.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch5.ethg++;
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
        switch45.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch30.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch33.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch36.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch41.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch45.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch6.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch7.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch8.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch9.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch31.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch32.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch37.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch39.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch47.ethg++;
        switch46.ethg++ <--> EthernetLink <--> switch48.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch20.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch21.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch22.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch27.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch29.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch34.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch35.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch47.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch1.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch3.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch4.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch14.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch15.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch16.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch19.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch24.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch25.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch40.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch42.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch43.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch44.ethg++;
        switch48.ethg++ <--> EthernetLink <--> switch45.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch0.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch2.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch10.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch12.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch13.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch17.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch26.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch28.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch38.ethg++;
        switch49.ethg++ <--> EthernetLink <--> switch40.ethg++;
}
