Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039DF108B8E9
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Mar 2026 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAJu5nPZ5Bnh+hFbYpgl6ITbVHhbCvevIJ07UcqcERU=; b=ei2mfntg5Yxxd2
	MIpqag3F0Dt7dnb0xrvmJSZwZ6c0pEqCV/JcLJC6Edzs2dLIyVIUuYLcj8M81F8JtRYeSUlnj1XUa
	qAlhGaJ/Dnzw80Pz8hFIH12uFw1J3iQnnX3lMeAL5i2/A0yF4Wjh1L8DWoqkniloM1XMZ6Uu2sAep
	99h1kV1nfyPkPxvmH1Z8qz52S4vGyMUGRJvPK2of4W/DE+v/dpJZli5wMWLROn/rWvgjt8kdNCoKm
	HCKwTvBbvxuhSvMMcWXXmBClFT9QQmh/qP6vnMaw10rgh6bQG18bArCY8jkUG6bDe5jHf10ZPiuQW
	bFB6uwP05jdBEBx5O3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X8F-0000000CbkE-2fjm;
	Fri, 20 Mar 2026 10:31:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X8D-0000000Cbjp-1wwD
	for linux-i3c@lists.infradead.org;
	Fri, 20 Mar 2026 10:31:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3X88-0006ot-B1; Fri, 20 Mar 2026 11:31:00 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3X87-001E37-32;
	Fri, 20 Mar 2026 11:30:59 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3X87-000000005hA-3dGH;
	Fri, 20 Mar 2026 11:30:59 +0100
Message-ID: <f5727eb71ec52db67918e4df8a05c7c3a6b45343.camel@pengutronix.de>
Subject: Re: [PATCH v2] i3c: master: dw-i3c: Fix missing reset assertion in
 remove() callback
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Felix Gu <ustc.gu@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Aniket
	 <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 11:30:59 +0100
In-Reply-To: <20260317-dw-i3c-v2-1-fa57e6394b1d@gmail.com>
References: <20260317-dw-i3c-v2-1-fa57e6394b1d@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_033105_525786_F9A7D902 
X-CRM114-Status: GOOD (  13.28  )
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

On Di, 2026-03-17 at 01:48 +0800, Felix Gu wrote:
> The reset line acquired during probe is currently left deasserted when
> the driver is unbound.
> 
> Switch to devm_reset_control_get_optional_exclusive_deasserted() to
> ensure the reset is automatically re-asserted by the devres core when
> the driver is removed.
> 
> Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Switch to devm_reset_control_get_optional_exclusive_deasserted() 
> suggested by Philipp Zabel.
> - Link to v1: https://lore.kernel.org/r/20260316-dw-i3c-v1-1-ab41904fc780@gmail.com
> ---
>  drivers/i3c/master/dw-i3c-master.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d87bde3f7700..f3dabd8d1225 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1606,13 +1606,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);
>  
> -	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
> -								    "core_rst");
> +	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(
> +		&pdev->dev, "core_rst");

+	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+										"core_rst");

to make checkpatch --strict happy. Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
