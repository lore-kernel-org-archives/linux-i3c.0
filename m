Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B31FCD98F9
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jun 2026 04:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsFL3HMj4E7Q9xlN3p0/L8Xd5dFm+F630YHETh4Opa8=; b=nqrmFH4czpXHhj
	o8oaVGLReUPq6AUApZdrxkTkZXO/j++MoxEzzf2KJPqYBca+ug1xORpfuSC8NYq4z6Tn0OctLCeKV
	9ZwR2M/ZTiY0ekLvzhvtDxpbr9nA5RBQ14QT5KOw51rnQfsjwAw92X1P3TOVQoUvEhXE4Z7e2x62e
	zFQHbYGde1o8/ek/hK0KX9gDahd8OJAr44zTfWzEGzIZKL1HuHvhdoCDNTNF7F+5ZRFkm0ZdQkxYc
	lZ0yL/yyxqeew54JFIRiN8tFRZcvgXeJMrmBazlNtEu1Mo7ySSCrIUyN4n4gmxUzmXn8CV4mM/uao
	6Za+Eba6Bu9xPVDTRfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4Ou-00000000c7g-2qo5;
	Thu, 18 Jun 2026 04:30:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4Ot-00000000c7Z-1fcJ
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jun 2026 04:30:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC6644093B;
	Thu, 18 Jun 2026 04:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84DD1F000E9;
	Thu, 18 Jun 2026 04:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781757046;
	bh=DHmk96uiHkviuL9OahPCLRPAmLH8lVTAdu6jHOhQphw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Q1kkdcjlo9bdHWXagAB9lsoyDUExbM5jfkCl1p6WD4WxpvI5HNJwm0AYV3CWeyENk
	 atdTDNOKXzZiWTVdfE+kDGasnAxHgZGYW5q7UhptfvqJrabvVnl+ztOQ8BNYXQwdh0
	 gmv6XPtTiJuuuOAn+qJl/POQuxYtDc9brFeF3PckEBr8W+fBF9+XHn+1QuvOclY7+W
	 d9L39vM0UkcxDFYSx0VRvd1/k7HWTCNTAJG0lbq6GKBr3s9RJNlq2bsyXpiOiMjeMC
	 YOrtcMzaY9LRahpe9UjWuvtotawQN+qy6elkX3rvWjmWwxqQX74AnQYu1VHfp868Vg
	 q3dGiWveZlvYg==
Message-ID: <85144ed7-50b3-42cd-8405-f64335a94486@kernel.org>
Date: Thu, 18 Jun 2026 07:30:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/16] i3c: renesas: Add runtime PM support
To: sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org
References: <20260612160458.3102106-17-claudiu.beznea@kernel.org>
 <20260612163403.B8A091F000E9@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260612163403.B8A091F000E9@smtp.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 6/12/26 19:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Timeout handler fails to abort hardware transfers because it clears the BCTL_ABT bit instead of setting it.
> 
> Pre-existing issues:
> - [High] Transfer loops do not break on timeout and unconditionally return success, leading to silent failures, race conditions, and memory corruption.
> --
> 
> commit d8976043a71981cb4634aa1e9eafca1113e44ec6
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> i3c: renesas: Add runtime PM support
> 
> This commit adds runtime PM support to the Renesas I3C driver, guarding
> subsystem operations with pm_runtime APIs. It also drops explicit clock
> handling, modifies wait_xfer to return unsigned long, and introduces a
> function to clear pending IRQs on transfer aborts.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
> 
> [ ... ]
> 
>> @@ -443,7 +442,24 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
>>   	}
>>   }
>>   
>> -static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
>> +static void renesas_i3c_irqs_mask_and_clear(struct renesas_i3c *i3c)
>> +{
>> +	guard(spinlock_irqsave)(&i3c->xferqueue.lock);
>> +
>> +	/* Disable all the interrupts */
>> +	renesas_writel(i3c->regs, BIE, 0);
>> +	renesas_writel(i3c->regs, NTIE, 0);
>> +
>> +	/* Clear normal transfer status flags. */
>> +	renesas_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0 | NTST_RSPQFF |
>> +					   NTST_TEF | NTST_TABTF);
>> +	/* Clear bus status flags. */
>> +	renesas_clear_bit(i3c->regs, BST, BST_NACKDF | BST_TENDF | BST_SPCNDDF);
>> +	/* Clear error flags. */
>> +	renesas_clear_bit(i3c->regs, BCTL, BCTL_ABT);
>> +}
> 
> [Severity: High]
> Does this actually abort the hardware transfer? The commit message mentions
> disabling interrupts and clearing pending IRQ status bits when a completion
> timeout occurs.
> 
> However, clearing the BCTL_ABT bit is usually how an abort is acknowledged.
> To actually initiate a hardware abort, the host typically must set the
> BCTL_ABT bit, or explicitly reset the controller.
> 
> By only clearing an already-zero bit, does the controller remain in a busy
> or hung state, potentially corrupting subsequent transfers?

The ABT bit of BCTL has the following meaning according to documentation:

  ABT
0: I3C is running.
1: I3C has aborted a transfer.

And the following explanation:

When set to 1, this bit allows I3C to relinquish control of the I3C Bus before 
completing the currently issued transfer.
In response to an ABORT request, I3C issues the STOP condition on the I3C Bus 
after the complete data byte is transferred or received.

The Driver shall clear the ABT bit to allow operation on the Bus.

Thus, the drive is clearing this bit to allow next I3C transfers to go on.

Thank you,
Claudiu

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
