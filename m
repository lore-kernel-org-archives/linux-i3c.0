Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AC2CD6E57
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbspiEup2W2RL/tg4jWM6WbA7sY2Xg994/RSh4eOPCM=; b=jTjuwH037x3Xv3
	hagujwAyYNszmlXhSw0w6HnETxeaTyW3Ikv71pp3kwM/oVVLVvqmgGkREEuNGILHPcRboALkTYaiN
	hb86XAZbhVUIazSHNi4Q9UTjcbKMBhWl2gdC3trE70kohaDjqA5EowrOaOBMLrS57BRZojWb2LRc/
	W+vif0k/ohkVEekY+L+7EybIj0xx47azVBTg/eMPW74XUCcVboQ7NxwwVCS86/AhagInfcB+2J/qc
	2DdKURX2pK+lkLSdcneMIQzknIGmzqrLrx5T26zJ8AWawAhVi/vmkji57xBiFr6Nk/hLfuz2Hst15
	4R92mq7iOey5hfV3oClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmUz-0000000FFD5-2Z14;
	Wed, 03 Jun 2026 14:23:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmUy-0000000FFCT-12wI
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 14:23:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DF536022F;
	Wed,  3 Jun 2026 14:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28B11F00893;
	Wed,  3 Jun 2026 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780496590;
	bh=x1z48cikCloEgwei4UZk2o1cFtb4Fcuckbpr03SF0K4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GhbtyuJ2Lk5KVFguq11SYAHj+S5CMxeq39Ya2P9x4oLLpnU8O4/Deg51/RpCYuO/+
	 d3p5YonWwOINm29f2sNzIlGdtncmC6AgglLpPEijOpV1G3GC6DpY6xzsuZY7EkZ45N
	 QLtQcMVyxJFqp+CehMhZsjSAOuEopmuGR4MRDiWr26V0BXx3Db60gjNsZ3uKmntaV4
	 30JAivctrmzDXBqye3x0LZe2rZ4Znr3jNGy5Q93vn3j0sC82akGqrdUh52cRgVLFIi
	 cKfd4TrehxlPP0uQydYLTDofP39S7TzoSjE8Al8dJF1BOoAHL9n96fWWqa0txQDOgv
	 i6LDvgMUnW1zA==
Message-ID: <8687d3cb-628a-477b-9dfd-2db8c412b277@kernel.org>
Date: Wed, 3 Jun 2026 17:23:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] i3c: renesas: Perform Dynamic Address Assignment
 on resume
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
 <20260602132824.3541151-7-claudiu.beznea@kernel.org>
 <ah85RaUXmaBVFkYk@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ah85RaUXmaBVFkYk@lizhi-Precision-Tower-5810>
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

Hi, Frank, I3C maintainers,

I've inlined the sashiko comments here to discuss them:

