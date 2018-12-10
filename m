From: vitor.soares@synopsys.com (vitor)
Date: Mon, 10 Dec 2018 19:21:37 +0000
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
Message-ID: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org

Hi,

The function bellow doesn't accept the PID, BCR and DCR captured
during the ENTDAA.

int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
?? ??? ??? ??? ?? u8 addr)
{
?? ?struct i3c_device_info info = { .dyn_addr = addr };


I would like to change it to received those parameters. Something like this:

int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
?? ??? ??? ??? ?? u64 pid, u8 bcr, u8 dcr, u8 addr)
{
?? ?struct i3c_device_info info = { .pid = pid,
?? ??? ??? ??? ??? ?.bcr = bcr,
?? ??? ??? ??? ??? ?.dcr = dcr,
?? ??? ??? ??? ??? ?.dyn_addr = addr };

Do you agree?

Best regards,
Vitor Soares
