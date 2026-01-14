Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E74D38FF3
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfAFo9qKQKV/uiI7FjvoW6JGk0190NLbQOxQh5tjJIc=; b=iCC+gZamfC8OKH
	NKEkDn596tnossAw1X5dfsYrO+FslAA4HSVGz6lMIqgk6f6cOzgNu7DZfD9QjpxmkYHBLy9mbURmh
	u9pgjsWfKfnKC7yRV3SeGL49FosjSYLOVzqTFe8hIDH5F8bmcSZ8KAjQwU8nJhcPoiT6rkZAnMvdk
	qZXqxYoJJKuAg1jlzxnA0rCJkRsizh58BzGOHJlYROCkqAbV/wyDx48LBwlffDp4Pu8mnomdmpiR6
	m2sW8Dl+ytl6bLF9J4BB1Uw+VoR8f++MaI/K1aAXQWoTJMtk4Zu0hgnL/2LAzR1+u6+etxctpuNCn
	9dTWfjpEixzhkGvvZPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4V4-0000000A6WJ-3g9n;
	Wed, 14 Jan 2026 17:17:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4V0-0000000A6Uk-3eK7
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 17:17:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7BB3C1F1CC;
	Wed, 14 Jan 2026 17:17:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69D546074A;
	Wed, 14 Jan 2026 17:17:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F60110B6827A;
	Wed, 14 Jan 2026 18:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768411055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=B2TVXclr5G4TZ9kjKgvErvCVSq8g1gIuYHeonnJu+qM=;
	b=PTe9ZPM2fYaxP4/AHzJD9TWxKeDbiCMCbfBvbYfx9YUpcwSGbQLBa55a1fR3AxFmu4IRen
	OKovfUuKiOYaZuA0gKsjswbS+yKTTfJlgW/3fol+tBkug2mcEgBGWPFZPGZt63z0AM/N4b
	nLrONJ1oY1/H1VsIfkilHZeRd5N5EpjFu01Nh/ZXhYVH4zrayi/kCZkqWlo1epb8qL9qNr
	SddkK8r/5znyKBGPfjj4p80ilAzcnLA1R75PLjL2EOitaDzTvT7r53PzoVFc99Brcu2DdG
	N4yBdRsSKPcUffHqCYJResOV5upJcm9gzW2P7VizvY2WNfpgQHqBtjXOP+aHow==
Date: Wed, 14 Jan 2026 18:17:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v4 3/5] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260114171732470bd389@mail.local>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-3-aman.kumarpandey@nxp.com>
 <20260114-refreshing-groovy-buzzard-af2eeb@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114-refreshing-groovy-buzzard-af2eeb@quoll>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_091739_056484_4BEBF384 
X-CRM114-Status: GOOD (  14.64  )
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

On 14/01/2026 09:28:53+0100, Krzysztof Kozlowski wrote:
> > +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> > +{
> > +	struct p3h2x4x_dev *p3h2x4x;
> > +	int ret;
> > +
> > +	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> > +	if (!p3h2x4x)
> > +		return -ENOMEM;
> > +
> > +	i3cdev_set_drvdata(i3cdev, p3h2x4x);
> > +
> > +	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> > +	if (IS_ERR(p3h2x4x->regmap)) {
> > +		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),
> 
> Look here...
> 
> > +				     "Failed to register I3C HUB regmap\n");
> > +	}
> > +
> > +	p3h2x4x->is_p3h2x4x_in_i3c = true;
> > +	p3h2x4x->i3cdev = i3cdev;
> > +
> > +	ret = devm_mfd_add_devices(&i3cdev->dev, PLATFORM_DEVID_NONE,
> > +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> > +				   NULL, 0, NULL);
> > +	if (ret)
> > +		return dev_err_probe(&i3cdev->dev, ret, "Failed to add sub devices\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
> > +{
> > +	struct p3h2x4x_dev *p3h2x4x;
> > +	int ret;
> > +
> > +	p3h2x4x = devm_kzalloc(&client->dev, sizeof(*p3h2x4x), GFP_KERNEL);
> > +	if (!p3h2x4x)
> > +		return -ENOMEM;
> > +
> > +	i2c_set_clientdata(client, p3h2x4x);
> > +
> > +	p3h2x4x->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
> > +	if (IS_ERR(p3h2x4x->regmap)) {
> > +		ret = PTR_ERR(p3h2x4x->regmap);
> 
> And here!
> 
> Drop. This is completely redundant. How is it that in one place you use
> one syntax and in other place completely different syntax?

I don't think it is redundant, one is for i2c and the other one for i3c
and the other i2c so I guess the hub can be sitting on any of those bus.

I guess the driver could be made so that we could only compile the i2c
part though.

> 
> > +		return dev_err_probe(&client->dev, ret, "Failed to register I3C HUB regmap\n");
> > +	}
> > +
> > +	p3h2x4x->is_p3h2x4x_in_i3c = false;
> > +	p3h2x4x->i2c_client = client;
> > +
> > +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> > +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> > +				   NULL, 0, NULL);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
> > +
> > +	return 0;
> 
> Best regards,
> Krzysztof
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
