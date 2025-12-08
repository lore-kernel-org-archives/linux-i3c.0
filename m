Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109ED3B7E2
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 18:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zscD/MIipjAljLq6WSsj0bdjLiqy1N1lMFkGF3lq8hk=; b=AQw/ZIW+VPvt3x
	NbmtmkGdZ0e72T5h1vhYkNsdlyrwtt+jMBYDp+eacYGJ86j1V9M8KrEBXK69Qq7JDDKsO13ZlvIoG
	BOyWMOrdP+dTUG/k0DTmbPR+4h1Cm/gkQCVZH20weU0flx9PwsJpcgYnOMWL4cM0yPPBaThhBAjnj
	9VrZW9p218qdzLtIcJOJZU0gBo8h+FC4Uu8A/ogfa5S7Mv/pd5GNPILAoQYCl6bcLEP/+6TrxcFI8
	ywcPDzobNFpbpxdqQpWgVaECSwFwr0cpWaXWVXs7buDClQnIbTbf2buuZY8PFvdRJLiUfy7+c4kzT
	skapN+PtdpJSs2fa4Ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSgNY-0000000DRda-3cyB;
	Mon, 08 Dec 2025 18:54:36 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSgNW-0000000DRcz-3d4g
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 18:54:36 +0000
Received: by mail-vs1-xe42.google.com with SMTP id ada2fe7eead31-5e55bd6f5bbso258325137.0
        for <linux-i3c@lists.infradead.org>; Mon, 08 Dec 2025 10:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765220073; x=1765824873; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b9+8Ji4GtiQC3LG5YzqdtKVMB9qzH+agv5YpKuCGCtw=;
        b=UL7/VG2mUKDXWIQB1/Y9azpxTwvYoRyE2X35Y954wDcBcMWdD2nwQ1Qv8l1OoxjzB/
         FMSXNPAwNrVJbjE71WztumIxVICyKpq3Qw1utZ7LxMdI8tO9bE8ZePRN33dGxpQSfkeK
         rro962Jcy2I0WGtsWb9Y7QhDNJrRvSeuSGayPE+1yJYeVyl8eGwsCh9k1VN58fjCcrvh
         h0zSTX/8/NWMHrPqewZSvrtcoE+97nweT7uF7OL7U4YZrHmaSuSUN39udn0kC1iKPMRz
         MdwDs/2NTDwbJh+r1GvAtZxj/OttxoH22pql10xTstEjEiuJQd4Ui+uj/YLhsGnv5jL1
         dNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765220073; x=1765824873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9+8Ji4GtiQC3LG5YzqdtKVMB9qzH+agv5YpKuCGCtw=;
        b=YEziMrVjupA+sAGdZMPHG31IqAOop5vHCEuLISdj1uciwakxleEW6qt1+ht5DyVnfw
         4LHuktj6Y2BNDfhljEB9iOxl9uGEhil8T0lppf7sXuMqzOB70QmDQVeDA+aMGVHGTQ7I
         GbmFGKtLRsJUnVMr1ZpFiEEhZw8QY8Dd8EiT2nNhOs0fJmdAFLdNCofJTWq8JK74hj9b
         K9vhBbeweSZKaC+d8751qZJy/cZ6f/Fc+n3X/MrvUFgLo1mgCEu6Q5yATZju98X6FD4Z
         dzYqJKKEQPhkBSO15pE7SBJq/Z4byH+nBt75Q2sMu0rdG0YfZ/KYifiFyfhYYFm+WOuY
         BuTw==
X-Gm-Message-State: AOJu0YxtWmX2LrnAWj/LBH23jm58GiSGyV/e2g2Vyf/0Pe93gUqt2cV3
	TmeRmQlWMHxD7QjXToAjaJxxVPlkitQ6pA7HszHd5U80HcL1Vw1/JpM1yyNVKj1MQWw8wdLwp+m
	heDIqiI4afnwbGU61lsoreRHvUaK9wG6sfBj0TqU=
X-Gm-Gg: ASbGncuGHYNVimTaRo4g/U3QLzUcBRgyYA61JHuAVmlEIxG2+Wda9Nia0mZBfa4hFgZ
	NQ2OF0ypzNUrxbcoYMzByPKWweo4Yl63V9ajhuyFKIXE4OMliTbQhheolAAFhAp5Xj+Rl22LY9m
	LAV5LmurZs3TNjuxa2QmLA47bSohjbxTjsCSq/7jMgwmXQcVwe/9G8dpaV2eUHPlePE76FhQjLj
	/BanLb77ztXVwctdQtNN4LPYTd2T6lqUmX3CvaL8jDQz9ftUG4Znj8TkmevHfaNqMxh/0U=
X-Google-Smtp-Source: AGHT+IEmiUADXnwciNYZiABk1q5ewHJHTG+4hHnRUiROManQBCIeMpipFy9FhX01xr8eQ6EmX2XtRsHrg+XDNDDWcbs=
X-Received: by 2002:a05:6102:3a08:b0:5d7:ddf6:8951 with SMTP id
 ada2fe7eead31-5e52c981de7mr2862680137.1.1765220073421; Mon, 08 Dec 2025
 10:54:33 -0800 (PST)
