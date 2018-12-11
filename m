From: vitor.soares@synopsys.com (vitor)
Date: Tue, 11 Dec 2018 15:47:57 +0000
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
In-Reply-To: <20181211132446.4d93fd10@bbrezillon>
References: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
 <20181210204330.76e6b615@bbrezillon> <20181210211411.7f64f5cb@bbrezillon>
 <3f21dc46-97e1-1a64-a91b-07e623d82184@synopsys.com>
 <20181211125832.7a7b224f@bbrezillon>
 <ccf3667b-a491-759e-a476-e795df4ab9cb@synopsys.com>
 <20181211132103.34ae80c8@bbrezillon> <20181211132446.4d93fd10@bbrezillon>
Message-ID: <ff58869b-acdd-28e4-0e89-72b46e54d5b9@synopsys.com>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org



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

>> Let's assume we have a huge overhead caused by the OS (and all the
>> scheduling involved), and make it 100usec.
> And let's make it 500usec with the OS overhead, which is still not
> particularly worrisome in term of boot-time.

Ok, it can be done in the future.

Thanks.
