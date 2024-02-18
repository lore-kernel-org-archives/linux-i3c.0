Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E4C48BF6
	for <linux-i3c@archiver.kernel.org>; Sun, 18 Feb 2024 22:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63WkQFiQ14+xnQpSzdzi57Bbzop0S2AZLhB3QpxbL28=; b=eC6z7h3UX3OYpF
	H36C/Wf3+S9Ud2dqzEGgcQYU9c4SaSZ5tfEOMLxbiNR9TFwOGdftJV1KXDnOAhIscMAYCPfqRx2Zs
	mzkwVzLcP7UNFKfsNUfbGb3i2b77COzBBoZz7R9RTxkIzrf584LjZQVJd15FPd+v7IkqWJIqxctUp
	M3oRGSl9OtZFjhCEyK3lGkfGOdMHetF1wRsv6dszT5vHag/lj+fUaB9XUsH6WwHwtPIiLnmAQRngM
	p7BhD7ApLXMvPm/CuH4XvcBoTLUlWMZ1RExAcXC2l6ExoaqH3MMQbIopc1EPVpJIlM1d3TKQYWx5K
	yRhZ4z3nFwssFhjiG7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbq6K-00000008aRF-34GN;
	Sun, 18 Feb 2024 22:57:36 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbq6G-00000008aQa-19Rh;
	Sun, 18 Feb 2024 22:57:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4725EC0003;
	Sun, 18 Feb 2024 22:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708297044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+pq9/TozG0Ax/9t8pkN6j57YfUyG6l7IZWL75JNMOW8=;
	b=aRpnIvVpZuOrja+9vi61c+YPFQpEeNKl08VTLi1/D9Yp67pX0qu+9cLwGoH2StmVH7M7dw
	PY3u/RGrT9J+SIRvSvlo7/SrMU+WjdrQE4GO4HCZdhobF40THyc2kvK5EvwavdKFXuHq4W
	I9TkNLztch13vUOicb52krzpUuFvlggx7LJ8JLXmmK7E+DagQFja2qG9abHUJE5eQ5oNJ9
	V+9WBz2U6tO6axVoVC/nBR/Nq2xHQCt+sNYYl/WK/VVZmAZcPhms4GaG0f5MD4aaASFF1e
	HX7Toqqv+lX88OtgP7ycJtIH4r9CdOkdDQ/wN6AIbx8yt9MXcu9R9cZUwAyPfw==
Date: Sun, 18 Feb 2024 23:57:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: i3c: drop "master" node name
 suffix
Message-ID: <170829700336.822203.177392854952786485.b4-ty@bootlin.com>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_145732_624937_CD42534E 
X-CRM114-Status: UNSURE (   7.58  )
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

On Wed, 17 Jan 2024 08:56:16 +0100, Krzysztof Kozlowski wrote:
> Drop the requirement of "-master" suffix in node names because:
> 1. "Master" word is discouraged and MIPI Alliance renamed it to
>    "Controller".
> 2. Some devices can operate in Controller (Master) or Target mode, thus
>    the name is not accurate in such cases.
> 3. Other buses, like I2C controllers, use simple "i2c".
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: i3c: drop "master" node name suffix
      https://git.kernel.org/abelloni/c/c53611f2e27a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
