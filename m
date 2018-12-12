From: bbrezillon@kernel.org (Boris Brezillon)
Date: Wed, 12 Dec 2018 10:09:53 +0100
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
In-Reply-To: <E493F29A-767B-486F-8630-10200F0F54DD@cadence.com>
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
 <20181212095211.060a44a9@bbrezillon>
 <E493F29A-767B-486F-8630-10200F0F54DD@cadence.com>
Message-ID: <20181212100953.11d7cbdf@bbrezillon>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org

On Wed, 12 Dec 2018 09:02:17 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:
>     >     
>     >     Okay, so this is actually one reason we'd want to add devices without
>     >     triggering transfers on the bus. The thing is, we need more than just
>     >     PID, BCR and DCR, and those information are not passed in the DEFSLVS
>     >     frame (MXDS, MRL, MWL, HDRCAP). IIRC, we started discussing that with
>     >     Arnd, Vitor and you and we listed 2 options:
>     >     
>     >     1/ force the secondary master to take bus ownership after it has
>     >        received DEFSLVS so that it can retrieve the missing bits and finally
>     >        expose devices to its users
>     >     2/ bind partially discovered devices to drivers and retrieve the device
>     >        information on-demand (when i3c_device_get_info() is called).
>     >     
>     >     If we go for option #2, we'll need a separate function that does more
>     >     than just skipping GETPID, GETDCR and GETBCR. Of course #2 is more
>     >     elegant in that it doesn't force a mastership handover until someone
>     >     really wants to access a device through the secondary master, but #1 is
>     >     definitely simpler to implement.
>     > 
>     > Ok, I see. Regarding #2, device is matched by PID, how do you want to handle this?  
>     
>     As I said, if we go for #2, we'll need a way to pass the PID, BCR and
>     DCR we received from the DEFSLVS frame. So yes, that's actually one
>     case where passing this info to i3c_master_add_i3c_dev_locked() makes
>     sense. But, you'll also have to modify this function to skip
>     i3c_master_retrieve_dev_info(). So maybe it's just simpler to have a
>     separate function for this case (i3c_master_defslvs_add_dev_locked()?)
>     
>     > I think we still need to use GETPID before registering the device. Can you see different path?  
>     
>     We need the PID for sure, but it's passed in DEFSLVS, so we should be
>     good.
> 
> As far as I remember it's not. Only BCR, DCR, DA and SA.

Oh, I thought it was. So option #2 is not even possible, which means
we don't have a choice, we must implement solution #1.
