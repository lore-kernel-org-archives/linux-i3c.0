From: pgaj@cadence.com (Przemyslaw Gaj)
Date: Wed, 12 Dec 2018 06:06:18 +0000
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
In-Reply-To: <ff58869b-acdd-28e4-0e89-72b46e54d5b9@synopsys.com>
References: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
 <20181210204330.76e6b615@bbrezillon> <20181210211411.7f64f5cb@bbrezillon>
 <3f21dc46-97e1-1a64-a91b-07e623d82184@synopsys.com>
 <20181211125832.7a7b224f@bbrezillon>
 <ccf3667b-a491-759e-a476-e795df4ab9cb@synopsys.com>
 <20181211132103.34ae80c8@bbrezillon> <20181211132446.4d93fd10@bbrezillon>
 <ff58869b-acdd-28e4-0e89-72b46e54d5b9@synopsys.com>
Message-ID: <AACD7E8D-80FA-453B-AB9E-9A0D84598123@cadence.com>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org

Hi Boris,

?On 12/11/18, 4:48 PM, "linux-i3c on behalf of vitor" <linux-i3c-bounces at lists.infradead.org on behalf of vitor.soares@synopsys.com> wrote:

    EXTERNAL MAIL
    
    
    
    
    
    
    On 11/12/18 12:25, Boris Brezillon wrote:
    
    > On Tue, 11 Dec 2018 13:21:03 +0100
    
    > Boris Brezillon <bbrezillon@kernel.org> wrote:
    
    >
    
    >> On Tue, 11 Dec 2018 12:07:16 +0000
    
    >> vitor <vitor.soares@synopsys.com> wrote:
    
    >>
    
    >>> On 11/12/18 11:58, Boris Brezillon wrote:  
    
    >>>>> I just want to skip GETBCR/DCR/PID operations since those data are
    
    >>>>> already available in the controller. There's advantages but they
    
    >>>>> only have relevance depending of use case.    
    
    >>>> Can you detail those use cases please?    
    
    >>> If the bus has a lot of devices and you want to decrease the
    
    >>> initialization time this could be the first step.
    
    >>>   
    
    >> Did you quantify the boot-time/perf improvement? The clk should be
    
    >> running at 12.5MHz, GETPID takes 9bytes and GETBCR/DCR take 4 bytes
    
    >> each. Let's add one byte per command to account for the start/stop
    
    >> bits. That makes a total of 20bytes per device, with a maximum of 11
    
    >> devices per bus:
    
    >>
    
    >> max_time_to_query_pid_bcr_dcr_per_bus = 20 * 10 / 12500000 = 17.6 usec.
    
    > Sorry, small mistake, I counted bytes instead of bits.
    
    >
    
    > max_time_to_query_pid_bcr_dcr_per_bus = 20 * 8 * 11 / 12500000 = 141usec.
    
    
    
    In fact there is missing other things like, S time, Sr time, stop time, stall time in t-bit and OD speed for the addresses...
    
    
    
    I measured in my setup with a scope and the additional time to get that information is around 110 us per device and with only one device the bus takes around 550 us for the initialization.
    
So, for now, we are transferring the same information two times over the bus, during DAA procedure and then manually. Three commands per device GETBCR/DCR/PID need six register accesses to write (in our controller). Don't you think it is more significant overhead? I'm just wondering.
    
    
    >> Let's assume we have a huge overhead caused by the OS (and all the
    
    >> scheduling involved), and make it 100usec.
    
    > And let's make it 500usec with the OS overhead, which is still not
    
    > particularly worrisome in term of boot-time.
    
    
    
    Ok, it can be done in the future.

I was thinking also how to skip this in case of mastership request where device information is received in DEFSLVS command, secondary master can't do DAA. Mastership takeover can be faster without need to get BCR/DCR from devices again.
    
    
    
    Thanks.
    
Thanks,
Przemek
    
    
    
    
    
    
    _______________________________________________
    
    linux-i3c mailing list
    
    linux-i3c at lists.infradead.org
    
    https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Di3c&d=DwICAg&c=aUq983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-_haXqY&r=CMnAfM_OfpqcWZRfiqcRWw&m=trNUbFnImlZoS093pWZERer4mHsTchT6X8dOa6-jfgw&s=uCZJLvo-KNMKIPKv9Tia18uSSdtzAFTMgSumhmAYRzk&e=
    
    
