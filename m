Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7812BC4167D
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Nov 2023 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTrKWYKjyi2Bcua6kayCSg5Bv9cA3nreJoKOFAsypDQ=; b=dHSmYdTks5Inx4
	I7ua+pO69jet3XXDx6143nzTe4dwyRmQZZ47FddwXZGll56ETNEkBWl49jikAcY/GztF6MG43aPnp
	gTCenGlbzpKrbTh1+bau6HoFWAuVE4SodRbTKsUnZxWsLbN++j+vp9LsLPGqGyEbDg+H/oRBTk2FQ
	n0UBRBzsmfIuSkNX19weCrKSQCoOXJWYKuZ8CRBYLNy7muqVxlAR6ejkK+TmT3KUmjb5lsOLoRCnT
	qLM/tjfKLIin9XVcVcKwlPb/7JwEsA9xt4w5/jqH8VzbYvIWYRKaQcsZRW4tFZisBEORDHxzyhJTT
	K/jqcKPaIWmVFCcA1i0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyzSk-00C12H-31;
	Fri, 03 Nov 2023 19:04:10 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyzSd-00C0zo-2S;
	Fri, 03 Nov 2023 19:04:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 727D1FF805;
	Fri,  3 Nov 2023 19:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699038241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dss+61W/+HYAg0e5xd/Pz/gyDtB4Y0Iwbk0N61bIATc=;
	b=N4Lw034G7uM2A93eso9Bw/JSrNQnmJRPBniVBxbVSxgtyFjQf2yN8hb5Qn/H58vXodfjbQ
	JBcHn0KksFszWgp+TxmL7M3e5uuL2/V8IZvbrcgnmS2/xKjOG3kkYIre4IHNgqCkdJvh2f
	eYkc8FCMLZYt1PPEjJGSCqb9FpCPf5oHDyAANyrA8mRhaIgBmfX0yh53NCpu7pmdXEkARN
	lBHtaZvS8FLV1kaJRReVBMYGeKlRwg4RrAUlaN/rqXMXCF+UHYzceETrKY52ucqr8v4C6q
	miXWqx3hX9O15Kugv8k5M8iQX0UTgt6j47M06dyGPiXeatYmYGQEMblSD1Vcng==
Date: Fri, 3 Nov 2023 20:04:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: alexander.stein@ew.tq-group.com, conor+dt@kernel.org,
	conor.culhane@silvaco.com, conor@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, haibo.chen@nxp.com,
	imx@lists.linux.dev, joe@perches.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
	ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
	shawnguo@kernel.org, sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH v2 1/2] i3c: master: svc: fix compatibility string
 mismatch with binding doc
Message-ID: <169903821819.391162.6378829151615918079.b4-ty@bootlin.com>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017194657.3199749-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_120403_934863_9C0BE289 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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


On Tue, 17 Oct 2023 15:46:56 -0400, Frank Li wrote:
> In the binding documentation, the compatible string is specified as
> 'silvaco,i3c-master-v1', but in the driver, it is defined as
> 'silvaco,i3c-master'.
> 
> Rename 'silvaco,i3c-master' to 'silvaco,i3c-master-v1' to ensure
> compatibility with the documentation.
> 
> [...]

Applied, thanks!

[1/2] i3c: master: svc: fix compatibility string mismatch with binding doc
      commit: 8911eae9c8a947e5c1cc4fcce40473f1f5e475cd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
