Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B83D31A27
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5JscxWK06yyfzoVxvbE52DkpXsFVfq57BF1SEU9RY0=; b=evrISwa3c+r9DM
	XbCESxGKbr2g2B2MxRsIgNjA1mWmDwieSfnHqJnwuYm/QxcPHL6j4yEKIeX9+j6bKFQ4JVhxl/ow7
	sGMgTp4WSdR7v1BiuwqwU52OKNqAi1acn4N0fCEiiAVkw7eJ+M1n/VKRQx65rstFwc+0bUSbzpOUS
	WJJAoNhEJJMqt8KgLgTmQQTqWFGfVWrY5aPavRnOS88RGv4ZMtzT1JOThoC4ebjzEJzUNp52RRSTN
	ZE7MzezSfdel8MpUjijvKSKVcdQMakF2uXPKUUrBozQM7spCN5X3TqgfNRPL9nnDnuFQGzcH1aTSe
	jUMGubqC5UjtrwdCvK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwC0-00000008KU8-2kco;
	Wed, 14 Jan 2026 08:25:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwBy-00000008KTu-23E5
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 08:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89F86600B0;
	Wed, 14 Jan 2026 08:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC61C4CEF7;
	Wed, 14 Jan 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379125;
	bh=51eaIopXNp29AsBCtY4p+d5Nz/I0BkLOIg24rTR6Gao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHueQlK9qPpG+K1nKMCF6hlNPMnnCPex3LKVaz9xxE2nJ6KrQMbYNfEhxP02P2VOl
	 WnGBpA+LAGYvLKIS7YQtfGNqMzf1mtKMSFHtdq82od9UC9ckvtjPAuS+HDw+6/MzTp
	 0lXp3/MI47uHnpApLpg8g7t4z+pDKqjMjBKiVY+np3hSel5wcBxzQYgcSMDh62fXZP
	 BeOV3usenaZeRp0iOGhVOZe1WyldKmMNY9pBtdIq9mc+1erdzMZu8AzfV6emiDcy5O
	 g96rSkjfhBU9Q412ZSXCvFrZU18fghYt8jD/24DMr3TCJxx/v9ZqJ9+A5hJMCKRWW3
	 VbNf+NaFx+m3Q==
Date: Wed, 14 Jan 2026 09:25:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, Frank.Li@nxp.com, 
	lgirdwood@gmail.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v4 4/5] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Message-ID: <20260114-resilient-cocky-skunk-2035eb@quoll>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-4-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113114529.1692213-4-aman.kumarpandey@nxp.com>
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

On Tue, Jan 13, 2026 at 01:45:28PM +0200, Aman Kumar Pandey wrote:
> The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
> functionality. This driver registers the regulators using the MFD
> framework and exposes them via the regulator subsystem.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
> Changes in v4:
>  - Split the driver into three separate patches (mfd, regulator and I3C hub) 
>  - Introduced driver for on-die regulators in NXP P3H2x4x I3C hub
> ---
> ---
>  MAINTAINERS                                   |   3 +
>  drivers/regulator/Kconfig                     |  10 ++
>  drivers/regulator/Makefile                    |   1 +
>  drivers/regulator/p3h2840_i3c_hub_regulator.c | 162 ++++++++++++++++++
>  4 files changed, 176 insertions(+)
>  create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa7043499223..4bcd52d65f1a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18934,6 +18934,9 @@ F:	Documentation/devicetree/bindings/mfd/nxp,p3h2840-i3c-hub.yaml
>  F:	drivers/mfd/Kconfig
>  F:	drivers/mfd/Makefile
>  F:	drivers/mfd/p3h2840.c
> +F:	drivers/regulator/Kconfig
> +F:	drivers/regulator/Makefile

Huh? Why do you claim you maintain this? On what basis?

> +F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
>  F:	include/linux/mfd/p3h2840.h

...

> +	p3h2x4x_regulator = devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP_KERNEL);
> +	if (!p3h2x4x_regulator)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, p3h2x4x_regulator);
> +
> +	p3h2x4x_regulator->regmap = p3h2x4x->regmap;
> +	device_set_of_node_from_dev(dev, dev->parent);
> +
> +	rcfg.dev = dev;
> +	rcfg.dev->of_node = dev->of_node;
> +	rcfg.regmap = p3h2x4x_regulator->regmap;
> +	rcfg.driver_data = p3h2x4x_regulator;
> +
> +	for (i = 0; i < ARRAY_SIZE(p3h2x4x_regulators); i++) {
> +		rdev = devm_regulator_register(&pdev->dev, &p3h2x4x_regulators[i], &rcfg);
> +		if (IS_ERR(rdev)) {
> +			ret = PTR_ERR(rdev);
> +			dev_err(dev, "Failed to register %s\n", p3h2x4x_regulators[i].name);
> +			return ret;

Syntax is just return dev_err_probe.

> +		}
> +		p3h2x4x_regulator->rp3h2x4x_dev[i] = rdev;
> +	}
> +	return 0;
> +}
> +
> +static struct platform_driver p3h2x4x_regulator_driver = {
> +	.driver = {
> +		.name = "p3h2x4x-regulator",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe = p3h2x4x_regulator_probe,
> +};
> +module_platform_driver(p3h2x4x_regulator_driver);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_DESCRIPTION("P3H2x4x I3C HUB driver");

Do you use the same description everywhere?

> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
