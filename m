Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC9CD98ED
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jun 2026 04:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4osY35UyIqSgAIip825bJWA4xZT7WM3ZTroJH8eidM=; b=xS5iyRXR9lapJ/
	y5zLjGRyyG07BFIxQzAACIh69l+ONkSVysN/f0Q9h/MebQhWJYn4XBdjp5EmvxCf0qILSa9D8IjFU
	8dvH7endgbYVhVxtTt8suga1Z61otu1ACCf8NMstQlnfUCM6UcpMpb7f0oLjfKr86ybOcVJnCps7V
	OCLMy7WPXvGlGZW21b3BHR5SkAoBmNZhKWjj+J+G+wD4VFbQz+RjgvnTd5k2SZnDHL5gLyuM8N/Di
	GCaY/kbhYTuisN8xpk971XOXmY8MAekepZlgWl1Y0GLZPJ8tKl0zoJTZ9vxGtjSlLHQrcq/0hr4ii
	kyt7JXGTEgBKNFpDDK0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4iP-00000000clT-2i70;
	Thu, 18 Jun 2026 04:50:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4iO-00000000clK-1F07
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jun 2026 04:50:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0264B60008;
	Thu, 18 Jun 2026 04:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87E01F000E9;
	Thu, 18 Jun 2026 04:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781758254;
	bh=WH2L0VL7aYUvX+jPB2e78om6SfydBYtA3DwlFVhzpZ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Vpsz57FdAfnMXNQMk9+FdVm62kaqG3EmuiAlw3OwK7GDTAMduoDRoOULnGQRLPFK1
	 4nptzPwDGV+6EdqcuvSBpFf/CQ9Ng1uR8pxIGXaItKa5bm0D6rvZiKcGU7PVbiC/Ip
	 0oolIQ+6P4oPg1nthrZRHUW4ENxy6+/LVEfNn+2tmAavxsDv76gFMy3lzkLOUvuzyI
	 tQqpae5fdnGLjQ4oMI3QX4qPCJXfvkmEQeEZsc+IoRsGp8fYX61UpmNeg54w6HE9hY
	 LK4u9OytR6DgWnS3/BdIULldk/YR1rjA+kxDZo9VUDD3z4oq6lISgH4oSpFjFqGP86
	 lu12xEuUYcspQ==
Message-ID: <559b8b0c-412a-4d0f-9872-a4c92f3b9611@kernel.org>
Date: Thu, 18 Jun 2026 07:50:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] i3c: renesas: Perform Dynamic Address Assignment
 on resume
To: sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org
References: <20260612160458.3102106-7-claudiu.beznea@kernel.org>
 <20260612161937.99F011F000E9@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260612161937.99F011F000E9@smtp.kernel.org>
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

Hi, I3C maintainers,

