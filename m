Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CDCCD98CC
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 18:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcSp7alqqzsggj9x6OZ4ER/dIjZ/+wJvGH6m/dAjPpE=; b=ADcWCNcQuGnVps
	9uWMD2lZp/t/eQEloDeWjts4YoTt6UaeJVJLESkqFnl11NW4vzzmoBR2vp9wso1M8yriuNnALiatY
	lqOBxmHMVQzzso+0YJcyWNDhTyRf5pzq6dEL31Xwq3O2fQDBOP1cdGz53Pd7xxgs2MwKYzv+2Val3
	/8IegP2xt4kO8yrChw9DYwqtrToLFnFC2rId71J0ou/bg0IGOm8kfZADLguLBMvzBAPl24MB+YLj2
	LzJ8xeAmfpXjrOH4Yap74bG9QBGcAl8P0CNSvpelVWhwD8Yhl+lM87GmmLGb6vZ/G50OtO3yq+DtZ
	53Xj0Sf8gxrH2FoB23Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkVI-00000009ufv-06AC;
	Thu, 11 Jun 2026 18:51:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkVG-00000009ufl-18yP
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 18:51:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C072960138;
	Thu, 11 Jun 2026 18:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B351F000E9;
	Thu, 11 Jun 2026 18:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781203904;
	bh=jhuzA1G4jTb+hQU3036PmWT90HMt35YKLv0VztRedsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ilWPUrEFuWikABMhoLFPrL4DU/39xPCRsvCGtcwQ7lKVPKM1M1gTy+vWQqGJhNfDi
	 8A/VT8I44T/vmk6th8eIEdFc+iom0U8EqldOI6xKdiZOZyErYPwaXE7dDYz91+iKOr
	 9EHuJjLzSzxMsTmuXwNcUE9Cjrq+jCYeTk4oNw8cNqamrlV5l/QD5zkTxmqu7xP+8v
	 9Sxyez3X+cDZVrOnT5xGA4jMAhX8K8SlklcVtZhBh0kdRhjkMsXsdVdAEgacRGPs3E
	 hXkD0kp01CJgolEcYXGOWaY+N0UozO4Exh3CG56MYAnV+A0Ws9RQ5SYMR0wpCwIWI2
	 gwrBdO6wuIl0g==
Message-ID: <502bf7c9-afc6-4904-9d49-05b5f0455c2f@kernel.org>
Date: Thu, 11 Jun 2026 21:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/17] i3c: renesas: Add runtime PM support
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, linux-i3c@lists.infradead.org,
 Frank.Li@kernel.org
References: <20260608201543.804902-18-claudiu.beznea@kernel.org>
 <20260608204650.5A13C1F00893@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260608204650.5A13C1F00893@smtp.kernel.org>
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



On 6/8/26 23:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Async Runtime PM put during driver unbind leaves the clock enabled.
> - [High] Newly added renesas_i3c_abort_xfer clears the abort bit instead of setting it, leaving hardware stuck.
> 
> Pre-existing issues:
> - [High] Timeout handling in transfer loops fails to break the loop, ignores the timeout, and incorrectly returns success.
> - [High] I3C RX buffer is not advanced during FIFO reads, leaving buffer tails uninitialized.
> --
> 
> commit 810cc3873a9dc52a932c03376330719f06d17de0
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> i3c: renesas: Add runtime PM support
> 
> This commit adds runtime PM support to the Renesas I3C driver, replacing
> explicit clock management with runtime PM APIs. It updates controller
> operations with PM guards and introduces a transfer abort mechanism to handle
> timeouts asynchronously.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index b6c282c53a541..d6121ca869908 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
> [ ... ]
>> @@ -443,7 +442,24 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
>>   	}
>>   }
>>   
>> -static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
>> +static void renesas_i3c_abort_xfer(struct renesas_i3c *i3c)
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
> 
> [Severity: High]
> Does this clear the abort bit instead of setting it?
> 
> Hardware abort bits like BCTL_ABT typically must be written as 1 to trigger
> an abort. If we only clear the bit, will the hardware controller be left
> running the timed-out transfer in the background and get stuck?

