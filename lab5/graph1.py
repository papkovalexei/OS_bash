import os
import matplotlib.pyplot as plt
import numpy as np

def save(save_path, name='', fmt='png'):
    plt.savefig(save_path + '/{}.{}'.format(name, fmt), fmt='png')
def create_graph(_save_path, path, name1):
    f = open(path, 'r')
    text = f.read()
    splited = text.split("\n")
    filter = []
    for s in splited:
        if s != "":
            filter.append(s)

    yArray = np.array(list(map(float, filter)))
    xArray = np.array([x for x in range(0,len(yArray))])
    f.close()
    plt.title(name1)
    plt.plot(xArray, yArray)

    save(_save_path, name=name1, fmt='png')
    plt.figure().clear()
path = input()
create_graph(path, path + "/mem_cach", "mem_cach")
create_graph(path, path + "/mem_free", "mem_free")
create_graph(path, path + "/mem_used", "mem_used")

create_graph(path, path + "/swap_avail", "swap_avail")
create_graph(path, path + "/swap_free", "swap_free")
create_graph(path, path + "/swap_used", "swap_used")
