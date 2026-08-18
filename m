Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42517C5DF81
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0AItoZW+uieuH6c8ChpG4eE7mc8d6Rv77YPHe/nwNI=; b=dE8AsSG/2qFnPj
	hLG+OkcucjgEdz3j7Qbg78/W9j5nZ51NbndmqrKJHb5CdI92j/P/fuWKydnTJ9n8qyXccUajAi7Qn
	kdYAw0XbrNb5uWAgzDE0LgwXT1iCAKguBlcOMsx9D93+PMZYVeSak6I4CWBa8QBPAyt/qIixB12tv
	bvypvaflihMiZAbRIchRlRiG3/oMsSFi95F8jeiblCQ08Uk1glPXYD6g/byHb6WiWvyt0s/DoSZHk
	1pL+zLxpo1IGKvtOmPrY4Bz7wDriNRQZtpsCAHTk+dKvUF1yASulpB1rcmdQEWyvMZ3hfLzkLSWJ6
	ksNIe4WYhgkP1f/FgA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRCJ-00000008fah-39Ei;
	Tue, 18 Aug 2026 21:18:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRCG-00000008faI-0fjO
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 21:18:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6E8241A1708;
	Tue, 18 Aug 2026 21:18:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BE4C60355;
	Tue, 18 Aug 2026 21:18:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02AD811C74F91;
	Tue, 18 Aug 2026 23:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787087885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=theVMtt8PGMNifoEo4OeVx2CmK0+t/UoylVVlPA5U7s=;
	b=hpcPZvs1wT5asHWfE7NqfxY2FicBHbT5zaclfpIlW15CuM3aQyp8hzxgPTQgBJUBnApLJq
	87jiAJRVeZVEm85/wyk+fm/TFKPhhsCc5Cgiz+IdoRv49NYBekifD7Ur3UUnaTIiogD7Wg
	ny/KvyKi3Q76uyL3+FSXoRF5OIxRV1rVux/8fA9Ut67oaDmGtqr12IKuZbj10VKZklC84u
	S0RiAxf6d1ZgpxCFFrlwKbLT5+nwmWqpLv/VGxpEAWs4yi+UUSV6zYISYbtBItIb74x26A
	6TdCJe06jrFLRsk6w+1PsrGRYe121Bf2Jx8QMhQ2m70SE8vuBEeH4XN2cGBhSw==
Date: Tue, 18 Aug 2026 23:18:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw: reduce do_daa time if there's no client
Message-ID: <2026081821180483742fa7@mail.local>
References: <20260814042015.25397-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814042015.25397-1-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_141812_344810_DBEDAEDC 
X-CRM114-Status: GOOD (  20.29  )
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

Hi Jisheng,

On 14/08/2026 12:20:15+0800, Jisheng Zhang wrote:
> dw_i3c_master_daa() derives the number of newly assigned dynamic
> addresses from cmd->rx_len, the ISR sets it to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already
> means "every address was assigned", so a timed out transfer leaves
> that value in place and it gets used as a result.
> 
> If there's no client connected, the addr assign cmd times out, then
> the driver calls i3c_master_add_i3c_dev_locked() to add devices that
> are not there, each costing about 1s, thus adds non necessary boot
> time up to (maxdev * 1)s.
> 
> Start from maxdevs instead: no address is assigned before ENTDAA runs,
> and make newdevs as 0 if the existing rx_len >= maxdevs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> since v1:
>  - use another method to remove the non-necessary calling of
>    i3c_master_add_i3c_dev_locked() if there's no client
>  - update commit msg
> 
>  drivers/i3c/master/dw-i3c-master.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

You'd have to rebase this one on i3c/next as it doesn't apply cleanly
anymore.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1053cfb05c05..883b542c7bfc 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -876,6 +876,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  		goto rpm_out;
>  	}
>  	cmd = &xfer->cmds[0];
> +	cmd->rx_len = master->maxdevs;
>  	cmd->cmd_hi = COMMAND_PORT_TRANSFER_ARG;
>  	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
>  		      COMMAND_PORT_DEV_INDEX(pos) |
> @@ -888,7 +889,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>  
> -	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
> +	if (cmd->rx_len >= master->maxdevs)
> +		newdevs = 0;
> +	else
> +		newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
>  	newdevs &= ~olddevs;
>  
>  	for (pos = 0; pos < master->maxdevs; pos++) {
> -- 
> 2.51.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
