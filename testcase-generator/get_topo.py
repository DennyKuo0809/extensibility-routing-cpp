import xml.etree.ElementTree as ET
import urllib.request
from argparse import ArgumentParser, Namespace
import requests



def arg_parse():
    parser = ArgumentParser()
    parser.add_argument("--name", type=str)
    args = parser.parse_args()
    return args

def show_available():
    from bs4 import BeautifulSoup
    url = 'http://www.topology-zoo.org/dataset.html'
    resp = requests.get(url)
    soup = BeautifulSoup(resp.text, 'lxml')

    links = soup.find_all('a')
    for link in links:
        if 'href' in link.attrs and "graphml" in link['href']:
            print(link['href'][6:][:-8])
    return

def show_map(name):
    url = "http://www.topology-zoo.org/maps/" + name + ".jpg"
    response = requests.get(url)
    if response.status_code == 200:
        import webbrowser
        webbrowser.open_new_tab(url)
    else:
        print("[E] Not the available topology.")

def get_top(name):
    try:
        url = "http://www.topology-zoo.org/files/" + name + ".graphml"
        response = urllib.request.urlopen(url).read()
        tree = ET.fromstring(response)

        num_nodes = 0
        adj = []
        
        for child in tree[-1]:
            if 'id' in child.attrib.keys():
                num_nodes = int(child.attrib['id']) + 1
                adj.append([])
            elif 'source' in child.attrib.keys():
                src = int(child.attrib['source'])
                dst = int(child.attrib['target'])
                adj[src].append(dst)
        
        return num_nodes, adj
    except:
        print("[E] Not the available topology.")
        return None, None

if __name__ == "__main__":
    while(1):
        print("(TopologyZoo)", end=" ")
        c = input()
        if c == "a":
            show_available()
        elif c == "m":
            print("topology name: ", end=" ")
            s = input()
            show_map(s)
        elif c == "t":
            print("topology name: ", end=" ")
            s = input()
            get_top(s)
        elif c == "h":
            print("a: show all avilable\nm: show the map\nt: get the topology\nh: show this message")
        else:
            break