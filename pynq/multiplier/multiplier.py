
# coding: utf-8

# In[1]:


from pynq import Overlay

overlay = Overlay('/home/xilinx/pynq/overlays/multiplier/multiplier.bit')
get_ipython().magic('pinfo overlay')
mult_ip = overlay.my_multiplier_0
get_ipython().magic('pinfo mult_ip')


# In[4]:


mult_ip.write(0x00,0x00030003)
mult_ip.read(0x04)


# In[9]:


#### Auslesen von Zahlen aus einer Datei ####
# pro Zeile eine Zahl
theFile = open("/home/xilinx/pynq/overlays/multiplier/numbers.bin", "r")
theInts = []
for val in theFile.read().split():
    theInts.append(int(val))
theFile.close()


# In[ ]:


get_ipython().magic('matplotlib inline')
import matplotlib.pyplot as plt
plt.plot(theInts)


# In[37]:


#### Durchführen der Multiplikation ####
#mult_ip.write(0x00,0x00070003)
a = 12 # 1. Faktor
b = 12 # 2. Faktor
c=(a<<16)|b # 1. Faktor: 15 downto 0, 2. Faktor: 31 downto 16
mult_ip.write(0x00,c) # Übergabe der Faktoren an PL
mult_ip.read(0x04) # Auslesen des Ergebnisses


# In[23]:




