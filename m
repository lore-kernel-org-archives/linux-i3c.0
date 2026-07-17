Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B16FC44514
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Jul 2026 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wojao0ZOwrR8o66/OPjQXCDBXY5EIdEMZmqLeBNtYT8=; b=wEirix/B+/AFxm
	J77aP2XuEbzz5pu3K+L3rJdtT1u6CtmWaZ446kHe4VIO8Wps72aeoxwCOVmotLyLllhw0iFhzmuqG
	P8n4JaPV1k1M6SiksRoMZ7MCG1T6GkqulfXC5mlbV+hzZfYq7IjYAlVidyZE/QQjwPf2ke5h6f8JP
	UXg4MOjidy62v8+DINkdOpJ9SeRy9rOdOxD62FxTQ1+b8A/P8NrqMcHVCg+CjScqHiOJvQeV70zuK
	JcAAVCBoqfn+BNLCyqr9I9lNPsN0rwtew5bFvRtxvPbwM4dkt7F8JGjdbQjkWzcq58BpoAF2LSNEl
	hZi3IrBmJ9O2PHECDChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0N-00000001emU-0oIo;
	Fri, 17 Jul 2026 08:33:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0L-00000001ekU-2pUJ;
	Fri, 17 Jul 2026 08:33:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 349C041A09;
	Fri, 17 Jul 2026 08:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AA71F000E9;
	Fri, 17 Jul 2026 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277189;
	bh=1/vXpkNy3cOqlWapaK3O7CEzY3os4he4uAXH6NOiATU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KLF5yoPqydipFqeq8BtY4outpqLJ+2cNkNOIxCagm/G6UaxMtvukMovZPuSlxY1N2
	 txnUltNAw1nQDIIEus7CxEXxm6aix4k1uLo/BXdFj3yrQ9Ef0vowYe528eozK7f4aO
	 kWZhE3VYyusw2Nz/rdoWafYYDw2PHQPqVuah62Y4E/jXeDHospmit6rHS4J1z2jsTA
	 0E38wK2F9iKFeBqddio9b/Ps7u04RTnyBaBT5WdGRdPcVf29FQzpOCHAP1vwfPVC9z
	 EUe4D+DbAMiejBV2IZ+TwSfWJawIjxP/+Z4s+SRaN5UPQY7XoIHsU1e47SqgqqynlI
	 3DWxEmxCShihg==
Date: Fri, 17 Jul 2026 10:33:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO
 variant
Message-ID: <20260717-prudent-indefinable-labradoodle-fcaa9e@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
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

On Thu, Jul 16, 2026 at 08:51:09PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 GPIO controller. So far, no changes
> are known, so it can fall back to the cdns,gpio-r1p02 compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> index a84d60b39459..7eacf5af6554 100644
> --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> @@ -14,8 +14,11 @@ properties:
>      oneOf:
>        - const: cdns,gpio-r1p02
>        - items:
> -          - enum:

This should stay enum which would also make your diff easier to read.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
