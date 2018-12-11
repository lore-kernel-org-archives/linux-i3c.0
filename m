From: bbrezillon@kernel.org (Boris Brezillon)
Date: Tue, 11 Dec 2018 12:58:32 +0100
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
In-Reply-To: <3f21dc46-97e1-1a64-a91b-07e623d82184@synopsys.com>
References: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
 <20181210204330.76e6b615@bbrezillon>
 <20181210211411.7f64f5cb@bbrezillon>
 <3f21dc46-97e1-1a64-a91b-07e623d82184@synopsys.com>
Message-ID: <20181211125832.7a7b224f@bbrezillon>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org

On Tue, 11 Dec 2018 11:54:22 +0000
vitor <vitor.soares@synopsys.com> wrote:

> >>> The function bellow doesn't accept the PID, BCR and DCR captured
> >>> during the ENTDAA.
> >>>
> >>> int i3c_master_add_i3c_dev_locked(struct i3c_master_controller
> >>> *master, u8 addr)
> >>> {
> >>> ?? ?struct i3c_device_info info = { .dyn_addr = addr };
> >>>
> >>>
> >>> I would like to change it to received those parameters. Something
> >>> like this:
> >>>
> >>> int i3c_master_add_i3c_dev_locked(struct i3c_master_controller
> >>> *master, u64 pid, u8 bcr, u8 dcr, u8 addr)
> >>> {
> >>> ?? ?struct i3c_device_info info = { .pid = pid,
> >>> ?? ??? ??? ??? ??? ?.bcr = bcr,
> >>> ?? ??? ??? ??? ??? ?.dcr = dcr,
> >>> ?? ??? ??? ??? ??? ?.dyn_addr = addr };
> >>>
> >>> Do you agree?    
> >> I need a reason, like for every other requests you made.
> >>
> >> Why do you need it? Do you want to check the value returned by the
> >> GETBCR, GETDCR and GETPID operations? Do you want to skip those
> >> operations in the DAA case, and if you do, why? How will that work
> >> for the non-DAA case (SETDASA)?  
> > For the record, I initially decided to not pass pid, bcr and dcr to
> > i3c_master_add_i3c_dev_locked() to have a single function working
> > for both DAA and SETDASA cases. Given how fast it is to send 3 CCC
> > commands per device (and the limited number of devices per bus) I
> > didn't think it was useful to optimize it. If you think otherwise,
> > I'd like to hear your arguments.  
> 
> I just want to skip GETBCR/DCR/PID operations since those data are
> already available in the controller. There's advantages but they only
> have relevance depending of use case.

Can you detail those use cases please?