On 6/2/26 23:12, Frank Li wrote:
> On Tue, Jun 02, 2026 at 04:28:13PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC supports a power saving mode where power to most
>> SoC components, including I3C, is turned off.
>>
>> On systems where the I3C devices also loses power during suspend (e.g. NXP
>> P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
>> 2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
>> resume.
>>
>> Running DAA in the controller resume path restores communication. However,
>> DAA relies on interrupts for TX/RX, which are not available in the noirq
>> suspend/resume phase (unless they are wakeup interrupts). For this, the
>> suspend/resume callbacks were moved out of the noirq phase. Currently,
>> there is no identified use case on either the Renesas RZ/G3S or Renesas
>> RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
>> the noirq suspend/resume phase.
>>
>> Since renesas_i3c_reset() is not called anymore in atomic context
>> update it to use read_poll_timeout().
>>
>> To cover the case where the controller had already attached all the
>> i3c->maxdevs devices before a suspend/resume cycle and i3c->free_pos is
>> zero, struct renesas_i3c::resuming flag was introduced.
>>
>> The flag is set in renesas_i3c_resume() before calling
>> i3c_master_do_daa_ext() and checked in renesas_i3c_daa(). In case it is
>> set the previous saved DATBAS register values are used for the slots
>> already occupied before suspend. This allows keeping alive the connection
>> to the I3C devices when all the supported slots are occupied before
>> suspend.
>>
>> When resuming from suspend, renesas_i3c_daa() re-runs DAA for al
>> slots except those used by I2C devices. I2C devices are attached during
>> probe, at bus initialization time, and always occupy the first positions in
>> i3c->free_pos. In addition, there are no DATBAS register settings
>> associated with them.
>>
>> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
> 
> Please check sashiko review result
> 
> https://sashiko.dev/#/patchset/20260602132824.3541151-1-claudiu.beznea%40kernel.org
> 
 >commit 6783acf82418dd115df661f4dc9d5758f653b084
 >Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 >Date:   Tue Jun 2 13:28:13 2026 +0000
 >    i3c: renesas: Perform Dynamic Address Assignment on resume
 >    The Renesas RZ/G3S SoC supports a power saving mode where power to most
 >    SoC components, including I3C, is turned off.
 >
 >    On systems where the I3C devices also loses power during suspend (e.g. NXP
 >    P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
 >    2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
 >    resume.
 >
 >    Running DAA in the controller resume path restores communication. However,
 >    DAA relies on interrupts for TX/RX, which are not available in the noirq
 >    suspend/resume phase (unless they are wakeup interrupts). For this, the
 >    suspend/resume callbacks were moved out of the noirq phase. Currently,
 >    there is no identified use case on either the Renesas RZ/G3S or Renesas
 >    RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
 >    the noirq suspend/resume phase.
 >    Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
 >    Cc: stable@vger.kernel.org
 >> --- a/drivers/i3c/master/renesas-i3c.c
 >> +++ b/drivers/i3c/master/renesas-i3c.c
 >[ ... ]
 >> @@ -657,14 +664,33 @@ static int renesas_i3c_daa(struct 
i3c_master_controller *m)
 >>
 >>      /* Setting DATBASn registers for target devices. */
 >>      for (pos = 0; pos < i3c->maxdevs; pos++) {
 >> -            if (olddevs & BIT(pos))
 >> +            if (olddevs & BIT(pos)) {
 >> +                    /*
 >> +                     * In case of resume, reassign DAs for all devices on the
 >> +                     * bus to avoid failures when all i3c->maxdevs slots were
 >> +                     * already occupied before suspend.
 >> +                     *
 >> +                     * Exclude I2C devices, as they are attached during probe,
 >> +                     * at bus initialization time, and there are currently no
 >> +                     * register updates associated with them.
 >> +                     */
 >> +                    if (i3c->resuming) {
 >> +                            if (i3c->addrs[pos].is_i2c) {
 >> +                                    last_i2c_pos = pos;
 >> +                            } else {
 >> +                                    renesas_writel(i3c->regs, DATBAS(pos),
 >> +                                                   i3c->DATBASn[pos]);
 >> +                            }
 >> +                    }
 >Does restoring these blindly from the saved state cement addresses for future
 >ENTDAA, bypassing normal device assignment?
 >If a device is removed, hot-plugged, or wakes up slowly, couldn't a different
 >device win arbitration and be assigned an address from an unrelated DATBASn
 >slot?

Currently, the driver don't support hot-plug.

I presumed the remove in suspend is not actually a valid use-case, but with this 
scenario, if that happens, the device still remains attached in the software 
data structures. After this sequence:
1/ suspend
2/ disconnect an I3C device
3/ resume
4/ suspend
5/ re-connect the I3C devices
6/ resume

the reconnected I3C device works again after step 6 (according to my testing).

Waking up may happen slowly, indeed. So, I presume this is a valid use case.

Now, I have few question (if my I3C understanding is right):

I noticed none of the I3C drivers are taking care of the use case where the bus 
is fully populated after resume (and we are after a resume with power lost, for 
both the controller and the devices). That looks a bit tricky scenario to cover, 
to be honest, as all the drivers check for a free slot in ->attach_i3c_dev(), 
and, for a fully populated bus, that will not update the newly assigned 
addresses in the subsystem data structure.

If the ->attach_i3c_dev() called though the i3c_master_add_i3c_dev_locked() 
fails then nothing is continued so, the device address changes are not 
propagated in all the software data structures.

In case we re-use the DATBAS() register values as proposed in this patch, we 
have the changes that the driver software data caches (i3c->addrs[].addr) and 
the subsystem I3C devices addresses to match. But, that may not be true all the 
time.

If we re-assign new addresses to i3c->addrs[].addr in the DAA API, then write 
those values to DATBAS() registers, but the bus is fully populated, or no new 
devices are discovered as the indices remains the same, then, since we execute 
i3c_master_add_i3c_dev_locked() only for the newly attached devices, then the 
subsystem and the driver addresses don't match anymore. I couldn't found a 
global API similar to i3c_master_add_i3c_dev_locked() to work for removing 
devices and re-attaching at resume, for such scenario. I'm not sure that's good 
to do, though. If we call i3c_master_add_i3c_dev_locked() unconditionally, then 
it will still not work on a full previously occupied bus.

If I'm not wrong with all these, could you please let me know how would you 
consider covering this scenario? This is what I've tried to address with the 
approach in this patch. I currently don't have a testing setup for this, I only 
simulated it by setting i3c->free_pos = 0 before calling i3c_master_do_daa_ext().

Would the usage of i3c_device_do_setdasa() being called from a master driver be 
something acceptable? Though, I currently haven't played around with it.

As I don't have a real setup to test this, would it be OK to restore the 
approach in this patch as proposed in v1?

Please let me know. Thank you!

 >> +
 >>                      continue;
 >> +            }
 >>
 >>              ret = i3c_master_get_free_addr(m, last_addr + 1);
 >[ ... ]
 >> @@ -674,9 +700,21 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 >>      cmd = xfer->cmds;
 >>      cmd->rx_count = 0;
 >>
 >> -    ret = renesas_i3c_get_free_pos(i3c);
 >> -    if (ret < 0)
 >> -            return ret;
 >> +    if (i3c->resuming) {
 >> +            /* Nothing to do if all slots are ocupied by I2C devices. */
 >> +            if (last_i2c_pos == i3c->maxdevs - 1)
 >> +                    return 0;
 >> +
 >> +            /*
 >> +             * Do DAA for all the devices on the bus, if resuming, except
 >> +             * the I2C ones.
 >> +             */
 >> +            ret = last_i2c_pos < 0 ? 0 : last_i2c_pos + 1;
 >Does this incorrectly assume that all I2C devices occupy contiguous slots at
 >the beginning of the device array?

I wasn't aware of the notifier used to add I2C devices to the bus.

 >If an I2C device is attached dynamically at a higher slot while lower slots
 >are occupied by I3C devices, will DAA start at a higher index, skipping the
 >lower I3C devices? The hardware would assign new addresses from the higher
 >offset, duplicating devices and breaking communication.
 >> +    } else {
 >> +            ret = renesas_i3c_get_free_pos(i3c);
 >> +            if (ret < 0)
 >> +                    return ret;
 >> +    }
 >>
 >>      /*
 >>       * Setup the command descriptor to start the ENTDAA command
 >> @@ -694,7 +732,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 >>
 >>      for (pos = 0; pos < i3c->maxdevs; pos++) {
 >>              if (newdevs & BIT(pos))
 >> -                    i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
 >> +                    i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos].addr);
 >>      }
 >Since olddevs are masked out from newdevs prior to this loop in renesas_i3c_daa
 >(newdevs &= ~olddevs), is the I3C framework prevented from being notified of
 >shifted dynamic addresses landing in previously occupied slots?
 >Because i3c_master_add_i3c_dev_locked() is never called for these, the
 >framework could remain unaware of identity shifts and continue communicating
 >with devices using mismatched PIDs, risking data corruption.

That is a previously existing problem that may happen. However, I am not sure 
how we should deal with the case when this is called after resume, on a fully 
populated bus.

Frank, I3C maintainers, should we cover this case for now? Do you have some 
hints on how to go forward with it?

 >[ ... ]
 >> @@ -1435,7 +1475,7 @@ static void renesas_i3c_remove(struct platform_device 
*pdev)
 >>      i3c_master_unregister(&i3c->base);
 >>  }
 >>
 >> -static int renesas_i3c_suspend_noirq(struct device *dev)
 >> +static int renesas_i3c_suspend(struct device *dev)
 >>  {
 >>      struct renesas_i3c *i3c = dev_get_drvdata(dev);
 >>      int i, ret;
 >[ ... ]
 >> +    ret = reset_control_assert(i3c->tresetn);
 >> +    if (ret)
 >> +            goto err_presetn;
 >> +
 >> +    clk_bulk_disable(i3c->num_clks, i3c->clks);
 >> +
 >> +    return 0;
 >Since this callback is being moved out of the noirq phase where interrupts are
 >still enabled, is it safe to disable clocks and assert hardware resets without
 >first disabling the device interrupts (e.g., via disable_irq())?
 >If an interrupt fires during this time, the ISR might access unclocked MMIO
 >registers belonging to a reset IP, which could trigger a synchronous external
 >abort.

That may have happen even previously if the interrupts were configured as wakeup 
sources. However, at this point, all the clients should be suspended and thus, 
they shouldn't generate interrupts.


-- 
Thank you,
Claudiu


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
