cl -c -IE:\EASEL-EE -W2 -J -Zpil -G2s -Aflu FntDemo.c

link /a:16 /nod FntDemo, FntDemo.DLL,,  os2+llibcdll+e:\easel-ee\esllib,FntDemo.def
