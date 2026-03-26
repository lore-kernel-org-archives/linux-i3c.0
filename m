Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685D610A3D8F
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Mar 2026 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gh+p5nS5UV6qslK1jTiJVVRpcU6Vt9Q24duWhyWR5Hg=; b=we2dkfTtbxMdle
	zt4HC9PyoP4V1MnnLFNc7u0F2Ou83Kbm8flNnouu09YN/LvJvoC5oUEiWsa26eW+ZVTKbN3/pELCx
	/eRRT4uuCS3G3H0G6m9Nk2I1EsysWatJCr+re/dSHBQ7PcA/6sJ+ju+wO5AwOuAMpm9X4+cV1rc8i
	8rMP6b1tDfw8l+L0nm4Q1RUzflpNyYv1ubozJUl0xTFNVVU9boxjyrmLHdJych71jGel92dmvGLPE
	mB0N+WUVr3xOD2YCYvYo1bYaU0X3yas+50i+NMinqEMz+yoIilNW3PzEXazqHXO3zRZ8laoTgeA6I
	MFdGxz9rsCnAkrY4MNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mGk-00000005iCW-0aEq;
	Thu, 26 Mar 2026 15:05:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mGh-00000005iC8-257Y
	for linux-i3c@lists.infradead.org;
	Thu, 26 Mar 2026 15:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE72A436A8;
	Thu, 26 Mar 2026 15:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69651C116C6;
	Thu, 26 Mar 2026 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774537506;
	bh=pM2qPJP0N0ADDCsOppxXwTkoZA/x2DQWuP5hXPmDSj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abog6EdsAq6OJFP0NMkHKKgpox06HvO++xGDNqtPH5yVn5RhV0F9JeCLrGrSTOJ3u
	 OTmLCfzJxb3413mKiR4n0VFIfv93CclcwtzZd+gU0mzRLBTYOPs37wXStTDSqieKb/
	 awY0n2lRKCZlAdRJFqN4g+ZMLpwEnpT8fXpwyqkJnL5xS0jjIWH+Kesugl2qJIqWxE
	 WQAl0S5mw7a48J09F+dDl/cedMmCcW7HZ1O+KUmQuxE2EE7tnps9H1N5FNS9Mb/C5f
	 rtlzzhQEfmh6OLvPkmKnuBYlQJImiSyfPEqrH6uP2CqVfmip+lYA/i+CpmDkmvrETW
	 UL8QqDqV0upGA==
Date: Thu, 26 Mar 2026 10:05:03 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <20260326150503.GA2360967-robh@kernel.org>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-2-akhilrajeev@nvidia.com>
 <20260318-tweed-herbicide-eb924ef056b8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318-tweed-herbicide-eb924ef056b8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_080507_603547_B4AC9EC7 
X-CRM114-Status: GOOD (  31.81  )
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

On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
> On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
> > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> > Discovery and Configuration Specification [1] to specify which discovery
> > method an I3C device supports during bus initialization. The property is
> > a bitmap, where a bit value of 1 indicates support for that method, and 0
> > indicates lack of support.
> > Bit 0: SETDASA CCC (Direct)
> > Bit 1: SETAASA CCC (Broadcast)
> > Bit 2: Other CCC (vendor / standards extension)
> > All other bits are reserved.
> > 
> > It is specifically needed when an I3C device requires SETAASA for the
> > address assignment. SETDASA will be supported by default if this property
> > is absent - which means for now the property just serves as a flag to
> > enable SETAASA, but keep the property as a bitmap to align with the
> > specifications.
> > 
> > [1] https://www.mipi.org/specifications/disco
> > 
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > index e25fa72fd785..1705d90d4d79 100644
> > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > @@ -31,10 +31,12 @@ properties:
> >        described in the device tree, which in turn means we have to describe
> >        I3C devices.
> >  
> > -      Another use case for describing an I3C device in the device tree is when
> > -      this I3C device has a static I2C address and we want to assign it a
> > -      specific I3C dynamic address before the DAA takes place (so that other
> > -      devices on the bus can't take this dynamic address).
> > +      Other use-cases for describing an I3C device in the device tree are:
> > +      - When the I3C device has a static I2C address and we want to assign
> > +        it a specific I3C dynamic address before the DAA takes place (so
> > +        that other devices on the bus can't take this dynamic address).
> > +      - When the I3C device requires SETAASA for its discovery and uses a
> > +        pre-defined static address.
> >  
> >    "#size-cells":
> >      const: 0
> > @@ -147,6 +149,26 @@ patternProperties:
> >            through SETDASA. If static address is not present, this address is assigned
> >            through SETNEWDA after assigning a temporary address via ENTDAA.
> >  
> > +      mipi-i3c-static-method:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0x1
> > +        maximum: 0xff
> > +        default: 1
> > +        description: |
> > +          Bitmap describing which methods of Dynamic Address Assignment from a
> > +          static address are supported by this I3C Target. A bit value of 1
> > +          indicates support for that method, and 0 indicates lack of support.
> 
> I really am not keen on properties that are bitmaps, why can't we just
> use the strings "setdasa", "setaasa" etc?

If this comes from a specification, then I'd tend to just copy it rather 
than invent our own thing. Obviously if is something structured 
fundamentally different from how DT is designed, then we wouldn't. But 
this is just a simple property.

Rob


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
