Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2EDC87FDA
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Aug 2025 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3enQ6RQ08tQSiW9ADw1t4u1GCC8nEgrn8AHMqr2Frj4=; b=PlFhN08uB/D21o
	FdV67r/iq0E0Iq70zWf5zS0AZ9k+r2A+vbKZXCPloTR65OoQtHzAog4/V/x7WGA4UrCGL5YvMAtzm
	CXgNZlTXrvf+9j2wO43TyLr8MqhY/QtJNrXgMnifMbG7r+KcHUiTOFe7YnUEjsVodmHq+rVR/jz1L
	AN+khJWDJdPkBGLf3YxGB6ty6pNF3KvD0wb/AUZzm+qfanvQ212r4editTociThDchwgpK4R4JuL0
	J2otUC7lKu4FGcrGGBIBSba5ZjwUn3drIXx0eZqfGaABwUAhaLoCW0Lpo2H3uNNIYEfH3PT9Ve4H+
	CetrLQuQ8tGC8QVT54OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMXd-00000006fCs-3wtu;
	Mon, 11 Aug 2025 07:01:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMXd-00000006fCl-1GxT
	for linux-i3c@lists.infradead.org;
	Mon, 11 Aug 2025 07:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B913601D1;
	Mon, 11 Aug 2025 07:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AD9C4CEED;
	Mon, 11 Aug 2025 07:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754895716;
	bh=6dqeJkISmTgPXUlwm9dVSp9RFaKYadSShyA4W7vDHrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3HNTFHT9zCFOeF7qiZ78tbSN6HJlbJaNc1Obm7WXSohw13ukL+rwtRaK/VIb9IlN
	 AnONkR5Uwq7LICq4egfqe6avx20hYmxZ4Xx29SYOHezfMUhH7zzb+7yUzU4hy7ethH
	 kPysCsbjMEbDXeNOJF1nMrB81dWmMEhwgZWeZbkdWhR5REsRJKaxNuuLhGX79oaXpg
	 Hr5g3Ii5qvbbmr370nZWFqK8sZxhyRdWYNGcGCw0GbGWhk2P3X3Y4ghET04lKCcVre
	 Ipm8wj4EBrsF8PCypLiRlDldfJWX6IJS/gCf52sC1yvGpv8OBYH12enY7S6k2i+oaG
	 l+5N/lMCEOymA==
Date: Mon, 11 Aug 2025 09:01:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com, Frank.Li@nxp.com
Subject: Re: [PATCH v3 2/2] mfd: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
Message-ID: <20250811-peculiar-kind-condor-ce8cd6@kuoka>
References: <20250808132033.3996614-1-aman.kumarpandey@nxp.com>
 <20250808132033.3996614-2-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808132033.3996614-2-aman.kumarpandey@nxp.com>
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

On Fri, Aug 08, 2025 at 04:20:33PM +0300, Aman Kumar Pandey wrote:
> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x;
> +	int ret;
> +
> +	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> +	if (!p3h2x4x)
> +		return -ENOMEM;
> +
> +	i3cdev_set_drvdata(i3cdev, p3h2x4x);
> +
> +	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(p3h2x4x->regmap)) {
> +		ret = PTR_ERR(p3h2x4x->regmap);

Drop, don't create useless assignments.

> +		return dev_err_probe(&i3cdev->dev, ret, "Failed to register I3C HUB regmap\n");

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
