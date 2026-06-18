Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493F2CD98F9
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jun 2026 04:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ERSuZlpvXa5GwzNtrafeic6JIhMCD1moTt3s4lLSDE=; b=A/9i2wcZZ6c9aW
	Y5SL8glnGTN1oIogLFpHpTPAB31YrlkFKSSkLlcIAO5KNwWUlSu84dA2nSMLQIVN5Hrb5JfffCSs/
	e54M6VFz2DN9RvJlrrYZRGnxPRHFj+SAp+2kdSv43Kzp5FlVQALsZNVysJdYXsdAJ/SVs8SaH7y/v
	irAk34pqbmyPy+6rlrFMjByC0n1XqPB3fWQ9654p8B0oc99yx4mefJjORJKHBNe6+h7OXiYWyzNlv
	HVHdeaxASirH+VPue3Ax/SjmPLFgYhMtCEFmpSxDvTCF8DW8UJa5U1AlAufVaGxMey23Q40aEYJ8q
	24XGxstnzIijz7N+PGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4VU-00000000cJW-1cEt;
	Thu, 18 Jun 2026 04:37:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4VT-00000000cJO-1GBB
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jun 2026 04:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6540C60008;
	Thu, 18 Jun 2026 04:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278C01F000E9;
	Thu, 18 Jun 2026 04:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781757454;
	bh=07yMhPrmy8PV9Q7BMypGeASBfIEPZIFrJRpnXYyo1ck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=J6Uop2KK9MQHRsq8CJvQWxWAb0wpgiSHksG8/nvGeXpYBLmyfQxb8c19/fQKlxwMZ
	 ZV/1vDGTO4iOwaEGk66wybad7tSIfqQOY+4Pj3/5Xgbo0b94wigYadgHPzY/GyHIP4
	 slvOAvt9OQzXYfQpH9LmQT0LvoV4ed13qdwMcYgGFyKJDAhWwUy83hucbH0FzmZj9w
	 /oD/JoSRfad/z0QALDm7Jm8q3N3aBIh/f7c+SGQ5INPCeKemOLiNFQHpNVu5svoVtV
	 OGKoA/OksqvOq7wZzkkwK/PkFai3N1gevbMsabSlZ1U5Mvho5/rRyrrK7wY1bQsvSv
	 l4Z8TIBBdhkZw==
Message-ID: <a538baca-fc5f-43db-8d19-2b5fa8c510dc@kernel.org>
Date: Thu, 18 Jun 2026 07:37:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] i3c: renesas: Clean DATBAS register on detach
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org
References: <20260612160458.3102106-8-claudiu.beznea@kernel.org>
 <20260612162050.9CDD01F000E9@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260612162050.9CDD01F000E9@smtp.kernel.org>
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



On 6/12/26 19:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Critical] `renesas_i3c_group_devs_in_slots` assumes the target swap slot is occupied by an I3C device, which crashes if the slot is free. It also fails to update the free slot bitmask.
> 
> Pre-existing issues:
> - [High] The DATBAS registers and device address trackers for unused slots are left dirty after Dynamic Address Assignment (DAA), which can cause hardware TX/RX logic issues.
> --
> 
> commit bcdea49e3d9ced6f5b774a208065f0889dbb7c12
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> i3c: renesas: Clean DATBAS register on detach
> 
> The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
> register for the detached I3C device to avoid issues.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index a63edddbc9fe0..abe24e563d217 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -1042,6 +1042,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
>>   	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>>   	struct renesas_i3c *i3c = to_renesas_i3c(m);
>>   
>> +	renesas_writel(i3c->regs, DATBAS(data->index), 0);
>> +
>>   	i3c_dev_set_master_data(dev, NULL);
>>   	i3c->addrs[data->index].addr = 0;
>>   	i3c->addrs[data->index].i3c_dev = NULL;
> 
> [Severity: Critical]
> Since we are allowing I3C devices to be detached and free their slots here,
> will this cause a null pointer dereference in
> renesas_i3c_group_devs_in_slots() during resume?

We are allowing detaching when the bus is cleaned up and on re-attaching.

In case the bus is cleaned up, all the devices on the bus are detached.

On re-attaching, I considered that will happen as a result of a previously 
detach operation which will free a slot, but looking again at the code, all the 
detach and re-attach logic are under different conditions. I will re-consider 
and update it accordingly.

Thank you,
Claudiu

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
