* DFF testbench
.lib '/home/ff/eecs251b/sky130/sky130_cds/sky130_release_0.0.4/models/sky130.lib.spice' tt
* include the DFF model here, pre-extracted / post-extracted

vvd vdd 0 1.8
vgnd vss 0 0
vin clk 0 PULSE(0, 1.8, 500p, 20p, 20p, 2n, 4n)
vpwl d 0 PWL(0 0 50p 0 60p 1.8)

* Instantiate the DFF, beware of port ordering
c0 q vss 10E-15

.tran 2n 4n
.probe v(clk) v(q) v(d)
.meas tran tplh trig v(clk) val='1.8/2' rise=1 targ v(q) val='1.8/2' rise=1
.plot tran v(clk)

.END
