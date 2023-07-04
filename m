Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210E1EB64D9
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Jul 2023 21:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ld6aIDD0nukf6rtnAkOQUzGcP9Akqnc5ISSsZ2Yf/xk=; b=o28c5kHucO/r++
	Q5Vz6r4ZQtmD9yvQbqKwR+gjkCGnSMGrZULL4iOeFajZzPWE7+yHxOXRJ67Idq7pN22cL7l3jkFHY
	EmbIqnuPWSMlfLmJr6JAEUB+1ZBB0psg8c/WcnHGUpoW4oWvf7Xx8nGOBdcF7FX79xWgsaa6wiDVW
	WjXxhAf+Oz50Srj83q3phvKcBrbllYSXWR0rlVDMkEWDT+hz2PL0zjj1awf0rrNfvijspIf/YSgtO
	LNOoHvUueESv6Z5G83nzXE3wT9mUYWwrag6XZsqq46Sy7Ttnvassi8bf8MWkjxh8xd/WZffUe0WPv
	n0XgoAarP2Y6qUPyJI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGnin-00EFCJ-0a;
	Tue, 04 Jul 2023 21:38:05 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGnij-00EFAm-17
	for linux-i3c@lists.infradead.org;
	Tue, 04 Jul 2023 21:38:03 +0000
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688506676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Txn4LgpzVMybHzVUCvnoV6NNG7J8zu9FLUCQ+DXavTc=;
	b=bjlJgNyh0acXl+ggsFf8yd/eg/e5mieSWOAOpji/v7dn8DVxKt6YjHsrZ4Kco5JozRZ35q
	mzTFJA01YrykqJz5TNTtic5rGCDzjtUU1emobx1puzcATYR4Zp9OgG8g6M2QYurvmVjJ8U
	Gb/rCjZohd4AdXyUbJF5o6Ztu9QXJPqkESJAMNCDiaF7CqiYy7wZmY9R+IkfOmRssw6ueM
	1pvr5xNbzNG3Mf4pg9ZjwibNaNTs2bIhdYzHdS/akPbcXR1hNNPTdECh5P49csqNnD+R+s
	31rtSYAIYcW3YFKfxUWO3xBtd42Cn96izrWxcGVsk0haGoaSybB1jPUnprTqfQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCB721BF203;
	Tue,  4 Jul 2023 21:37:55 +0000 (UTC)
Date: Tue, 4 Jul 2023 23:37:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 5/5] i3c: dw; add print if cannot get resources
Message-ID: <2023070421375530819b2c@mail.local>
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
 <20230621162005.473049-6-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621162005.473049-6-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_143801_556552_CB229401 
X-CRM114-Status: GOOD (  18.21  )
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

Hello,

Please fix the typo in the subject.

On 21/06/2023 17:20:05+0100, Ben Dooks wrote:
> The devm_reset_control_get_optional_exclusive() call does
> not print any errors, neiterh does the clk_prepare_enable
Also fix this one.

> or devm_request_irq() call.
> 
> Add some basic error printing to make the probe failures
> easier to debug.

I guess all those dev_err could be dev_dbg so we don't litter the driver
with strings that will only ever be useful during bring up.

> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9332ae5f6419..ffc84ff6225c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1429,12 +1429,16 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  
>  	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
>  								    "core_rst");
> -	if (IS_ERR(master->core_rst))
> +	if (IS_ERR(master->core_rst)) {
> +		dev_err(&pdev->dev, "cannot get core_rst\n");
>  		return PTR_ERR(master->core_rst);
> +	}
>  
>  	ret = clk_prepare_enable(master->core_clk);
> -	if (ret)
> +	if (ret) {
> +		dev_err(&pdev->dev, "cannot enable core_clk\n");
>  		goto err_disable_core_clk;
> +	}
>  
>  	reset_control_deassert(master->core_rst);
>  
> @@ -1446,8 +1450,10 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	ret = devm_request_irq(&pdev->dev, irq,
>  			       dw_i3c_master_irq_handler, 0,
>  			       dev_name(&pdev->dev), master);
> -	if (ret)
> +	if (ret) {
> +		dev_err(&pdev->dev, "cannot get irq\n");
>  		goto err_assert_rst;
> +	}
>  
>  	platform_set_drvdata(pdev, master);
>  
> -- 
> 2.40.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
