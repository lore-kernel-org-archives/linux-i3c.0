Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28501D38FF1
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnV61K3ALD7wzDH0Zx/xeDhG554O+zhWV5c1yROx2xU=; b=OaW6VySLlJCs39
	vBHwjr+gRmAoa1b3Ojzds89PBkfVHgcsnMPPaT/Lntk73Q37VuO7fRIXlJ2acTPqTWRURXyNZl6S2
	0w8fQ93D2CgfUS8xSHUFr3VBdl7XGAtJNsfc6mqLYCWC/cmrUTW/XjWIf/XWAzj9/EwKHNErRFzPE
	SVn8hzou1hyYWj5mT4EqHst9k6V/zVfA9ecB0gsxqHkOPcY+VpWdoA+UUgv2zMEh2UNJ9pEUepf1A
	EoCHVd4MyqvDLnbzS69dfQZAVx/iD82p1I8TAhuzwD6fKi3qeQcZVm9VDMtRJVkkuToNNBl8oRErL
	xVAB18tMBGN2CDlvO4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Lv-0000000A2ss-3VsJ;
	Wed, 14 Jan 2026 17:08:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Ls-0000000A2s2-3nCz
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 17:08:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E26A1C1F6DB;
	Wed, 14 Jan 2026 17:07:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8684C6074A;
	Wed, 14 Jan 2026 17:08:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50F6110B6828F;
	Wed, 14 Jan 2026 18:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768410490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BOetR0xlsTC1WPP7X56hFWPzNxbNNujaRTmlAf4rLmM=;
	b=Ef5fEguZAG2Y72C94WVVZCm+a677M5snJIsR+aNNDenCITPqLvcXJBf34gLBlJrgP3VvyO
	m0JhPULE/SgMtbhY36nr9+EVn0HdAefDjK0eJjFkT5k0Qwk00hgQBlIyquAKlp4PwgBEF9
	OnrtMS3QM8ce2J31R+vV/iBUla3p5fNgt4rZT2llKIRIXFLrnNQ2vDAwGgLb2fWF/0jg7v
	eOKG/akuoh4+wOqYsf+MdYqPY69hqehJH6Z1Rp1DBWQ7MiFJo/KIAdRyLkdt1tlZa1y/wj
	zIUEl+RIJGE+Dv8bvexbyQsMj7j+W/b+TbMUfi777B9oQnlH6+otVzfOhTnFPQ==
Date: Wed, 14 Jan 2026 18:08:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: fredrik.markstrom@est.tech
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivar Holmqvist <ivar.holmqvist@est.tech>
Subject: Re: [PATCH] i3c: master: Set the device name only after we
 initialize i3c_bus->id
Message-ID: <20260114170808789a6861@mail.local>
References: <20260113-set_i3c_master_name-v1-1-eafc5dcd1eee@est.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113-set_i3c_master_name-v1-1-eafc5dcd1eee@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090813_083994_390C41C3 
X-CRM114-Status: GOOD (  17.40  )
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

Thanks for the patch! the exact same one had been sent earlier so I
applied it instead.

On 13/01/2026 14:08:53+0100, Fredrik Markstrom via B4 Relay wrote:
> From: Fredrik Markstrom <fredrik.markstrom@est.tech>
> 
> The i3c_bus->id field is used to construct the unique name of the I3C
> bus device. This field is initialized and assigned its unique value
> within the i3c_bus_init() function.
> 
> However, the existing code was referencing i3c_bus->id *before* the
> call to i3c_bus_init(), leading to all the masters having the same
> device name string.
> 
> This commit moves the reference to i3c_bus->id to *after* the call to
> i3c_bus_init().
> 
> Fixes: 9d4f219807d5 ("i3c: fix refcount inconsistency in i3c_master_register")
> Signed-off-by: Fredrik Markstrom <fredrik.markstrom@est.tech>
> Reviewed-by: Ivar Holmqvist <ivar.holmqvist@est.tech>
> ---
>  drivers/i3c/master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f606c871648..1bc3c9068402 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2881,7 +2881,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>  
>  	device_initialize(&master->dev);
> -	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
>  
>  	master->dev.dma_mask = parent->dma_mask;
>  	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
> @@ -2891,6 +2890,8 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_put_dev;
>  
> +	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> +
>  	ret = of_populate_i3c_bus(master);
>  	if (ret)
>  		goto err_put_dev;
> 
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260113-set_i3c_master_name-4fe45d589164
> 
> Best regards,
> -- 
> Fredrik Markstrom <fredrik.markstrom@est.tech>
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
