Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93663C44501
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Jul 2026 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJUj5jQVeHEb8IjSN+7MGBIG7zeElD7lg0xeYCuw4aY=; b=tZdC3kFmfQ3G1I
	y2ldnx7OkBCAJBoZHqfB1ZHgGXcn8j2VroBtKIJP23EYmcQbpiPanoIMuy6DaWPkpbMdEkXrtD+XU
	kc6DT906U3mYKuhZGIWLV/n4B1RPuVYKmGFHOKWROODXWDDYbFux6StY74okxEIPPXQxYiVZQbM/V
	8ue8Db+iNcUNSQrA3OEbByMRDgv3xGOmbz1Q1Ercc2EUBpVlP/SU1c4NgTG3uiwmjtdyOhXYEJQlx
	clqoPHuu2Bt6684d7QfTRlDKgJPPu4ZD1gDX+VTpEFCaqE11fuWJ2m4bZ4sUtEoLJBP55SIPkoaiF
	dqTLZDV1ohi7jcl6OonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvyL-0000000EKfL-1KAO;
	Wed, 15 Jul 2026 09:32:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvyK-0000000EKf4-1s7i
	for linux-i3c@lists.infradead.org;
	Wed, 15 Jul 2026 09:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DBC06001A;
	Wed, 15 Jul 2026 09:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED211F00A3A;
	Wed, 15 Jul 2026 09:32:04 +0000 (UTC)
Message-ID: <1b219dc7-ac56-4534-89ec-55e19a5d62ea@tuxon.dev>
Date: Wed, 15 Jul 2026 12:32:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment
 on resume
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
 <20260713130545.568657-7-claudiu.beznea+renesas@tuxon.dev>
 <20260713135032.ADFB41F00A3A@smtp.kernel.org>
 <alUZfNwy4VlMr06f@lizhi-Precision-Tower-5810>
 <5e17bba2-9259-4d39-8170-275927835943@tuxon.dev>
 <alaGq8mKvCm9kWao@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <alaGq8mKvCm9kWao@lizhi-Precision-Tower-5810>
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



