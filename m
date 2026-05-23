Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D54CD5BB1
	for <linux-i3c@archiver.kernel.org>; Sat, 23 May 2026 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IlyU72l056Qi3LL6kflNTmbtU2ElzKFgXM5i0vAxgg=; b=scz++6EQoS+auU
	6VWevi45ABVHjp38YB4x7vkB+R5gupVi7DGTFzOqEMcoDzRwp7On5XR8bPWhV9d9uJAtoYw0cDMGW
	g4saGdUuKWibXQNE3RXXWGLTf2tSsShPI31TONVzZK6WAZAXeaAIkZUkbQL2++lodP5ne0Gcn0b0P
	2NMBRGWR2X6Uzdjhgeukt9o0/1T+hREGy+WNMGONBmq4UuGdm+Z2KaQbBkx9XYp2suoijGD8hvkSm
	L8arIs7l/QubNk5ZZVE7REj1V2tDFEz32u3+2MUZhQ8UF2+P14UE5V+/Xe0IA29nOgET+xqtzIH0V
	8M0t5LAqR0Ts+t9ASgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhV7-0000000CvQz-1esT;
	Sat, 23 May 2026 08:14:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhV6-0000000CvQm-1gtJ
	for linux-i3c@lists.infradead.org;
	Sat, 23 May 2026 08:14:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 810F060138;
	Sat, 23 May 2026 08:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C637B1F000E9;
	Sat, 23 May 2026 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779524067;
	bh=GL+RzpSO6B/WqNvCitg5GgJC9+53s7fBCUotsbLyogc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=khtrc05zufZUSXhAft3+tmNq2hcjhNoTUEt7Y225qTSTtcZtrfnOVKAD8I8p2XmAl
	 9UG02p1KkaXVyYZUQCCpy7/5fI1zpJjRUYrMkQ3vGrGczxDvWQ91uNujrVNdb2HV28
	 lAbAenWkAUeHMLH7yGDzPFoVp/A+QzroKg11bCmSQtY9OWZNcd0r37i7Ot/k+MjU2P
	 zrasUeseBU1Lw/t/ZYOkFR7d4CE1fUizMwyAUkOojQwupS7BJUUQ1MzstNoHU2mdVI
	 EvBMrbuZNIEgBx5e+LoKP091QQgqmtcmXMvqweR7ELpKAmho+kZ9a2fp0ZjesxjD8Y
	 g1aeTZa5k88oA==
Message-ID: <67bd230e-df9a-47fa-bdd7-d8b1e2ff1649@kernel.org>
Date: Sat, 23 May 2026 11:14:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] i3c: renesas: Use the divider 128
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-3-claudiu.beznea@kernel.org>
 <ahCpQUIH9_8mB0CP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCpQUIH9_8mB0CP@lizhi-Precision-Tower-5810>
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



On 5/22/26 22:06, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:00PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The REFCKCTL.IREFCKS field is 3 bits wide, and setting it to 7 selects a
>> divider of 128 for the internal reference clock. Use this divider value.
> 
> This doesnot reflect what your change, code add one more search for clks = 7

cks is later written in the renesas_i3c_bus_init() to the REFCKCTL.IREFCKS. The 
following lines are from the renesas_i3c_bus_init() function:

	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
	i3c->refclk_div = cks;

> 
> Frank
> 
>>
>> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/i3c/master/renesas-i3c.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index 36e3ccbe66b0..1917549cf6d5 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -559,7 +559,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>>
>>   	i2c_parse_fw_timings(&m->dev, &t, true);
>>
>> -	for (cks = 0; cks < 7; cks++) {
>> +	for (cks = 0; cks <= 7; cks++) {
>>   		/* SCL low-period calculation in Open-drain mode */
>>   		od_low_ticks = ((i2c_total_ticks * 6) / 10);
>>
>> --
>> 2.43.0
>>

-- 
Thank you,
Claudiu


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
