android_scripts
===============

Helpful scripts for build CM-12.0

QuickStart:

    git clone https://github.com/alwaysadeel/android_scripts.git -b cm-12.0 cm12;
    cd cm12;
    ./repo init -u git://github.com/CyanogenMod/android.git -b cm-12.0;
    ./Update.sh;
    ./CompileROM.sh -u; (Xperia U)
    ./CompileROM.sh -p; (Xperia P)   
    ./CompileROM.sh -s; (Xperia Sola)
    ./CompileROM.sh -g; (Xperia Go) 
    
Patching:

    patch -p1 < ste_patches/bionic.patch
    patch -p1 < ste_patches/external_icu.patch
    patch -p1 < ste_patches/system_core.patch
    patch -p1 < ste_patches/system_vold.patch
    patch -p1 < ste_patches/frameworks/av/001_ste_multimedia.patch
    patch -p1 < ste_patches/frameworks/av/002_ste_audio.patch
    patch -p1 < ste_patches/frameworks/native/001_ste_multimedia.patch
    patch -p1 < ste_patches/frameworks/native/002_hwc_0.3.patch
    patch -p1 < ste_patches/frameworks/native/003_misc_fix.patch
    
and to reverse
    
    patch -p1 -R < ste_patches/bionic.patch
    patch -p1 -R < ste_patches/external_icu.patch
    patch -p1 -R < ste_patches/system_core.patch
    patch -p1 -R < ste_patches/system_vold.patch
    patch -p1 -R < ste_patches/frameworks/av/001_ste_multimedia.patch
    patch -p1 -R < ste_patches/frameworks/av/002_ste_audio.patch
    patch -p1 -R < ste_patches/frameworks/native/001_ste_multimedia.patch
    patch -p1 -R < ste_patches/frameworks/native/002_hwc_0.3.patch
    patch -p1 -R < ste_patches/frameworks/native/003_misc_fix.patch
    
Credits:
    
    @munjeni: Kernel, porting Android Kitkat to Xperia 2012 devices and bugfix
    @aosx team
