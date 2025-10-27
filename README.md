# carburetor-appimage
Automatic and transparent build for Carburetor 
<br> If you have an old pc or laptop use this command bellow to run carburetor correctly, only if you got an old machine or old NVIDIA card <br/>
<br> `LIBGL_ALWAYS_SOFTWARE=1 ./Carburetor-x86_64.AppImage` <br/>

This new version uses bwrap if you're in ubuntu and the app doesn't work do this.
```
echo 'kernel.apparmor_restrict_unprivileged_userns = 0' | sudo tee /etc/sysctl.d/20-apparmor-lmz.conf
sudo sysctl --system
```
⚠️ Still beging testing for security and stability ⚠️
