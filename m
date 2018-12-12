From: bbrezillon@kernel.org (Boris Brezillon)
Date: Wed, 12 Dec 2018 09:52:11 +0100
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
In-Reply-To: <4FE5C6B6-5235-4B45-B57E-61416203B7D5@cadence.com>
References: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
 <20181210204330.76e6b615@bbrezillon>
 <20181210211411.7f64f5cb@bbrezillon>
 <3f21dc46-97e1-1a64-a91b-07e623d82184@synopsys.com>
 <20181211125832.7a7b224f@bbrezillon>
 <ccf3667b-a491-759e-a476-e795df4ab9cb@synopsys.com>
 <20181211132103.34ae80c8@bbrezillon>
 <20181211132446.4d93fd10@bbrezillon>
 <ff58869b-acdd-28e4-0e89-72b46e54d5b9@synopsys.com>
 <AACD7E8D-80FA-453B-AB9E-9A0D84598123@cadence.com>
 <20181212092103.5f0f7217@bbrezillon>
 <4FE5C6B6-5235-4B45-B57E-61416203B7D5@cadence.com>
Message-ID: <20181212095211.060a44a9@bbrezillon>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org

On Wed, 12 Dec 2018 08:37:18 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> Hi Boris,
> 
> ?On 12/12/18, 9:21 AM, "Boris Brezillon" <bbrezillon@kernel.org> wrote:
> 
>     EXTERNAL MAIL
>     
>     
>     Hi Przemek,
>     
>     On Wed, 12 Dec 2018 06:06:18 +0000
>     Przemyslaw Gaj <pgaj@cadence.com> wrote:
>     
>     >     
>     >     I measured in my setup with a scope and the additional time to get that information is around 110 us per device and with only one device the bus takes around 550 us for the initialization.
>     >     
>     > So, for now, we are transferring the same information two times over the bus, during DAA procedure and then manually. Three commands per device GETBCR/DCR/PID need six register accesses to write (in our controller). Don't you think it is more significant overhead? I'm just wondering.  
>     
>     Not really, and I think it's actually more than 3 reg accesses per
>     device (you also have to clear the interrupts and read the RX FIFO). My
>     point is, this should only happen once at init (DAA) time and once in a
>     while if devices are joining the bus afterwards (Hot-Join requests). So,
>     this is not really a hot path, hence my decision to choose simplicity
>     over perfs: have a single function for the DAA (where PID, BCR and
>     DCR are available) and SETDASA (where these have to be retrieved using
>     GETPID, GETDCR, GETBCR) cases.
>     
>     Nothing is set in stone, and if one of you comes with a patch that
>     keep things simple while allowing one to skip the GET{PID,BCR,DCR}
>     commands, I'll consider merging it. But, to be honest, I don't think
>     this a priority. We still don't have support for DDR and mastership
>     handover, which in my opinion are much more valuable than optimizing
>     the bus-discovery path.
> 
> Yes, I agree we can leave it for later. I'm composing patch containing mastership
> and HRD mode. I'll release it soon.

Please send those 2 series separately, as they are completely
independent.

>     
>     >     
>     >       
>     >     >> Let's assume we have a huge overhead caused by the OS (and all the    
>     >       
>     >     >> scheduling involved), and make it 100usec.    
>     >       
>     >     > And let's make it 500usec with the OS overhead, which is still not    
>     >       
>     >     > particularly worrisome in term of boot-time.    
>     >     
>     >     
>     >     
>     >     Ok, it can be done in the future.
>     > 
>     > I was thinking also how to skip this in case of mastership request where device information is received in DEFSLVS command, secondary master can't do DAA.  
>     
>     Okay, so this is actually one reason we'd want to add devices without
>     triggering transfers on the bus. The thing is, we need more than just
>     PID, BCR and DCR, and those information are not passed in the DEFSLVS
>     frame (MXDS, MRL, MWL, HDRCAP). IIRC, we started discussing that with
>     Arnd, Vitor and you and we listed 2 options:
>     
>     1/ force the secondary master to take bus ownership after it has
>        received DEFSLVS so that it can retrieve the missing bits and finally
>        expose devices to its users
>     2/ bind partially discovered devices to drivers and retrieve the device
>        information on-demand (when i3c_device_get_info() is called).
>     
>     If we go for option #2, we'll need a separate function that does more
>     than just skipping GETPID, GETDCR and GETBCR. Of course #2 is more
>     elegant in that it doesn't force a mastership handover until someone
>     really wants to access a device through the secondary master, but #1 is
>     definitely simpler to implement.
> 
> Ok, I see. Regarding #2, device is matched by PID, how do you want to handle this?

As I said, if we go for #2, we'll need a way to pass the PID, BCR and
DCR we received from the DEFSLVS frame. So yes, that's actually one
case where passing this info to i3c_master_add_i3c_dev_locked() makes
sense. But, you'll also have to modify this function to skip
i3c_master_retrieve_dev_info(). So maybe it's just simpler to have a
separate function for this case (i3c_master_defslvs_add_dev_locked()?)

> I think we still need to use GETPID before registering the device. Can you see different path?

We need the PID for sure, but it's passed in DEFSLVS, so we should be
good.

>     
>     > Mastership takeover can be faster without need to get BCR/DCR from devices again.  
>     
>     Again, this should only happen once, not every time the master changes,
>     simply because devices on the bus will stay the same. So I don't think
>     optimization is a good argument.
> 
> Indeed. Of course, devices does not have to be the same, after Hot-Join for example. 
> But this is different story :)

Yes, HJ will trigger DAA which will trigger new DEFSLVS which might in
turn trigger a mastership handover if we go for option #1. But I expect
Hot-Join events to happen rarely, not every millisecond. So again, not
really something we should try to optimize until it becomes the
bottleneck for someone.