On 7/14/26 21:57, Frank Li wrote:
> On Tue, Jul 14, 2026 at 12:30:13PM +0300, Claudiu Beznea wrote:
>>
>> On 7/13/26 19:59, Frank Li wrote:
>>> On Mon, Jul 13, 2026 at 01:50:32PM +0000,sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>> - [High] Removal of the DATBASn save/restore mechanism completely breaks the I3C bus upon resume for previously attached devices, and fails to resume if the bus was fully occupied.
>>>> --
>>>>
>>>> --- Patch [6]: [PATCH v5 06/17] i3c: renesas: Perform Dynamic Address Assignment on resume ---
>>>> commit e4ac838c055dc33beb2ff4e8968a032da48a2a47
>>>> Author: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> i3c: renesas: Perform Dynamic Address Assignment on resume
>>>>
>>>> This commit updates the suspend/resume operations by moving them out of
>>>> the noirq phase and attempting to perform Dynamic Address Assignment on
>>>> resume. It also removes the save and restore of the DATBASn registers.
>>>>
>>>>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>>>>> --- a/drivers/i3c/master/renesas-i3c.c
>>>>> +++ b/drivers/i3c/master/renesas-i3c.c
>>>> [ ... ]
>>>>
>>>>> @@ -1495,15 +1484,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>>>>>    	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
>>>>>    		       MSDVAD_MDYAD(i3c->dyn_addr));
>>>>>
>>>>> -	/* Restore Device Address Table values. */
>>>>> -	for (i = 0; i < i3c->maxdevs; i++)
>>>>> -		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
>>>>> -
>>>>>    	/* I3C hw init. */
>>>>>    	renesas_i3c_hw_init(i3c);
>>>>>
>>>>> +	ret = i3c_master_do_daa_ext(&i3c->base, true);
>>>> [Severity: High]
>>>> Does removing the DATBASn save and restore mechanism break communication
>>>> with previously attached devices upon resume?
>>>>
>>>> Looking at renesas_i3c_daa(), it explicitly skips hardware register
>>>> initialization for previously attached devices:
>>>>
>>>> renesas_i3c_daa() {
>>>>           ...
>>>>           if (olddevs & BIT(pos))
>>>>                   continue;
>>>>           ...
>>>> }
>>>>
>>>> Since the controller was reset during suspend, won't these hardware
>>>> registers remain uninitialized (0) if DATBASn isn't manually restored here?
>>>>
>>>> Additionally, if the bus was fully occupied before suspend, will this cause
>>>> the DAA process to abort entirely?
>>>>
>>>> renesas_i3c_daa() {
>>>>           ...
>>>>           ret = renesas_i3c_get_free_pos(i3c);
>>>>           if (ret < 0)
>>>>                   return ret;
>>>>           ...
>>>> }
>>>>
>>>> If the bus is full, free_pos would be 0, causing this to return -ENOSPC
>>>> immediately. This aborts before the ENTDAA command is sent, which would
>>>> leave the previously attached devices permanently stranded without dynamic
>>>> addresses.
>>> Please check this sashiko review result?
>> I tried to address this though the versions v2-v4 variant of this patch that
>> I've posted previously but after more investigation and thinking it looked
>> to me that the solution to this is not that simple and related only to this
>> driver (see below).
>>
>> Last time I've asked for some guidance [1] but got no input on it.
>>
>> Apart from v4, I tried (before posting v5) to use separate free_pos list to
>> be used while resuming, and still use only i3c_master_add_i3c_dev_locked()
>> in renesas_i3c_daa() but that didn't work either, because the devices
>> (present before suspend and) discovered at resume, ended up to be added to
>> the new list then deleted by the code of i3c_master_add_i3c_dev_locked().
>>
>> I have also thought about increasing the free_pos bitmask with one extra
>> entry while resuming to allow attach, detach, reattach work (for the devices
>> connected before suspend), but I don't think that is going to work either,
>> and looks hackish to me.
>>
>> I also tried calling i3c_master_detach_free_devs() (only the code for I3C
>> devices) before running DAA on resume but that wasn't enough for the
>> solution to work.
>>
>> I think this issue reported by sashiko can be encountered (at some point) on
>> all the drivers that track and limit the number of attached devices with a
>> bitmask (or other mechanism) and check that bitmask in the ->attach_i3c_dev.
>>
>> E.g., on the Renesas RZ/G3S I can end up to that point even w/o the code
>> from this patch doing the following:
>> 1/ connect 2 I3C devices to the bus (I'm using the NXP P3T1085UK-ARD with 2
>>     temperature sensors)
>> 2/ after the 2 I3C devices are attached, simulate the I3C bus is
>>     full (no entries in the free_pos mask) (with the diff patch below)
>> 3/ cut the power to the NXP P3T1085UK-ARD board
>> 4/ connect the power to the NXP P3T1085UK-ARD
>> 5/ at this point if I run do_daa the devices are not going to attach anymore
>>
>> I can simulate this on my side. I think it is the case for any other driver
>> following the above mentioned pattern for attaching.
>>
>> That was the reason I have currently dropped the attempt to solve the
>> problem highlighted by sashiko as its solution looks to me to be more
>> complicated and involved more testing to be done, not only related to this
>> driver.
>>
>> Since the issue is not only related to this patch but more on how the attach
>> procedure works, and can be reproduced w/o this patch, I considered only the
>> approach in this patch was be enough for suspend/resume fix and later fixes
>> should be added to cover this complicated scenario.
>>
>> Please let me know if you have any suggestions on how to go forward with
>> this problem.
>>
>> This is the patch I used for simulating full bus:
> If problem only exist when full, it should be fine.

Yes, it's only when the bus is full.

Thank you,
Claudiu

> It is less possible to
> happen at real world.
> 
> You explain it.
> 
> Frank


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
