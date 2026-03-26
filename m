Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9A910A88E0
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Mar 2026 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWf9LFBHTvVvSFdbkIeNPU6y5b7iLbEHD5ezUKN5k1c=; b=S0kO2WXcS3TxOn
	Qwm6XCQ4NxgCtXrcxr6To6Gw0T02uNJDw5eZ0QL0kZCmNRO0GLegWmPQ4JytsAAajmFy7w+NnnKKy
	tNCwVI10fZEX6yzT48nIyj9qytXWtKaWdY9dedST6z061VkVUsSg+q+7T96wwDnITSZmyaj57i7HN
	3Kyt+mkhKwi3l2KV4D4+mfkJcphEHTNfL34laDBdi2vu1TAJaYEKKloiQ+RNT5P0HaeSIOMGKHOIY
	WOHkCJapnd4glW5+OHva9EKoy3nmhShaVsXHAmnU+91z03pUVI8d7n+YvYoFOgdFfM+1kTrOE3/WS
	c9HCVm4Ewl5DiIfVGpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mt5-00000005n1S-1bDB;
	Thu, 26 Mar 2026 15:44:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mt1-00000005n05-2Mra
	for linux-i3c@lists.infradead.org;
	Thu, 26 Mar 2026 15:44:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F7A74E4280B;
	Thu, 26 Mar 2026 15:44:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59680601FA;
	Thu, 26 Mar 2026 15:44:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D012C10450519;
	Thu, 26 Mar 2026 16:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774539877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LkNoR3D4UbafRdhgG19imB15t8UnwV/2QMs/xxLmVyU=;
	b=FJppiSpMFzTcwEj8BcylcxckqdLi3AAFThxTsgjf1VxD813E3aBkMGWgw/R8+eBpwILq49
	SIqEMogdAM0hHIpYOqpvRet+87Z47SIG9H9zRGzztKEagjZGSc4jC99LV/pEPGmnmE2hFR
	j0aicGJlzLGjkOyveHO/MPNtvWTEuOVTmXN354hbJc3sOB2XwIbuNT8VMVJ7XwtFWFcCiX
	WpySGxQl2dLbAeHYterMB/py0EmGIPFEY/G0Dr2QHaPgWHusv9ZuoJeS5EFUE01picFt2j
	WdKopCMVh7tFY8NZVxQFvXnJXyafnRHn+K9a5syQrIxj5hxsj0ZHxN/KF4wAqg==
Date: Thu, 26 Mar 2026 16:44:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
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
Message-ID: <202603261544313f63018c@mail.local>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-2-akhilrajeev@nvidia.com>
 <20260318-tweed-herbicide-eb924ef056b8@spud>
 <20260326150503.GA2360967-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326150503.GA2360967-robh@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084444_111193_AF8D47AF 
X-CRM114-Status: GOOD (  35.56  )
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

On 26/03/2026 10:05:03-0500, Rob Herring wrote:
> On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
> > > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> > > Discovery and Configuration Specification [1] to specify which discovery
> > > method an I3C device supports during bus initialization. The property is
> > > a bitmap, where a bit value of 1 indicates support for that method, and 0
> > > indicates lack of support.
> > > Bit 0: SETDASA CCC (Direct)
> > > Bit 1: SETAASA CCC (Broadcast)
> > > Bit 2: Other CCC (vendor / standards extension)
> > > All other bits are reserved.
> > > 
> > > It is specifically needed when an I3C device requires SETAASA for the
> > > address assignment. SETDASA will be supported by default if this property
> > > is absent - which means for now the property just serves as a flag to
> > > enable SETAASA, but keep the property as a bitmap to align with the
> > > specifications.
> > > 
> > > [1] https://www.mipi.org/specifications/disco
> > > 
> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > ---
> > >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
> > >  1 file changed, 26 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > index e25fa72fd785..1705d90d4d79 100644
> > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > @@ -31,10 +31,12 @@ properties:
> > >        described in the device tree, which in turn means we have to describe
> > >        I3C devices.
> > >  
> > > -      Another use case for describing an I3C device in the device tree is when
> > > -      this I3C device has a static I2C address and we want to assign it a
> > > -      specific I3C dynamic address before the DAA takes place (so that other
> > > -      devices on the bus can't take this dynamic address).
> > > +      Other use-cases for describing an I3C device in the device tree are:
> > > +      - When the I3C device has a static I2C address and we want to assign
> > > +        it a specific I3C dynamic address before the DAA takes place (so
> > > +        that other devices on the bus can't take this dynamic address).
> > > +      - When the I3C device requires SETAASA for its discovery and uses a
> > > +        pre-defined static address.
> > >  
> > >    "#size-cells":
> > >      const: 0
> > > @@ -147,6 +149,26 @@ patternProperties:
> > >            through SETDASA. If static address is not present, this address is assigned
> > >            through SETNEWDA after assigning a temporary address via ENTDAA.
> > >  
> > > +      mipi-i3c-static-method:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 0x1
> > > +        maximum: 0xff
> > > +        default: 1
> > > +        description: |
> > > +          Bitmap describing which methods of Dynamic Address Assignment from a
> > > +          static address are supported by this I3C Target. A bit value of 1
> > > +          indicates support for that method, and 0 indicates lack of support.
> > 
> > I really am not keen on properties that are bitmaps, why can't we just
> > use the strings "setdasa", "setaasa" etc?
> 
> If this comes from a specification, then I'd tend to just copy it rather 
> than invent our own thing. Obviously if is something structured 
> fundamentally different from how DT is designed, then we wouldn't. But 
> this is just a simple property.
> 

The issue being that the specification is not public so it is difficult
to take any decision.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
