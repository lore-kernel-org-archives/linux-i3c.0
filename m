Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60D3F506E0
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Mar 2026 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLYa2t8n8pyNkL9jWwlLVoTRWGIeNlHxmljK8P96ktI=; b=DWkosY/yl9/yl9
	seTOh+TJf5RJlcshInZADbrhrKJLQ2kahPHm7u0u+F9/pdnP1nNQYD/5dAnc3nS62FUex0fkT8BjH
	mdu0yl9Y9ZHNrBfPS6YdUDHWEv4wOyHv9Q/pFXGaxK9BcFS0rQyMvzq2OHME7nlgHhEfHsmG6i7TU
	cyXTdDQeiXrlNhG3S4H5k1Ys9YddBdNatSkgQUlpf9+mTmhVmQy1ceFc0Mt6oT2JvEIxkQLQwtbbg
	R21/8ywEFBqVLsNw8eWEv1p9P648Y1KYm/ykaHcjxI3o8DPa7EZ0CUgw6tNnDxiZJjhZhi4B5/20g
	H6cV3pMu9L72tLYWgFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w296l-00000004CbG-0yn9;
	Mon, 16 Mar 2026 14:39:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w296h-00000004CaT-3HjW
	for linux-i3c@lists.infradead.org;
	Mon, 16 Mar 2026 14:39:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w296d-0007Sm-Tv; Mon, 16 Mar 2026 15:39:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w296d-000aWK-0o;
	Mon, 16 Mar 2026 15:39:43 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w296d-00000000pc4-0huX;
	Mon, 16 Mar 2026 15:39:43 +0100
Message-ID: <d862d82f08d6e1378e262e17e6af3442a66e218e.camel@pengutronix.de>
Subject: Re: [PATCH] i3c: master: dw-i3c: Assert reset control in remove()
 callback
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Felix Gu <ustc.gu@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Aniket
	 <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Mar 2026 15:39:43 +0100
In-Reply-To: <20260316-dw-i3c-v1-1-ab41904fc780@gmail.com>
References: <20260316-dw-i3c-v1-1-ab41904fc780@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_073947_824600_B15CF088 
X-CRM114-Status: GOOD (  11.94  )
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

On Mo, 2026-03-16 at 21:55 +0800, Felix Gu wrote:
> The reset line acquired during probe is currently left unasserted
> when the driver is unbound. Add the missing reset_control_assert()
> call to properly reset the hardware when the driver is unbound.
> 
> Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d87bde3f7700..5303282eb816 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1690,6 +1690,8 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
>  	pm_runtime_disable(master->dev);
>  	pm_runtime_set_suspended(master->dev);
>  	pm_runtime_dont_use_autosuspend(master->dev);
> +
> +	reset_control_assert(master->core_rst);

Switching to devm_reset_control_get_optional_exclusive_deasserted() and
removing the reset_control_deassert() in dw_i3c_common_probe() would
have the same effect.

regards
Philipp

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
