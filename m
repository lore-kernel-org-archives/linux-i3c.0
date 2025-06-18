Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659C9C761AE
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQJS1jtqW1WUAY/iZxrvxzkHyciri4Z6drJR5LqWhwE=; b=Es4SYF6mn8Vxh4
	C3iBFNNtaZ7PavTiCvgOKeFUQVvLKRWeTbHWqBMw09/CivAzu5sCFkIIdVcsqUQ3uMlu845kE+cqT
	hH5SKGm8lLyDJEkAEBBky0hD23HGC7F9H0HlIMd0h2coVxz7j5ovNHd5u2z1lMJG+UsW/vnr3DBBr
	dkrvAG97eHibGd7yiV0fcq7BptPZHH445U4nlDJ0s7BdgcDTpGZf7uOVB6YS5A2pXK40keGYuzwWI
	U/pZWa/qy0PuxGEqpD4FcA8njSFNlaOyNa8rP1Ful8SkAZPuD4fJpoSZBhxyMEtagEpgYIzNjOYbM
	CCAFZ6nCpYpbbeElJTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoQ-0000000AHe4-0RhF;
	Wed, 18 Jun 2025 13:26:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhV-0000000A5Pd-0thd
	for linux-i3c@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-450cf214200so59025275e9.1
        for <linux-i3c@lists.infradead.org>; Wed, 18 Jun 2025 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750248932; x=1750853732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ywQo6SUFx1lzN34W/DgqqJaDCnFkQLp/0M82nR/3jtk=;
        b=nZDqUWNyV6XtieeFDxs+nMaYXZfJOwLq+GsgiUyxxUD2WBzVPhj1gM9VRmnJBrBexO
         2RkcXp79VXsCERC3JxvKEXxSRW9wtarVEuDcSy/xmS89DvEyjnDJTiNdP/fVjE3xTew4
         WyUg4vKduWbdWYgBOkr9PjO2O7M6UMZY7psoYdMxSxVp6PLmYI1OGTkTaADdR3Ca0uVO
         Q4eFYVybwh16Tfo86R6cNS0dCQZJXYzpz6k6lJ8MSHzugIa6GLAHzNifn2cL2BAppKRH
         lsRDAv1Vo8cAaIuxE/xL3H+tnR3yw+AumQFir3m0mdB6GYSsw12e9SJNic09yreOaGoz
         l81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248932; x=1750853732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywQo6SUFx1lzN34W/DgqqJaDCnFkQLp/0M82nR/3jtk=;
        b=cFhOiUt9DA7fk/ksZVYIifk6518V74UfGSsvoX45zCqxf5UHp1p+Ny3Y1v4kqgu1eS
         Xcr7YRJBtw9n9sGYJqkgO6FndbjjnF+/DoXDCHD9L9LO+HuRQmdkUP0IiA57EN+9+q49
         5RVh6OixKtfZbs/1MoB5uvpAHQ6eRbm8U/KMJO75B/1Koab59QLNvmKrFJfvHTVIpT8g
         wKNB+iZBF7DsB7YLk83NyzkQ14UHYUkQtgMPTu8GxBeEDzkK3utqaW8Q/pFzogs21O9x
         Nt62s6XhFs/cjU0iXz7bomQk+EK3kvUesNJqWTD2CuYYi2b7126a/irexQqMTwAHw52y
         1q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkb5p6pQ6uTu2q0zDpEftg2l+vSJPPFoXM/i3HPvinKD6JeD+vwgXmZ1FDtS9S4+l1PoNya7QOAGo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcivdolnvWJe14AS+xTVRVoer9BRWSRCeiM1gN0J6cnGtPgqXT
	OyGvXrAiqgT/C4Wh26mId+bVUHQ+DP0qyuloq/so4OZgu7Lkv/UO1Coz
