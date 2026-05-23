Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E7ACD5BAC
	for <linux-i3c@archiver.kernel.org>; Sat, 23 May 2026 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7efWCZd8D26CcmYq/rM4glmR3NEcqDUK1zgmaQZQMo=; b=0bWK4foyAEjFSc
	A7yW7/aeYyTALqorkQTJcSCIdTqm/J3FdVghF6NkYfmiuk6/ftXmtZRMEoQEx0ujCWtewKNBISPKP
	L+ZNr+pvVeewxoCctd+sPxyPrGQwfqKPoddwbCceASUSgVW2jPWzjlkljDCK/SaA0dk/1EP+o58OW
	L0w3qVZQw6qjwdic4HWiOZhq4qQci1yjJ0NNm8vL+isYy8xXqlwIl5oOpMfsm0dIjRLbqKMDWl9eV
	hebc5D55QPgrPsfMeU7RVSgR923t5VcSyDMnzVyFwlg2H/dIvlzU0lcCLUpBURutLktIXTAhTKUxG
	pzFsIsnMO99IrhapPx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjZJ-0000000D5iT-2gcC;
	Sat, 23 May 2026 10:26:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjZH-0000000D5hq-2jBG
	for linux-i3c@lists.infradead.org;
	Sat, 23 May 2026 10:26:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BC7040A79;
	Sat, 23 May 2026 10:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38DE1F000E9;
	Sat, 23 May 2026 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779532015;
	bh=DnxFsIvB4g+whV8WLOQGnh517IDcreGsHFMmjC/hnIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TrLr9KujNLXmyJniRJxaOWwPima5ERnM7C4gOH8fl0rNrjrBjgpDm9/VuAPPfL5Ce
	 tIdLGeozB5gP11ecku+iQRorhJfBo5FPgR/6CoG8IsaFRytIcs1nK8nYTjnTqW+pMA
	 dZC0qJRSlFk9mEex6k2lXI4B7xQDTIWrj+0sxw2GuBu3/5bEi65NJNyv6AgOaBSsBr
	 7igedV7M4VL+RuVFHFvF26Nq8oTl/z4n/HRXB5rMeMgmEVwLSlLpVXrQ69XLFr8DOi
	 pksJ+P5OtfMUIK9mhB+r4yqCa/xOfQhadcc75Qb6XrIyBMjLT/bfki+pFHWcY1ssFL
	 zWaYTAbYTPduQ==
Message-ID: <05db9476-7f26-4d90-b79c-5a4fa1de0f01@kernel.org>
Date: Sat, 23 May 2026 13:26:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] i3c: renesas: Use reset_control_bulk_{assert,
 deassert}()
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-10-claudiu.beznea@kernel.org>
 <ahCsOZ74txWyp0OO@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCsOZ74txWyp0OO@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_032655_712244_8E42BF91 
X-CRM114-Status: GOOD (  11.87  )
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



On 5/22/26 22:19, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:07PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
>> suspend and resume paths to simplify the code.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
>>   1 file changed, 13 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index d32646deb69f..e5963270d6e5 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -1414,24 +1414,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>>   static int renesas_i3c_suspend(struct device *dev)
>>   {
>>   	struct renesas_i3c *i3c = dev_get_drvdata(dev);
>> +	struct reset_control_bulk_data resets[] = {
>> +		{ .rstc = i3c->presetn },
>> +		{ .rstc = i3c->tresetn },
>> +	};
> 
> Suppose it is also used in probe funciton. can move these into renesas_i3c
As explained in patch 06/07 is either this way or complicate other code paths. 
Please let me know the preferred approach.

-- 
Thank you,
Claudiu


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
