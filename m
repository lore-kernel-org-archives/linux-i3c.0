Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A798C61DC7
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Aug 2026 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEwugIKJYONK7t4/WrLdrIVY25TPqJJd3kaM9F64LGU=; b=w5Jb1DU/woXQ0w
	FdkIOpQr4D9YBzWVg+AWR/2iX9t7eZa18LQJJEmQvdhel/+IBmxM3pcQFFLq0kiEeXJVDNvFcFk0h
	zVZsLx+n5lpgsMosyklfUZI8QOggUdinmmNob0OgZaLMPpJUnNdfltcUbYky8uGk30uLPJcUR45MQ
	8VTifQGs5lEnDPfm7S+he+qTv8sB8tdil/5RKlpGUjSnzOK4xchYG2oCmniXEPdEeAvjWxAB0SIpI
	aV8yth5W6DhltsphaichyfjJURGxyIpVOEvKgT8jlt2kGqKOb6RRCOaB5PSukwj9rvtiqfQO/xKzN
	8FL37MCqnKZV4I38E8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzX2z-00000003nq3-00Ex;
	Thu, 27 Aug 2026 10:09:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzX2x-00000003npr-2V47
	for linux-i3c@lists.infradead.org;
	Thu, 27 Aug 2026 10:09:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BE5D435FB;
	Thu, 27 Aug 2026 10:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5855D1F000E9;
	Thu, 27 Aug 2026 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787825363;
	bh=9KOMROoAXkB3YgzHCVgdK+B6/2OE8JJaZ2Gy/q8sZjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JH8jmiFBJ5LJ4rQruDP8uNR5wUgeZL1ae5Rk0qlMF4EodouTVkZfqDB4L11ruAQB+
	 KQSJN8X58+W4verLaRSgLlkcltQetoFHrxooZz4qqsEB5fg5mV0tnp9x9ZaZdjHKM0
	 Ds2ADVkdMhM9p+Mt5qY8bpy3VxNWeUzu7Lwa8J3IR/2usCX/ZccwN4cEKQh+QoW5Dh
	 32ZbinaNYkDU/mPB2Tml8hcXRZSH3W3uj+g6qMfCdGVW9L2dYR3FOg9KFODsNF0tjq
	 tQk5frNN2hmxadAXLIrZShMKX/56Sn2TyIrDeU6GXM7jK7GjShdZH7Hq/TPUI6DMXU
	 rU1Le6j6dG7JA==
Message-ID: <b2d596af-ec24-406f-bcd7-813db0aebeb5@kernel.org>
Date: Thu, 27 Aug 2026 12:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
 Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-7-lakshay.piplani@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260826103819.1614843-7-lakshay.piplani@nxp.com>
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

On 26/08/2026 12:38, Lakshay Piplani wrote:
> +/**
> + * i3c_hub_init() - Initialize hub context
> + * @hub: Hub instance
> + * @ops: Vendor callbacks
> + * @hub_dev: I3C hub device
> + */
> +void i3c_hub_init(struct i3c_hub *hub,
> +		  const struct i3c_hub_ops *ops,
> +		  struct i3c_device *hub_dev)
> +{
> +	struct i3c_master_controller *parent;
> +	unsigned int depth;
> +
> +	hub->ops = ops;
> +	hub->hub_dev = hub_dev;
> +	mutex_init(&hub->lock);
> +
> +	if (!IS_ENABLED(CONFIG_LOCKDEP))

So without lockdep you do not initialize? Honestly, kerneldoc is useless
here and explains nothing. Kerneldoc is pretty clear - you initialize
hub context thus why hub context should be uninitialized without lockdep?

> +		return;
> +
> +	if (WARN_ON_ONCE(!hub_dev || !hub_dev->desc))
> +		return;

How is this possible? Why panicking the machine?

> +
> +	parent = i3c_dev_get_master(hub_dev->desc);
> +	if (WARN_ON_ONCE(!parent))
> +		return;

Why panicking here (WARN on panic)?

> +
> +	/*
> +	 * The routing mutex has the same hub nesting depth as the virtual
> +	 * controllers this hub exposes, so the parent controller is one level
> +	 * shallower. Keying it once here, rather than per port, avoids
> +	 * reclassifying the single shared routing mutex from a later port that
> +	 * may already have used it.
> +	 */
> +	depth = i3c_hub_controller_depth(parent) + 1;
> +	if (WARN_ONCE(depth > I3C_HUB_MAX_LOCK_DEPTH,
> +		      "i3c-hub: routing lock depth %u exceeds lockdep support\n",
> +		      depth))


> +		depth = I3C_HUB_MAX_LOCK_DEPTH;
> +
> +	lockdep_set_class(&hub->lock, &i3c_hub_routing_lock_keys[depth - 1]);
> +}
> +EXPORT_SYMBOL_GPL(i3c_hub_init);
> +
> +const struct i3c_master_controller_ops *i3c_hub_master_ops(void)
> +{
> +	return &i3c_hub_master_ops_data;
> +}
> +EXPORT_SYMBOL_GPL(i3c_hub_master_ops);

Do you really need a wrapper call over single variable? Can the i3c hub
core code be NOT present when your I3C hub driver is buillin?


Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