X-Gm-Gg: ASbGncsuRpd9eY0ujqlzTdfF8vBlqeLAkB/wQjD0k2gepZJqNFBn4EmmhNkQ6/EF0oS
	YITRkSnSe9K//btNfh5no4aU0PM63rVuCIPa/gj2AzKreFSGX1tjkxuJvTkIrQnOqyG4sRzn+Dv
	cjoCNWeUl8miOHEzOFIQ9JM7APSJmfOB3y91a4CH7CNbjDjv9sggLCAaXs3pRB9ZXWrQSMw49Tr
	JfkpmAeR7UHNXxfrVe0qUwiUJVV+XcJnF0fC2nWdb8x22Y2zO/qEx3nRl92JnTf8u7nAk3b6RZn
	kpyZS9rMix1FgyBv9pN+wMqHZLbngeNhcv+L+NEFZkYxNGPaA36Sre3zV4y0g+dBcJMxKHbIqcJ
	Hm6PWB3U=
X-Google-Smtp-Source: AGHT+IEHOSjPWSh00P12zW7jYpqc5E8nsqDH1nPj9D8MDJOQ7SCMRaKJlqbVi+qZDnUXj/RLD7r7yA==
X-Received: by 2002:a05:600c:8b25:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-4533cac9674mr143842665e9.25.1750248931315;
        Wed, 18 Jun 2025 05:15:31 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e253f64sm203769495e9.27.2025.06.18.05.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:15:24 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <ymmn2jgpa4bia2wl4d32ccipybxt4nylz4hspdf2svivk5ao7s@vv7v3soq2e65>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
 <20250618-visionary-hawk-of-success-d4aab8@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-visionary-hawk-of-success-d4aab8@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051533_261468_74726993 
X-CRM114-Status: GOOD (  28.67  )
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

On Wed, Jun 18, 2025 at 11:21:22AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 18, 2025 at 09:16:43AM GMT, Jorge Marques wrote:
> > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > core that implements the MIPI I3C Basic controller specification.
> 
> Here you put outcome of previous questions - why such compatible was
> chosen, that hardware is this and that.
> 
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> 
> Filename based on the compatible, so adi,i3c-master-1.00.a.yaml
> 
I agree, but I ended up following the pattern for the other adi,
bindings. I will move for v4. IMO the version suffix has no much use
since IP updates are handled in the driver.
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices I3C Controller
> > +
> > +description: |
> > +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> > +  implementing a subset of the I3C-basic specification.
> > +
> > +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > +
> > +maintainers:
> > +  - Jorge Marques <jorge.marques@analog.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,i3c-master-1.00.a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> 
> Why?
> 
The IP core requires a clock, and the second is optional.
minItems sets the minimum number of required clocks and the maxItems is
inferred from the number of items.

On the IP core itself, one clock is required (axi), and if it is the
only provided, it means that the same clock for the AXI bus is used
also for the rest of the RTL logic.

If a second clock is provided, i3c, it means it drives the RTL logic and is
asynchronous to the axi clock, which then just drives the register map logic.
For i3c specified nominal speeds, the RTL logic should run with a speed of
100MHz. Some FPGAs, such as Altera CycloneV, have a default bus clock speed of
50MHz. Changing the bus speed is possible, but affects timing and it may not be
possible from users to double the bus speed since it will affect timing of all
IP cores using the bus clock.
> > +    items:
> > +      - description: The AXI interconnect clock.
> > +      - description: The I3C controller clock.
I will update the descriptions to:

        - description: The AXI interconnect clock, drives the register map.
        - description: The I3C controller clock. AXI clock drives all logic if not provided.

> > +
> > +  clock-names:
> 
> Not synced with clocks.
> 
I will add `minItems: 1`.
> > +    items:
> > +      - const: axi
> > +      - const: i3c
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +
> > +allOf:
> > +  - $ref: i3c.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i3c@44a00000 {
> > +        compatible = "adi,i3c-master";
> > +        reg = <0x44a00000 0x1000>;
> > +        interrupts = <0 56 4>;
> 
> Use proper defines.
> 
The following can added:

  #include <dt-bindings/interrupt-controller/irq.h>

  interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;

Is there any other to be replaced?

> Best regards,
> Krzysztof
> 

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
