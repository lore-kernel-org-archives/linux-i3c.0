Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54DCCD5BDE
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 04:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqBVOhLTGFiAMtdyQ+G0XPhuhMZhAYp+j3umo64CLmU=; b=z6DMx0uJ3Bw6SW
	0DMGx6TiXRMrn/lPmU9TwTEPd58w2q8TwKXAl9RemRXHjJC2rFISOWsY1caoxWMT7fIGOPgkKeGJs
	PZbRzGvPyuiJH57s5bB54ARIKdC1qyrzUkSB+0H0v6BT8VQlwlcoBv8shrUImStKwk4rcBjay+6I6
	XRJkprfJ1HtCUKyZDEjtnRKVVjj1Gur7NZhS+Y6cZWaqNZ+T6HEYHsX7QkJPSdVd0vc78Ow6S9W6s
	KaXKd59Zw380t4OVWSTLBZG7wxT5uxhLHZH+PjVABqoA/z9Bo2t9LcCyYYe1Ye+S5VcacucsRjD/7
	PFNCjX8rTqCsmV6ByUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS61W-00000003JNX-1b2F;
	Wed, 27 May 2026 04:37:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS61U-00000003JN7-1E2s
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 04:37:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1188A44408;
	Wed, 27 May 2026 04:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CF31F000E9;
	Wed, 27 May 2026 04:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779856658;
	bh=94I3uy159Xi2uviJPaEP/Gc02nuOjrjAABNvfWtdOrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HuRHcydv3VGwebg2FGarjkL8BLTyRNZySOoHttfhdL4maXiWRKbN9trKxRzREe3gN
	 pyy3/1/iFaz2o5oGAf14emQOuxnJ0I6hFtjozl0Mz+wWXDeFvHXnSy/khVWMO/47RO
	 rFy1T8VDanuBRQ6MokhqT3KWm+9nyaU48YIFaLc7piMhjCmZaYVGFgx8d5iMVLMAvu
	 hvQlMbws5SxtCu7r/0t7Th2EBhRWKTNa6UTJM/avtlgg+/FYuQRO5kLhao8N83SBhh
	 iGaVYThWMArC7O5aQ53DmafNJlIX0YlKiByd2LikmdrDHP/UCxifTKcl7xw7hUf/0G
	 uhkAP9kaHnqMg==
Date: Wed, 27 May 2026 12:18:31 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <ahZwl3uXjyOZRvGW@xhacker>
References: <20260525140018.19598-1-jszhang@kernel.org>
 <20260525140018.19598-3-jszhang@kernel.org>
 <f8efa4ae-76e8-4082-a445-ca5f6d230bf3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8efa4ae-76e8-4082-a445-ca5f6d230bf3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_213740_354291_09CF97E2 
X-CRM114-Status: GOOD (  17.18  )
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

On Mon, May 25, 2026 at 05:25:45PM +0200, Krzysztof Kozlowski wrote:
> On 25/05/2026 16:00, Jisheng Zhang wrote:
> > Add dt-binding for support of apb reset which is to reset the APB
> > interface.
> 
> And this is ABI break, so you must explain WHY breaking ABI is worth

This just adds an optional apb reset, it doesn't break any exisiting
ABI. Kindly let me know whether adding new optional binding is also
an ABI break.

> doing that or what is the impact. Additionally you should explain which
> devices have it. Does Altera have it? You really lack explanation WHY
> you are doing it and which hardware you exactly describe.

I'm preparing one of synaptics SoCs support to uptream, it needs this
apb reset signal for i3c. So you mean I delay this series until the SoC
upstream series come, right?

> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > index 613dce7757bc..2575442b28ff 100644
> > --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > @@ -38,10 +38,12 @@ properties:
> >    resets:
> >      items:
> >        - description: Reset signal
> > +      - description: APB interface reset signal
> >  
> >    reset-names:
> >      items:
> >        - const: core_rst
> > +      - const: apb_rst
> 
> apb
> 
> >  
> >    interrupts:
> >      maxItems: 1
> 
> 
> Best regards,
> Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
