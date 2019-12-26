https://musteresel.github.io/posts/2018/04/install-windows-over-pxe-with-dnsmasq-pxelinux-winpe.html


You must get control over DHCP to configure PXE. If you have a decent router
you should be able to configure it on the router.
I didn't, so I've used computer with linux and connect it to the machine via
ethernet cable.

You might want to check out ./packages for the (non-complete) list of required
packages (for archlinux).

Configure connection with the machine (see ./eno1-conf.sh).

Mount Windows iso to ./winiso/ (see ./mount.sh).

Generate winpe.iso (see ./mkwinpeimg.sh).

Start DHCP server (see ./dnsmasq.sh).

Start samba (see ./samba.sh).

Boot the machine from PXE.

Run
	> wpeinit
	> ipconfig
	> net use I: \\192.168.42.1\
	> I:\setup.exe
on the machine.