MIME-Version: 1.0
References: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
In-Reply-To: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
From: Manikanta Guntupalli <manikantaguntupalli09@gmail.com>
Date: Tue, 9 Dec 2025 00:24:22 +0530
X-Gm-Features: AQt7F2qSAEjoJoaHUPKg8Duj1W9AXFGxYe9UJs8RyuQhkqHeB8nMsgNecHpBZ3Y
Message-ID: <CABdrv1Me3FMmG2-pMittd6_QseRQ7Je_OJ1awNOzO_iuWWynCw@mail.gmail.com>
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:885:12
To: Louis Sautier <louis.sautier@ovhcloud.com>
Cc: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_105434_919653_243BB012 
X-CRM114-Status: GOOD (  20.73  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Louis,
What is the behavior when you build the dw-i3c-master as a static driver?

Thanks,
Manikanta

On Wed, 3 Dec 2025, 01:48 Louis Sautier, <louis.sautier@ovhcloud.com> wrote:
>
> Hello,
>
> I'm running into a bug when loading the dw-i3c-master module on kernel
> 6.18 on one specific server. I suspect it has to do with the large
> number of CPUs on the machine (768 threads, from 2 AMD EPYC 9965
> processors) but I am not sure.
>
> The system is on Ubuntu 25.10 and a 6.18 kernel with
> https://gist.githubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/raw/115da594dc9d7ea99b06754847571e6fd76d9da5/config
> (basically Ubuntu's).
>
> These are the logs I see whenever I run "modprobe dw-i3c-master". Full
> dmesg at
> https://gist.githubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/raw/115da594dc9d7ea99b06754847571e6fd76d9da5/dmesg
>
> dw-i3c-master AMDI0015:00: probe with driver dw-i3c-master failed with
> error -110
> dw-i3c-master AMDI0015:01: probe with driver dw-i3c-master failed with
> error -110
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:885:12
> shift exponent 64 is too large for 64-bit type 'long unsigned int'
> CPU: 109 UID: 0 PID: 7574 Comm: (udev-worker) Not tainted 6.18.0 #1
> PREEMPT(voluntary)
> Hardware name: Giga Computing MZ73-LM2-000/MZ73-LM2-000, BIOS R23_F43
> 11/28/2025
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x5f/0x90
>   dump_stack+0x10/0x18
>   ubsan_epilogue+0x9/0x39
>   __ubsan_handle_shift_out_of_bounds.cold+0xdd/0x1c9
>   dw_i3c_master_daa.cold+0x1a/0x90 [dw_i3c_master]
>   i3c_master_do_daa+0x30/0x90 [i3c]
>   i3c_master_register+0x616/0xa80 [i3c]
>   dw_i3c_common_probe+0x23f/0x2c0 [dw_i3c_master]
>   dw_i3c_probe+0x30/0x50 [dw_i3c_master]
>   platform_probe+0x42/0xc0
>   ? driver_sysfs_add+0x63/0xd0
>   really_probe+0xf9/0x370
>   ? pm_runtime_barrier+0x56/0xa0
>   __driver_probe_device+0x8b/0x160
>   driver_probe_device+0x24/0xd0
>   ? __pfx___driver_attach+0x10/0x10
>   __driver_attach+0xef/0x220
>   ? __pfx_dw_i3c_driver_init+0x10/0x10 [dw_i3c_master]
>   bus_for_each_dev+0x8a/0xe0
>   driver_attach+0x1e/0x30
>   bus_add_driver+0x13e/0x230
>   ? __pfx_dw_i3c_driver_init+0x10/0x10 [dw_i3c_master]
>   driver_register+0x75/0xf0
>   __platform_driver_register+0x1e/0x30
>   dw_i3c_driver_init+0x1c/0xff0 [dw_i3c_master]
>   do_one_initcall+0x59/0x330
>   do_init_module+0x8b/0x290
>   load_module+0x1f2f/0x2320
>   init_module_from_file+0x9b/0x100
>   ? init_module_from_file+0x9b/0x100
>   idempotent_init_module+0x10e/0x300
>   __x64_sys_finit_module+0x73/0xf0
>   ? __secure_computing+0x84/0xe0
>   x64_sys_call+0x1f04/0x2350
>   do_syscall_64+0x82/0xc80
>   ? exit_to_user_mode_loop+0xe6/0x190
>   ? do_syscall_64+0x25c/0xc80
>   ? restore_fpregs_from_fpstate+0x46/0xe0
>   ? switch_fpu_return+0x5c/0xf0
>   ? do_syscall_64+0x25c/0xc80
>   ? switch_fpu_return+0x5c/0xf0
>   ? do_syscall_64+0x25c/0xc80
>   ? wait_for_completion_interruptible+0x24/0x50
>   ? idempotent_init_module+0x1d5/0x300
>   ? __rseq_handle_notify_resume+0xa2/0x4e0
>   ? restore_fpregs_from_fpstate+0x46/0xe0
>   ? switch_fpu_return+0x5c/0xf0
>   ? do_syscall_64+0x25c/0xc80
>   ? do_user_addr_fault+0x22b/0x6b0
>   ? irqentry_exit_to_user_mode+0x2e/0x2a0
>   ? irqentry_exit+0x43/0x50
>   ? exc_page_fault+0x90/0x1b0
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7dff23f348cd
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89
> f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
> f0 ff ff 73 01 c3 48 8b 0d 13 f5 0f 00 f7 d8 64 89 01 48
> RSP: 002b:00007fff46db08c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 00005705ce7b5300 RCX: 00007dff23f348cd
> RDX: 0000000000000000 RSI: 00007dff23c31336 RDI: 0000000000000078
> RBP: 00007fff46db0960 R08: 0000000000000000 R09: 00005705ce77f530
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007dff23c31336
> R13: 0000000000020000 R14: 00005705ce7bcb10 R15: 00005705ce7c4f00
>   </TASK>
> ---[ end trace ]---
> dw-i3c-master AMDI0015:03: probe with driver dw-i3c-master failed with
> error -110
>
>
> I hope this is the right venue to report this. Please let me know if you
> need more information or if you would like me to test a patch.
>
> Can you also keep me CC'd to replies? I'm not subscribed to the list.
>
> Cheers,
>
> Louis
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
