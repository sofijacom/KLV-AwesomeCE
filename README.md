# KLV-AwesomeCE
![Screenshot(1)](https://github.com/sofijacom/KLV-AwesomeCE/assets/107557749/ead3f990-fc91-43e1-a414-a17b749b4b9b)

#
![Screenshot](https://github.com/sofijacom/KLV-AwesomeCE/assets/107557749/bd707fe1-c0bf-4fa1-b6bc-cd53b4bbf5e7)

# 💗 Assembly of KLV-AwesomeCE 💗

1) Create a folder `KLV-AwesomeCE` typing in the terminal `mkdir -p KLV-AwesomeCE`

2) Open a terminal in the created folder `KLV-AwesomeCE` or go to the folder by typing in the terminal

   - `cd KLV-AwesomeCE`

3) Place the build script  `FR_minimal_void_awesome_rc1.sh` in the created folder.
   
4) Make it executable.`chmod +x FR_minimal_void_awesome_rc1.sh`

5) Enter in terminal `./FR_minimal_void_awesome_rc1.sh`

6) Wait for the build to finish.

7) After the build is complete to package `07firstrib_rootfs` into `07KLV-AwesomeCE-x.x.sfs` where x.x is your build number.

8) Type in terminal.

```
mksquashfs 07firstrib_rootfs 07KLV-AwesomeCE-x.x.sfs -noappend -comp xz -b 512k
```
  - where x.x is your build number.

9) Delete the `07firstrib_rootfs` folder.

##

FirstRib-KLV build script. 

```
./FR_minimal_void_awesome_rc1.sh
```
FirstRib-KLV build script PLUG file.

Example of using a .plug file:

```
./build_firstrib_rootfs.sh void default amd64 f_00_Void_KLV_no-kernel_awesome.plug
```

***f_00_Void_KLV_no-kernel_awesome.plug***  builds a  ***(root filesystem)***  for the Void Linux-based Awesome desktop operating system, similar to **KLV-AwesomeCE**.

To create a complete distribution, all other utilities, tools and configurations are downloaded from a centralized repository and installed as a .tar.gz file.

<p align="center">	
  <img src="https://github.com/sofijacom/sofijacom/blob/main/gray0_ctp_on_line.svg?sanitize=true" />
</p>
