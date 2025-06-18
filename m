Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3EEC71157
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Jun 2025 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlVli0B431EEOv3A8tdML8v3E37vOegnwpaLMSVZJXo=; b=SkPhSLe+SjwWt5
	XFCsD7QxHqfeWEs5hsc+1BFjEpKkszoBAVzhkolpm+CY2vAfxeirXwnN76GtuOBE3BqnBYmfjCgY6
	9TYgPyazJStXbiABmP58iquvp6k6jRr/aj0epk3SmrurFiMXwlXv0CT3WEhnCkRoKOwjG+jCCa4DI
	A3bSDHuu4SsqNhsOVS9giDDhz2wF2kuKINQXnQ1kxpd1RHK1a3MMSdZ1s0Ly0wavEZIh6F6XoWXvH
	r8n52pz3AgC/n2bDPH2Zfrq6pilqhxXvODZbAiw6I0zdizzWEgsuz8MTQcC5I7WBYNqUkQ7Fd2cCE
	98EWIWEsC2PLrc5Ki7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyuK-0000000BHTA-07bs;
	Wed, 18 Jun 2025 19:57:16 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRysb-0000000BHLJ-25Xk
	for linux-i3c@lists.infradead.org;
	Wed, 18 Jun 2025 19:55:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so64002f8f.2
        for <linux-i3c@lists.infradead.org>; Wed, 18 Jun 2025 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750276527; x=1750881327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNzDJ0oBkEzm8oLmVZ4FeBB/IbmdKIQf9CHD8w2IwKo=;
        b=G6ECT+DW4DzDDQfUzwANax2Tyc30u+RiQ90g6WSvqtetRbnqBgCX9fhnk2V0iTA7xH
         hk4dtn3+56MaMMy64Psdx54gLvFt0WNLt6YgnCI3CtPbfDaNqNPY03+YtNHC5jprJrgp
         n+G21YDYBPq890NMhrO5JhLK7Fu1B9Nm3V3qiVeHHFBOdMyLzQHOefrKeoZcP4YoOCt3
         JKZUpqQNKiilJS+dqOVCFhQYEVa0bFwfg3e6q2rQbUWfUlmtTZFDINncq97mu22qXLy5
         MN1r/6/V7dAYvLqqpcGTa9hi+z3OzOHHjl+XJ9yuFvtttRbVqVYXVxv503LkiRuTOMzO
         Cd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276527; x=1750881327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNzDJ0oBkEzm8oLmVZ4FeBB/IbmdKIQf9CHD8w2IwKo=;
        b=Q8Qss6TfIkU/vP0GLeHk/MlDBpdObP96gUvg/iE02JvUFgyrWVV8ZJuLvNQouBuLJV
         Wo1RAngrDPDXlp3ss30AxLrMr3kC4cM4LUIow6n8HAsNnllJcRU4+3S9DLsi68X5UgJF
         bRf1fQ5SSSgp8J1xp9z0+QZbkPBr0NQdg5Nj9xgl+oB3AC0xpXTeRNc51CJjJbsmYnru
         eRY68lILGsupyU7UZOmq3MP7mSB0e49B4ySBQxdxGpqMagyCwpyN95lwFso8BJa6G8ol
         iiPnQxYVlgeP5gVJA/SQ9EudyM+eahIGAFmflQbCuMGo5vFvOkTz0NAR8jw4pknGIG4/
         /J0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKz+75RqUn3wH0KgTOqekJrv3uxScqMaiiFKjmlr8ingifim+iGV7J5uzD778Z/C6MYdggdiXVLkM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6vvDQ1d3dTbvU5BottIDndxlF/4vliMbCR5xK1yFG25CEL1hw
	HDgiAbogxWfCsd7CRhBsT/1Kv9LQJjUvQVgh+8theDowdA6Qf0Xaexi2
X-Gm-Gg: ASbGncs8CX08WJEFjy+e1jIo7qP8MXMeiyk5urqrchPTJmio910B/CGxopHy2DnCKiF
	CVOgOWZVu3AlcBpB2/T1Hm5q+m/PXZICQI0MWxaYc4or61BDIGYc/VWnIbyQQUkQheLmiJhevlP
	SQi/K1Ace/ketL+0s38APPyySmi61L5Bjz0ZluvkuJpDPvcEFkvLQLSKKvhs2TPCwa2xE3E/QbM
	K6BsqZQDu7ebYno268p3jJzuhykq8KnkiLpn76dBS3QLgP8Uha7Et0EW5HRJDzhMLeKSd86JTc2
	9fnXQJZ9ZRCnMaz98BFQe+4GaAWvtXlpLqGtDob0aUknJSnPMSYTtOLKwNKE18p7/Ogl+UIWH4K
	Wf8rpa5PQNqI=