The role of the renesas_i3c_abort_xfer() is just to avoid triggering any new 
interrupt in case a transfer times out. The handler disables the interrupts and 
clear any status bits along with the BCTL.ABT bit.

Maybe a different name for the function would have been better.

> 
>> +}
>> +
> [ ... ]
>> @@ -975,9 +1027,14 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>>   				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
>>   		}
>>   
>> -		renesas_i3c_wait_xfer(i3c, xfer);
>> +		time_left = renesas_i3c_wait_xfer(i3c, xfer);
>> +		if (!time_left)
>> +			abort_xfer = true;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the lack of a break here
> cause the loop to continue iterating?
> 
> If the transfer times out, it sets abort_xfer = true but continues to the
> next command, overwriting the shared cmd descriptor.
> 
> Also, since renesas_i3c_i3c_xfers() unconditionally returns 0 at the end,
> will this hide the timeout from the subsystem and potentially cause it to
> read uninitialized RX buffers?
> 
>>   	}
>>   
>> +	if (abort_xfer)
>> +		renesas_i3c_abort_xfer(i3c);
>> +
>>   	return 0;
>>   }
> [ ... ]
>> @@ -1045,8 +1112,12 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
>>   	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>>   	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>>   	struct renesas_i3c *i3c = to_renesas_i3c(m);
>> +	int ret;
>>   
>> -	renesas_writel(i3c->regs, DATBAS(data->index), 0);
>> +	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
>> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
>> +	if (!ret)
>> +		renesas_writel(i3c->regs, DATBAS(data->index), 0);
>>   
>>   	i3c_dev_set_master_data(dev, NULL);
>>   	i3c->addrs[data->index].addr = 0;
> 
> [Severity: High]
> Does this asynchronously put the runtime PM usage counter without a
> synchronous suspend before driver teardown completes?
> 
> During driver unbind, renesas_i3c_remove() unregisters the I3C master, which
> detaches devices. The PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND macro releases
> the device asynchronously via pm_runtime_put_autosuspend().
> 
> Right after remove returns, devres calls pm_runtime_disable(), which cancels
> the pending autosuspend work. 

Before calling pm_runtime_disable() the devres helper 
(pm_runtime_disable_action()) call:

pm_runtime_dont_use_autosuspend() ->
   __pm_runtime_use_autosuspend(dev, false) ->
     update_autosuspend(dev, old_delay, old_use) ->
        rpm_idle(dev, RPM_AUTO)

which should end up calling the idle and suspend callbacks.

> Could this leave the hardware permanently in
> the RPM_ACTIVE state and leak resources by never disabling the clocks?
> 
> [ ... ]
>> @@ -1102,7 +1180,9 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
>>   
>>   		renesas_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
>>   
>> -		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
>> +		time_left = wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
>> +		if (!time_left)
>> +			abort_xfer = true;
>>   
>>   		if (cmd->err)
>>   			break;
> 
> [Severity: High]
> This is a pre-existing issue, but similar to I3C transfers above, does this
> fail to break the loop when wait_for_completion_timeout() times out?
> 
> Since cmd->err remains 0 on timeout, the loop continues and eventually returns
> 0, hiding the timeout from the subsystem.
> 
> 
> Additionally, I noticed a pre-existing issue outside the immediate scope of
> this patch:
> 
> [Severity: High]
> This is a pre-existing issue, but in renesas_i3c_rx_isr() and
> renesas_i3c_resp_isr(), do the I3C FIFO reads copy data into cmd->rx_buf
> without advancing the buffer pointer?
> 
> renesas_i3c_rx_isr() does:
> 
>      i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
>      cmd->rx_count = read_bytes;
> 
> Since cmd->rx_buf is not incremented and rx_count is overwritten rather than
> accumulated, will multiple interrupts overwrite the beginning of the buffer?
> Could this leave the tail of the buffer uninitialized, leading to information
> leaks or data corruption when the subsystem reads it?
> 

-- 
Thank you,
Claudiu


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
