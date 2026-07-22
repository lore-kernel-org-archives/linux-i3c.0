Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F02FC4453A
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Jul 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvcDUYOTC1mAIFqKj3FsNsgAzDitZTdPq/0N885MP7w=; b=rLrHEC0upNuNwH
	G62pbXUpqUuCVIKvxob3FUmSO11oDarrtElN7dzSrQO78cewadj1unwdItvi3y7BYkD+8X83OD9TU
	JSwmnkHZcQMd6Pjta0yISc70AW1ilc1IS36zWI6EG0WxKW+b8ODgOHI3llQDKWgxV7U1nssJl4Znl
	2ewCoTr+Nb8xXpv4FQJghUxjMylfYP94+vnlktkwawGTE1vrL6l7gyoJCmgJkMMzf8qpt6sgvawfX
	7mMNwFlc2nXgv6NQSX3XXAwUkEESjimgpi8UNGoDxz61Mhums752sev7iWsivYsiwDq7hHtuosNRl
	K6FZw4u0pcKtM7n90hLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcXG-0000000Cda7-3rL5;
	Wed, 22 Jul 2026 19:23:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcXF-0000000CdZz-011F
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jul 2026 19:23:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6082541B0D;
	Wed, 22 Jul 2026 19:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1E51F000E9;
	Wed, 22 Jul 2026 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748196;
	bh=wRTpnI3StPGqyZJ2e0jZs0V9/+NcQ5Wl1MZbsG14ELs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0D5jVm+tHNuz6NFGXuBn8qO44eV48taDiGsKs/bwbnO268zCboMnZGF/gYe4VRgf
	 dPh3U5pN6tHjmFEBA13VNddWD1/4bXNb3YOEpePgbBi7Pd8SuH/SuDnKey/picM7Mx
	 QhOpKyckYEOh6nCSlDQPGGNg3oBd/Ar6l0k9JS+u8g4C0RcI6Ja6FFqPVYuqTJfcI2
	 HU1bkMa9iMWuJruAgr0Z/LmlqErWcrm6jefHuXNY2DVZ+tsSuRZuOA0bfFPw91cpPG
	 FxHy9Kkp4K4inaTGvGnkRNUeQtw+Axyrpmq4Hk4uvdwpwYF/ky/mpYWsjRJgj32kOw
	 m8SsTQKxts6jQ==
Date: Wed, 22 Jul 2026 14:23:15 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	radhey.shyam.pandey@amd.com, michal.simek@amd.com
Subject: Re: [PATCH] dt-bindings: i3c: dw: Document missing optional core
 reset
Message-ID: <20260722192315.GA1314342-robh@kernel.org>
References: <20260717105829.567522-1-shubhamsanjay.patil@amd.com>
 <f0278842-ceba-4d90-9dc0-4a15a7e7b342@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0278842-ceba-4d90-9dc0-4a15a7e7b342@kernel.org>
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

On Fri, Jul 17, 2026 at 01:33:15PM +0200, Krzysztof Kozlowski wrote:
> On 17/07/2026 12:58, Shubham Patil wrote:
> > The DesignWare I3C master IP supports a core reset input, but the
> > binding is missing the corresponding reset description.
> > 
> > Document the reset property and name in the binding. Keep the reset
> > optional because the reset line is integration-specific..
> > 
> > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > ---
> > Note:
> > The DesignWare I3C driver support was added by
> > 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP").
> > 
> > The original Synopsys DesignWare I3C binding was added by
> > 116e246a8bcd ("dt-binding: i3c: Document Synopsys DesignWare I3C"),
> > but it did not document the optional core reset.
> > ---
> >  .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > index e803457d3f55..822faf8d221b 100644
> > --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > @@ -38,6 +38,12 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >  
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    const: core_rst
> 
> Drop the names, pretty redundant, and fix the driver. Sneaking ABI is a
> poor excuse, IMO, to keep discouraged names.

While fixing the driver, the clock names sashiko pointed out can be 
fixed too.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