X-Google-Smtp-Source: AGHT+IGf8e5oh4khYmXZMlIMvNd0kEOjqBixPh2SFjaQsD1l9BKRo8X19dErEHHzDb4u6nTTOodrng==
X-Received: by 2002:a05:6000:653:b0:3a5:783f:5289 with SMTP id ffacd0b85a97d-3a5783f5758mr13454626f8f.49.1750276527099;
        Wed, 18 Jun 2025 12:55:27 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:12c1:8801:20af:3ab0:e9d9:22c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d74sm17994443f8f.10.2025.06.18.12.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 12:55:26 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:55:24 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <dfejhrchaxwze7gkipdgcx5byefv6hudi456na25yrts6viqvw@lfnv55dgvk32>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
 <20250618-visionary-hawk-of-success-d4aab8@kuoka>
 <ymmn2jgpa4bia2wl4d32ccipybxt4nylz4hspdf2svivk5ao7s@vv7v3soq2e65>
 <9260c217-9c63-4eec-854a-a7ec020d1e65@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9260c217-9c63-4eec-854a-a7ec020d1e65@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_125529_538389_E49ADC1B 
X-CRM114-Status: GOOD (  40.07  )
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

On Wed, Jun 18, 2025 at 05:45:22PM +0200, Krzysztof Kozlowski wrote:
> On 18/06/2025 14:15, Jorge Marques wrote:
> >>>
> >>> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> >>> ---
> >>>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> >>>  MAINTAINERS                                        |  5 ++
> >>>  2 files changed, 68 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> >>
> >> Filename based on the compatible, so adi,i3c-master-1.00.a.yaml
> >>
> > I agree, but I ended up following the pattern for the other adi,
> > bindings. I will move for v4. IMO the version suffix has no much use
> > since IP updates are handled in the driver.
> 
> Filename is not related to whether given ABI works with every device.
> Filename helps us to organize bindings and existing convention is that
> we want it to follow the compatible.
> 
Hi Krzysztof,

Understood.

> >>> @@ -0,0 +1,63 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Analog Devices I3C Controller
> >>> +
> >>> +description: |
> >>> +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> >>> +  implementing a subset of the I3C-basic specification.
> >>> +
> >>> +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> >>> +
> >>> +maintainers:
> >>> +  - Jorge Marques <jorge.marques@analog.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: adi,i3c-master-1.00.a
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    minItems: 1
> >>
> >> Why?
> >>
> > The IP core requires a clock, and the second is optional.
> 
> OK
> 
> > minItems sets the minimum number of required clocks and the maxItems is
> > inferred from the number of items.
> > 
> > On the IP core itself, one clock is required (axi), and if it is the
> > only provided, it means that the same clock for the AXI bus is used
> > also for the rest of the RTL logic.
> 
> Hm? What does it exactly mean - same clock? You mean one clock is routed
> to two pins? That's still two clocks. Or you mean that IP core will
> notice grounded clock input and do the routing inside?
> 

The routing is inside the IP core, and only one clock pin is used. In
fullness, since it is a FPGA-based IP Core, the number of input clock
pins are defined by the parameter [1] ASYNC_CLK that enables the
asynchronous i3c clock input pin. The devicetree then describes how
things are wired, if two clocks provided, it describes that both clock
inputs, axi and i3c, are wired to the IP Core, if only axi, then there
is no clock signal to the i3c input clock pin and axi clock drives the
whole IP.

[1] https://analogdevicesinc.github.io/hdl/library/i3c_controller/i3c_controller_host_interface.html#configuration-parameters

> > 
> > If a second clock is provided, i3c, it means it drives the RTL logic and is
> > asynchronous to the axi clock, which then just drives the register map logic.
> > For i3c specified nominal speeds, the RTL logic should run with a speed of
> > 100MHz. Some FPGAs, such as Altera CycloneV, have a default bus clock speed of
> > 50MHz. Changing the bus speed is possible, but affects timing and it may not be
> > possible from users to double the bus speed since it will affect timing of all
> > IP cores using the bus clock.
> >>> +    items:
> >>> +      - description: The AXI interconnect clock.
> >>> +      - description: The I3C controller clock.
> > I will update the descriptions to:
> > 
> >         - description: The AXI interconnect clock, drives the register map.
> >         - description: The I3C controller clock. AXI clock drives all logic if not provided.
> > 
> >>> +
> >>> +  clock-names:
> >>
> >> Not synced with clocks.
> >>
> > I will add `minItems: 1`.
> >>> +    items:
> >>> +      - const: axi
> >>> +      - const: i3c
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - clocks
> >>> +  - clock-names
> >>> +  - interrupts
> >>> +
> >>> +allOf:
> >>> +  - $ref: i3c.yaml#
> >>> +
> >>> +unevaluatedProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    i3c@44a00000 {
> >>> +        compatible = "adi,i3c-master";
> >>> +        reg = <0x44a00000 0x1000>;
> >>> +        interrupts = <0 56 4>;
> >>
> >> Use proper defines.
> >>
> > The following can added:
> > 
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > 
> >   interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
> > 
> > Is there any other to be replaced?
> 
> Usually 0 has a meaning as well. Where is this used DTS snippet used (on
> which platform)?
> 

The example provided is used on AMD xilinx arm,cortex-a9-gic.
The IP core is tested on AMD Xilinx, Altera FPGAs (arm, microblaze, arm64).
Test/support to RiscV-based Lattice FPGAs should eventually also come.

In this example 0 means Shared Peripheral Interrupt, but has no header
file defining. I guess I could make it generic and set to

  interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;

and let the user figure out for his target platform.
> Best regards,
> Krzysztof

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
