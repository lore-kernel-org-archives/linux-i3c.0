From: b.brezillon.dev@gmail.com (Boris Brezillon)
Date: Mon, 10 Dec 2018 20:43:30 +0100
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
In-Reply-To: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
References: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
Message-ID: <20181210204330.76e6b615@bbrezillon>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org

Hi Vitor,

Can you please keep Cc-ing me when you send I3C patches. Sending it
only to the ML is not enough, maintainers should be Cc-ed too.

On Mon, 10 Dec 2018 19:21:37 +0000
vitor <vitor.soares@synopsys.com> wrote:

> Hi,
> 
> The function bellow doesn't accept the PID, BCR and DCR captured
> during the ENTDAA.
> 
> int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> ?? ??? ??? ??? ?? u8 addr)
> {
> ?? ?struct i3c_device_info info = { .dyn_addr = addr };
> 
> 
> I would like to change it to received those parameters. Something like this:
> 
> int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
> ?? ??? ??? ??? ?? u64 pid, u8 bcr, u8 dcr, u8 addr)
> {
> ?? ?struct i3c_device_info info = { .pid = pid,
> ?? ??? ??? ??? ??? ?.bcr = bcr,
> ?? ??? ??? ??? ??? ?.dcr = dcr,
> ?? ??? ??? ??? ??? ?.dyn_addr = addr };
> 
> Do you agree?

I need a reason, like for every other requests you made.

Why do you need it? Do you want to check the value returned by the
GETBCR, GETDCR and GETPID operations? Do you want to skip those
operations in the DAA case, and if you do, why? How will that work for
the non-DAA case (SETDASA)?

I think I already mentioned it, but please remember that any changes
you suggest should be explained so that we can have a constructive
discussion.

Regards,

Boris