On 6/12/26 19:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] `renesas_i3c_group_devs_in_slots()` crashes due to NULL pointer dereference when swapping an I2C device into a previously empty slot.
> - [High] Slot state corruption and hardware configuration overwrite during device grouping.
> - [High] Build failure and state corruption due to calling undefined function `i3c_master_reattach_i3c_dev_locked()` and bypassing PID matching.
> --
> 
> commit e2b35e6a6eb1e4e88dd575a2f0b9fe6f7bf5f7c5
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> i3c: renesas: Perform Dynamic Address Assignment on resume
> 
> The Renesas RZ/G3S SoC supports a power saving mode where power to most
> SoC components, including I3C, is turned off. Running DAA in the controller
> resume path restores communication for devices that also lose power.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index 67b9a31300d09..a63edddbc9fe0 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
> 
> [ ... ]
> 
>> @@ -637,12 +646,80 @@ static void renesas_i3c_bus_cleanup(struct i3c_master_controller *m)
>>   	renesas_i3c_reset(i3c);
>>   }
>>   
>> +static u8 renesas_i3c_group_devs_in_slots(struct renesas_i3c *i3c)
>> +{
>> +	struct renesas_i3c_i2c_dev_data *new_i2c_data, *new_i3c_data;
>> +	struct renesas_i3c_addr i2c_addr, i3c_addr;
>> +	struct i3c_dev_desc *i3c_dev;
>> +	struct i2c_dev_desc *i2c_dev;
>> +	u8 i2c_pos = 0;
> 
> [ ... ]
> 
>> +	for (u8 pos = 0; pos < i3c->maxdevs; pos++) {
>> +		if (i3c->free_pos & BIT(pos))
>> +			continue;
>> +
>> +		if (!i3c->addrs[pos].is_i2c)
>> +			continue;
>> +
>> +		if (pos == i2c_pos) {
>> +			i2c_pos++;
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * Swap the I3C device on i2c_pos slot with the I2C dev
>> +		 * on pos slot.
>> +		 */
>> +		i3c_addr = i3c->addrs[i2c_pos];
>> +		i3c_dev = i3c_addr.i3c_dev;
>> +
>> +		i2c_addr = i3c->addrs[pos];
>> +		i2c_dev = i2c_addr.i2c_dev;
>> +
>> +		new_i2c_data = i3c_dev_get_master_data(i3c_dev);
> 
> [Severity: High]
> Does this crash when swapping an I2C device into a previously empty slot?

I explained in [1] the rationale for which I chose it like this. I will adjust 
it accordingly.

[1] 
https://lore.kernel.org/sashiko-reviews/a538baca-fc5f-43db-8d19-2b5fa8c510dc@kernel.org/

> 
> When i2c_pos does not advance over empty slots, i3c_dev will be NULL if
> the destination slot is empty. Since i3c_dev_get_master_data() unconditionally
> dereferences the pointer (dev->common.master_priv), it seems this would cause
> a kernel panic when swapping into an empty slot.
> 
>> +		new_i3c_data = i2c_dev_get_master_data(i2c_dev);
>> +
>> +		i3c->addrs[i2c_pos] = i2c_addr;
>> +		i3c->addrs[i2c_pos].is_i2c = true;
>> +		i3c->addrs[i2c_pos].i2c_dev = i2c_dev;
>> +
>> +		i3c->addrs[pos] = i3c_addr;
>> +		i3c->addrs[pos].is_i2c = false;
>> +		i3c->addrs[pos].i3c_dev = i3c_dev;
>> +
>> +		new_i2c_data->index = i2c_pos++;
>> +		new_i3c_data->index = pos;
>> +
>> +		i2c_dev_set_master_data(i2c_dev, new_i2c_data);
>> +		i3c_dev_set_master_data(i3c_dev, new_i3c_data);
>> +	}
> 
> [ ... ]
> 
>> @@ -655,16 +732,25 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>>   	olddevs = ~(i3c->free_pos);
>>   	i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_ENTDAA;
>>   
>> +	if (i3c->resuming)
>> +		first_i3c_pos = renesas_i3c_group_devs_in_slots(i3c);
>> +
>>   	/* Setting DATBASn registers for target devices. */
>>   	for (pos = 0; pos < i3c->maxdevs; pos++) {
>> -		if (olddevs & BIT(pos))
>> -			continue;
>> +		if (olddevs & BIT(pos)) {
> 
> [Severity: High]
> Does this clobber the configuration of I2C devices swapped into empty slots?
> 
> Since renesas_i3c_group_devs_in_slots() does not update i3c->free_pos during
> a swap, the olddevs mask calculated before the grouping is now stale.

Will update the free_slots for this scenario as well.

> 
> If an I2C device was moved to a previously empty slot, olddevs & BIT(pos) will
> evaluate to false. This bypasses the skip logic, treats the newly moved I2C
> device as an unassigned slot, and generates a new dynamic address for it,
> blindly overwriting its DATBAS hardware configuration.
> 
> [ ... ]
> 
>> @@ -689,12 +780,38 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>>   
>>   	renesas_i3c_wait_xfer(i3c, xfer);
>>   
>> -	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
>> -	newdevs &= ~olddevs;
>> +	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, first_i3c_pos);
>> +	/* Re-attach all the I3C devices on resume. */
>> +	if (!i3c->resuming)
>> +		newdevs &= ~olddevs;
>>   
>>   	for (pos = 0; pos < i3c->maxdevs; pos++) {
>> -		if (newdevs & BIT(pos))
>> -			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
>> +		if (!(newdevs & BIT(pos)))
>> +			continue;
>> +
>> +		/*
>> +		 * If the bus was fully occupied before suspend, re-attach the
>> +		 * devices and update the addresses tracked by the subsystem.
>> +		 * Without this, i3c_master_add_i3c_dev_locked() returns errors
>> +		 * due to a lack of free slots (as reported by
>> +		 * renesas_i3c_get_free_pos()), causing the attachment to fail.
>> +		 *
>> +		 * Otherwise, follow the normal
>> +		 * i3c_master_add_i3c_dev_locked() path, which will re-attach the
>> +		 * devices, keep the subsystem state and driver addresses in sync,
>> +		 * and perform all the required internal bookkeeping.
>> +		 */
>> +		if (!i3c->free_pos && i3c->resuming) {
>> +			struct i3c_dev_desc *dev = i3c->addrs[pos].i3c_dev;
>> +			u8 old_dyn_addr;
>> +
>> +			old_dyn_addr = dev->info.dyn_addr;
>> +			dev->info.dyn_addr = i3c->addrs[pos].addr;
>> +
>> +			i3c_master_reattach_i3c_dev_locked(dev, old_dyn_addr);
> 
> [Severity: High]
> This calls i3c_master_reattach_i3c_dev_locked() which does not appear to exist
> in the kernel, causing a build failure.
> 
> Also, does this logic cross-wire physical devices with the wrong software
> structures?
> 
> It blindly assigns newly generated dynamic addresses to the pre-suspend
> device structures based solely on their slot index (pos). However, ENTDAA
> assigns addresses based on Provisioned ID (PID) arbitration order, not the
> previous slot indices. If the bus topology changes or devices arbitrate in a
> different order, commands might be sent to the incorrect targets, potentially
> causing data corruption.

I'm not sure how to solve this problem other than going through the 
i3c_master_add_i3c_dev_locked(). Or duplicate code. Maybe exporting 
i3c_master_detach_free_devs() and call it before running DAA to be able to run 
i3c_master_add_i3c_dev_locked() which takes care of all the attachment procedure?

I3C maintainers: could you please give some advice on this ?

This scenario is only for the case where the bus was fully occupied during a 
suspend/resume. Is it a valid case to have devices disappear during a 
suspend/resume?

Also, I want to mention that I currently don't have this problem, it was 
implemented as a result of it being pointed by sashiko.

-- 
Thank you,
Claudiu


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
