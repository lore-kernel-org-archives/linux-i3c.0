Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF96C48BC4
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Feb 2024 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlFa7ZX/3gkouLYbmiu1bJkLl+pbVEoxsyDwtJpZrR8=; b=HR8Fd1KkwFVvSj
	KadTNTc7Gcq6lr568ZKX9daIPqgNx7VDxnrT8RGG8r64YoOldlEOKe5UFCzxkbHT/5ptaW7LBcMRK
	B87gv+cCfQX6ozUNlaJUij0qn8JvbBB6HcNRJMlfpyFuy2X1+ShDaZlRLFYoUKR1tG60DHCb7IYDJ
	EOO/6s/EhA8Ql9fSdmFDQs8rTcY12UbO5ozvIjaagyOP5hja8rJawljywuudGcwGf1bsnpXukeVsy
	LtfLKIkIODZkbFM37AdXhXpuNtutRZ459/opXPxNFk4ztLINfirbCqR/05ZumvrsfC9psjNMXXp8R
	g71ITHzgCnR8Um9TJ9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbK1d-00000005feE-1TNS;
	Sat, 17 Feb 2024 12:42:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbK1X-00000005fdQ-2uSa;
	Sat, 17 Feb 2024 12:42:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64E86FF802;
	Sat, 17 Feb 2024 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708173745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQgQFC20iCOwYcRfjCRWjcJxj6kdRvb0sW/GpMA0iJA=;
	b=cZm6w3+q/UHjIT1yNRcAtWgateZy+3L53YEsxa8c0kbbAEj7aWy5AFrxj6rry5XSn9IF1M
	sT+b48pGm6Dbwqf7PWGXGB9DYyA8rgLo4Z6HcP3sO/cREYR0dfOL7IKM6jvRQHdZUQDLX8
	dGvaU1z+9dq+Tdm0/WBz2I9WWXpSW8yE2NA8JLFV4oY0StaAUa8ZKw8Bi7lf1VpSEA6Gat
	JJ3VGzSFbxSM5jVo5yPLcXMayJ++a4QX1PSgmntwv9QmTKJxOdD5lXyEufGFe0tT3Or9aH
	VLy8fnI6yzSpUVkK3fUTy08Ni3w0cq4IbSrs3qkZJ27zPKvMZn2wxvPryuteOA==
Date: Sat, 17 Feb 2024 13:42:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
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
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
Message-ID: <2024021712422352187ad4@mail.local>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
 <00d6a0d5-6787-4777-8fb2-dcad4304a724@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00d6a0d5-6787-4777-8fb2-dcad4304a724@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_044234_116237_AC66B5BD 
X-CRM114-Status: GOOD (  11.76  )
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

On 16/02/2024 12:26:12+0100, Krzysztof Kozlowski wrote:
> On 17/01/2024 08:56, Krzysztof Kozlowski wrote:
> > Drop the requirement of "-master" suffix in node names because:
> > 1. "Master" word is discouraged and MIPI Alliance renamed it to
> >    "Controller".
> > 2. Some devices can operate in Controller (Master) or Target mode, thus
> >    the name is not accurate in such cases.
> > 3. Other buses, like I2C controllers, use simple "i2c".
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> 
> Rob, can you pick this one up? It seems Alexandre did not take it.
> 

I'll take it but I don't think it is super urgent.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
