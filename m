Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3A1C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jul 2026 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nb9smSEj/gilZRbHpFZyJVLMM1ORLTSjUiXwODhAp3Q=; b=Mu/Y6odGtoE62A
	fxlrUwlDyuGeQb/Gu8ImUR/m6CNFfDIGm2e/GIr9ZcrjTecD9+G604UFdID4WAOeYsgwzi3dMRPyY
	xRrVBv0w+iKaqwZo0aArkAmXjhI/SqZWRqxb/25guoJSCJDUWlGSFRtpeI5WIPMmii7QMLDuNy3h4
	vMfnjqZ5lR+eLfO4Pgw8trSyH7eAj3ux6S6hGOw78D82lU8Z901tSscy74RD6EDi+38NtOi/T/dEC
	BnXEskAICvErrnMhT3N3PNZtHMQcA6j2pNXPNhg8KaEKb+c7RFE/R40sC9GMGnnrljavmfUVe1X3J
	ubfr4D6eMUMDpYdCbEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDNi-00000003y0C-1URH;
	Thu, 02 Jul 2026 09:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDNh-00000003y03-013a
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jul 2026 09:06:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F52C42A60;
	Thu,  2 Jul 2026 09:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991F71F000E9;
	Thu,  2 Jul 2026 09:06:45 +0000 (UTC)
Message-ID: <236829b5-1bd9-44ae-ad05-71e0ea183fc8@tuxon.dev>
Date: Thu, 2 Jul 2026 12:06:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: renesas: reset xfer status before each wait
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260625030357.87402-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260625030357.87402-1-pengpeng@iscas.ac.cn>
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

Hi, Pengpeng,

On 6/25/26 06:03, Pengpeng Hou wrote:
> renesas_i3c_wait_xfer() reinitializes the completion before queuing a
> transfer, but it leaves xfer->ret unchanged. 

In the current code the xfer->ret is initialized with -ETIMEDOUT when it is 
allocated in renesas_i3c_alloc_xfer().

> After one transfer completes
> successfully, a later timeout can therefore reuse the old zero status.

The patch here took this into account: 
https://lore.kernel.org/all/20260612160458.3102106-17-claudiu.beznea@kernel.org/

Please check the places where renesas_i3c_irqs_mask_and_clear() is called.

> 
> Reset xfer->ret to -ETIMEDOUT before each wait, return the transfer
> status from the wait helper, and propagate it from DAA, CCC and private
> I3C transfers.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/i3c/master/renesas-i3c.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index f39c449922ca..7f123cd72cdf 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -433,15 +433,18 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
>   	}
>   }
>   
> -static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
> +static int renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
>   {
>   	unsigned long time_left;
>   
> +	xfer->ret = -ETIMEDOUT;
>   	renesas_i3c_enqueue_xfer(i3c, xfer);
>   
>   	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
>   	if (!time_left)
>   		renesas_i3c_dequeue_xfer(i3c, xfer);
> +
> +	return xfer->ret;

In some DAA cases this might be a negative number but we could still consider it OK.

>   }
>   
>   static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
> @@ -687,7 +690,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>   		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
>   		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
>   
> -	renesas_i3c_wait_xfer(i3c, xfer);
> +	ret = renesas_i3c_wait_xfer(i3c, xfer);
> +	if (ret)
> +		return ret;

Have you tested this? My previous experiments around this code tell me this 
might not be OK for all the cases.

Thank you,
Claudiu

>   
>   	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
>   	newdevs &= ~olddevs;
> @@ -800,9 +805,7 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>   		}
>   	}
>   
> -	renesas_i3c_wait_xfer(i3c, xfer);
> -
> -	ret = xfer->ret;
> +	ret = renesas_i3c_wait_xfer(i3c, xfer);
>   	if (ret)
>   		ccc->err = I3C_ERROR_M2;
>   
> @@ -815,7 +818,7 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>   	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>   	struct renesas_i3c *i3c = to_renesas_i3c(m);
>   	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> -	int i;
> +	int i, ret;
>   
>   	/* Enable I3C bus. */
>   	renesas_i3c_bus_enable(m, true);
> @@ -854,7 +857,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>   				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
>   		}
>   
> -		renesas_i3c_wait_xfer(i3c, xfer);
> +		ret = renesas_i3c_wait_xfer(i3c, xfer);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	return 0;


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
