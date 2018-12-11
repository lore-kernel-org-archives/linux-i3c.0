From: vitor.soares@synopsys.com (vitor)
Date: Tue, 11 Dec 2018 12:07:16 +0000
Subject: i3c_master_add_i3c_dev_locked() accept PID, BCR, DCR
In-Reply-To: <20181211125832.7a7b224f@bbrezillon>
References: <fd731fb8-3b47-9364-baf7-da530bf9c786@synopsys.com>
 <20181210204330.76e6b615@bbrezillon> <20181210211411.7f64f5cb@bbrezillon>
 <3f21dc46-97e1-1a64-a91b-07e623d82184@synopsys.com>
 <20181211125832.7a7b224f@bbrezillon>
Message-ID: <ccf3667b-a491-759e-a476-e795df4ab9cb@synopsys.com>
To: linux-i3c@lists.infradead.org
List-Id: linux-i3c.lists.infradead.org



On 11/12/18 11:58, Boris Brezillon wrote:
>> I just want to skip GETBCR/DCR/PID operations since those data are
>> already available in the controller. There's advantages but they only
>> have relevance depending of use case.
> Can you detail those use cases please?

If the bus has a lot of devices and you want to decrease the initialization time this could be the first step.
