Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B79C6379F
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Feb 2023 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZxZhR6u2NkxneUqR+bFaHdB+QTT58nBIm45iKPPCIM=; b=2toY9NtTSqH31x
	JJMmNuzizUwRccaWCX6vFWoae6umaTKhM0DubRyluwn05hE/+vR2brS5RHVqjqTpYToHvdop6M1BH
	vVnuPN//yTJHEa0n+JWrIVhZh9oaYXKcatZpivjPZvSwKhNZ1f2LAQFwFqmL4o72Ne+C9hT1ygmg4
	+lTDMvhHYtYsxC7hEWO2xht6HzmYJz22NRyM+T17XO1Vm1elxX8KSyWlm/lAQdwXgm8v5RmHAMV9W
	vhqxceiSE7AtCn9y6x/qa7MvmyucSP3oAO3h3fPIOlzQRe3wpEM9hvO/iMUs/2ChvMhtXvNNEQh3x
	ZM4AAO1lWtriPIoXrO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFSW-005WL9-84; Wed, 15 Feb 2023 10:56:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZS0-00EuNx-Iy
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 14:05:02 +0000
Received: from rico.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE37120034;
	Mon, 13 Feb 2023 22:04:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676297093;
	bh=Rqlv2sqC3TCOsNxDajqKf5TrX0e0ldaMazRHcAdox5Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DIRZZdqGngeJpL61e8FmNJDXUh91fn2h6RfyVA7ijmQpB0hxt9dliRXy1EEqMiAIr
	 QJkUxMMLbSVSCNX1pJAtXYEfiwPttzlLm9Ln8IZZxRRNFBJp9xDQY00bC4IvjGLdmM
	 0xuWehqRc6RE4z3Zfcx/GmqzItE07VMqI2TkOXckldrPjQvKP1Rpv1d4WyTNEoeUOf
	 jrwsJ1NJgQpza5gM3+4XaDrzbSY63fsp20aaRtXVdaom4s+N7v0eV3qiu4qXAkbVsa
	 NriW9m15mybE2ZMva6kvmuQZJAgQWPg1q+/WzTRdfg/UVuYXYh1kE6zsdIvtM5s0uI
	 jHi4M2mUSZQ9g==
Message-ID: <2528217bf1d43b834587cc0e399d7e86695bd390.camel@codeconstruct.com.au>
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	devicetree@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, Rob
 Herring <robh+dt@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dylan Hung
 <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
Date: Mon, 13 Feb 2023 22:04:50 +0800
In-Reply-To: <71aeb3da-13a1-1c79-9fe6-f5c23d398394@linaro.org>
References: 	<5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
	 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
	 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
	 <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
	 <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
	 <71aeb3da-13a1-1c79-9fe6-f5c23d398394@linaro.org>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_060500_833548_74320366 
X-CRM114-Status: GOOD (  17.66  )
X-Mailman-Approved-At: Wed, 15 Feb 2023 02:56:19 -0800
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

Hi Krzysztof,

> > Yes, that's essentially what I'm looking for with this change -
> > particularly with the pullup config, which (as you say) could
> > arguably
> > be a pinctrl config instead.
> 
> Depends, there was just a short sentence. If this is external
> resistor
> on the board, why this device needs such property (and none of other
> devices need...)? If this is internal pull up of I3C (and there is no
> other pin configuration possible, no other pins), it looks reasonable
> to me to have it here. But I am all guessing it...

It's the second case: there is a configurable pullup resistor in each of
the i3c controllers (or, more accurately: in the ast2600's glue
between the SoC and the I3C IP block).

The pullup configuration is controlled by the SoC "global" i3c
registers; a block shared by all of the SoC's i3c controllers. So, any
driver implementation would need to set up that global register
configuration on i3c controller init.

So, I can see two options for the binding (and consequently the driver
implementation):

 1) the sda-pullup-ohms property on the controller binding, which a
 driver implementation could set directly through the global register
 set

 2) define a pin controller on the global register block, allowing other
 (standard) DT pinctrl definitions to control the pullup calue. This
 would need a new driver implementation for the pin controller, but that
 shouldn't be too complex to implement.

For the binding proposed here, I've chosen (1). We can handle all of the
other (non-pullup-related) global register configuration by treating the
globals as a simple generic syscon device.

I'm happy to try (2) instead, if that's the better approach. However,
that may be over-engineering the binding spec (and consequently, the
necessary driver implementation) for just setting a register value.

From your second point:

> (and there is no other pin configuration possible, no other pins)

This is a fairly small and isolated component of the global ast2600 pin
configuration; the pullup value is set separately from the
already-implemented SoC-wide pinctrl. Merging the pullup values into
that wouldn't really fit the hardware interface mode though; this is a
separate IP block linked to the i3c controllers.

Let me know if you have any preferences on the approach to a biding
structure.

And Andrew: let me know if your experience with the ast2600 SoC's
pinctrl would suggest either option.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
