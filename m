Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E5BC27C4F
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Jun 2024 20:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrHvMx+CVziUaYw3XiqZE6Onw6OvgPoD7pGjjcFP7fc=; b=N0cXwOR3U09POK
	idV/+V/Mm96OizyG+M+RvfAtRNwGyXshOW/zX/Ghvt8BZA3tS/4jyyN7GvDOgpnFtLnYs4tkIKsfQ
	v0Dcv1gcKBWKAW0+K4bUcpZr7kqCoLUVvf40xAH8hmtqot1+xP5ttGIkLYE45o4SHKbsMWu/wxTHI
	UiWVXGDSROgtrSbczCnPaKCEQYSpg0xb4DxxMH5EhxlOlXb44bDa0SLrkXEKumvEdvjKUybDimiuR
	YOh3h371ULBjEB2gioEXgJT2ypPOEq8IgtoLnOUplH8UuG4NIg9wet9ZjGTPsVd/apcJM53/DKvS0
	rB6xEHkYMyJK3699Kt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJf9D-0000000GSM7-0s1C;
	Tue, 18 Jun 2024 20:09:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJf9A-0000000GSL2-1Xk3
	for linux-i3c@lists.infradead.org;
	Tue, 18 Jun 2024 20:09:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38F4A20002;
	Tue, 18 Jun 2024 20:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718741377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QkoL0pNNpii6fLkIcYMP6ZEwDfv27RbGj78tY8cKco=;
	b=XAM5oCBX/upEqGKEDtOn0CIi7bnlHESrdK45xPDJYlLWzkrkgLPQl7j8mXnYeuepLZ7Aci
	0Qfx+Nkjtfgp91e6lRWv4/DFqC0J6kSFi+29g+2bF6TsZRzzdetTquL2mrEJqwSvqPpgvt
	ZcbTQg0lN3etaxx2EDQYbycZA3Qs1Hm4Evc7bmhmCv8gL6/ZiENoXhNkwwAyb7D8+YO4UZ
	Fs48WHWRnJ3RqSvQzI4bOD4xZhi9k10hOEQNLWbkJsZSBdYWqOJ8vHHpGP+T0V8Man0ENG
	WDUiNEcKyEb927fiM1BWC2rkGQoq//2X4ToMnWxMzK4qgJRuGCPPpnm2agcDwQ==
Date: Tue, 18 Jun 2024 22:09:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Aniket <aniketmaurya@google.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: dw: Add optional apb clock
Message-ID: <20240618200932858a6e40@mail.local>
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240611171600.1105124-3-aniketmaurya@google.com>
 <202406182005584f0deea8@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202406182005584f0deea8@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_130940_766196_5E4E5D64 
X-CRM114-Status: GOOD (  19.70  )
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

On 18/06/2024 22:06:00+0200, Alexandre Belloni wrote:
> Hello,
> 
> On 11/06/2024 17:16:00+0000, Aniket wrote:
> > Besides the core clock, IP also has an apb
> > interface clock. Add an optional hook for
> > the same and appropriately enable and disable.
> > 
> > Signed-off-by: Aniket <aniketmaurya@google.com>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 12 ++++++++++++
> >  drivers/i3c/master/dw-i3c-master.h |  1 +
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 77a2a1c3fd1d..41cdfd6741e3 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1470,12 +1470,20 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> >  	if (IS_ERR(master->core_clk))
> >  		return PTR_ERR(master->core_clk);
> >  
> > +	master->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> > +	if (IS_ERR(master->pclk))
> > +		return PTR_ERR(master->pclk);
> > +
> 
> I guess you need to update the device tree binding documentation too.

Sorry, you did and you had changes requested, forget about that.
> 
> >  	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
> >  								    "core_rst");
> >  	if (IS_ERR(master->core_rst))
> >  		return PTR_ERR(master->core_rst);
> >  
> >  	ret = clk_prepare_enable(master->core_clk);

It could be worth having a look at devm_clk_get_optional_enabled

> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_prepare_enable(master->pclk);
> >  	if (ret)
> >  		goto err_disable_core_clk;
> >  
> > @@ -1520,6 +1528,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> >  err_assert_rst:
> >  	reset_control_assert(master->core_rst);
> >  
> > +	clk_disable_unprepare(master->pclk);
> > +
> >  err_disable_core_clk:
> >  	clk_disable_unprepare(master->core_clk);
> >  
> > @@ -1533,6 +1543,8 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
> >  
> >  	reset_control_assert(master->core_rst);
> >  
> > +	clk_disable_unprepare(master->pclk);
> > +
> >  	clk_disable_unprepare(master->core_clk);
> >  }
> >  EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
> > diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> > index 8cb617b8147e..50c38e790c0e 100644
> > --- a/drivers/i3c/master/dw-i3c-master.h
> > +++ b/drivers/i3c/master/dw-i3c-master.h
> > @@ -36,6 +36,7 @@ struct dw_i3c_master {
> >  	void __iomem *regs;
> >  	struct reset_control *core_rst;
> >  	struct clk *core_clk;
> > +	struct clk *pclk;
> >  	char version[5];
> >  	char type[5];
> >  	bool ibi_capable;
> > -- 
> > 2.45.2.505.gda0bf45e8d-goog
> > 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
