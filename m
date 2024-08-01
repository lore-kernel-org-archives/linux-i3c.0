Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D33BC3DA4A
	for <linux-i3c@archiver.kernel.org>; Thu,  1 Aug 2024 23:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23iWxVh5nuhzSQXJ/5lpWaGp5sSX4wX380zVOwXYQio=; b=ICqCVbdRc6oELA
	2e+vgiqf70uSPbmpsC431zqehiiNjMTldJ/WMFOjiSu/UzPeiF49Jdop96x0PjATSk44D8yK3jWkB
	3NvKkJa6M8wM8Qz/mrv1EasuZU6QORVSHKOKT8AulUNZQjgj3u9mqPBG8DL/3wUA+Qra8Bj0OmFbT
	BPH3+Ml0HoHoZb4te0JfkRyNCPk27RRcQWwPFh7SazVvuxO+XDZKSRVWHeLajZKzMPotTMBYHrH30
	AnPGFMeqQTdhiB00PGPqMuXNp0DQxYn2Q4sW9DghHmoDLDtp+nGzkbbxnjbyRpAhqXXeQBx7Rfy+p
	18jWeHnIhkVlvX8YnmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZetu-00000006z1L-3idV;
	Thu, 01 Aug 2024 23:08:02 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZetV-00000006yul-0DrK
	for linux-i3c@lists.infradead.org;
	Thu, 01 Aug 2024 23:07:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46BCCC0003;
	Thu,  1 Aug 2024 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722553651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4awUVwG37LseNs27BJI5me6lqTMbdYGn9CDQNcfZPk8=;
	b=g1LJb/p0yD6SgP3eDyE9mw2oVj7wCol0tEc3HqCjkEU5R/2QPtKYabNUgLEgC8E91cg4Ev
	mPc2Obd0gKBUh7cgU7ooiysO+KFpyGCIdIekXOvTKrfFsPFjG9014nexl8rz80AXe/mkOF
	3QgRb5Lrpfm67nXj4pR0Nx4mHApPU/MNUj8pCaxuGdOHxRSJ97vLdBbMPwyeDHEBnOeL5d
	DlScwlT7k2caemmpGghwyMmPTO2i/RWypSR44V4299LptiPKX5mfTt0aBrmxe9s39XwXCE
	tMplR5Eriatc+oUuTrsswrhQPhPj3nu+rRxIEfs17URyNtlwbZg5jD/YCp/BNw==
Date: Fri, 2 Aug 2024 01:06:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stanley Chu <stanley.chuys@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com, cpchiang1@nuvoton.com
Subject: Re: [PATCH v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
Message-ID: <202408012306316257ee23@mail.local>
References: <20240801071946.43266-1-yschu@nuvoton.com>
 <20240801071946.43266-2-yschu@nuvoton.com>
 <c3ee7783-6891-4917-9935-21d46d8ac9a7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3ee7783-6891-4917-9935-21d46d8ac9a7@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_160737_922133_E5DE8181 
X-CRM114-Status: GOOD (  24.85  )
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

On 01/08/2024 16:53:52+0200, Krzysztof Kozlowski wrote:
> On 01/08/2024 09:19, Stanley Chu wrote:
> > The npcm845 i3c devicetree binding follows the basic i3c bindings
> > and add the properties for allowing to adjust the SDA/SCL timing
> > to meet different requirements.
> > 
> > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
> > ---
> >  .../bindings/i3c/nuvoton,i3c-master.yaml      | 123 ++++++++++++++++++
> 
> Use compatible as filename. Anyway word "master" was dropped.
> 
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > new file mode 100644
> > index 000000000000..a40b37b16872
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/nuvoton,i3c-master.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton NPCM845 I3C master
> 
> Use new terminology. Since 2021 there was a change... three years ago.
> 
> > +
> > +maintainers:
> > +  - Stanley Chu <yschu@nuvoton.com>
> > +  - James Chiang <cpchiang1@nuvoton.com>
> > +
> > +allOf:
> > +  - $ref: i3c.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: nuvoton,npcm845-i3c
> > +
> > +  reg:
> > +    items:
> > +      - description: I3C registers
> > +      - description: GDMA registers
> > +      - description: GDMA request control register
> > +
> > +  reg-names:
> > +    items:
> > +      - const: i3c
> > +      - const: dma
> > +      - const: dma_ctl
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: system clock
> > +      - description: bus clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: fast_clk
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  i3c-pp-scl-hi-period-ns:
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
> > +      If need to configure SCL with required duty cycle, specify the clock high/low period directly.
> > +      i3c-pp-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in push pull mode
> > +      When i3c-pp-scl-hi-period-ns and i3c-pp-scl-lo-period-ns are specified, the i3c pp frequency is
> > +      decided by these two properties.
> 
> Wrap according to Linux Coding Style (and read coding style to figure
> the proper wrapping...).
> 
> > +
> > +  i3c-pp-scl-lo-period-ns:
> > +    description: |
> > +      The low period ns of the SCL clock cycle in push pull mode. i3c-pp-scl-lo-period-ns should not
> > +      be less than i3c-pp-scl-hi-period-ns and the maximal value is i3c-pp-scl-hi-period-ns + 150.
> 
> Everywhere: defaults, constraints.
> 
> > +
> > +  i3c-pp-sda-rd-skew:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
> > +      pull operation when transfers i3c private read.
> > +    maximum: 7
> > +    default: 0
> > +
> > +  i3c-pp-sda-wr-skew:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
> > +      pull operation when transfers i3c private write.
> > +    maximum: 7
> > +    default: 0
> > +
> > +  i3c-od-scl-hi-period-ns:
> > +    description: |
> > +      The i3c open drain frequency is 1MHz by default.
> > +      If need to use different frequency, specify the clock high/low period directly.
> > +      i3c-od-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in open drain mode.
> > +      When i3c-od-scl-hi-period-ns and i3c-od-scl-lo-period-ns are specified, the i3c od frequency is
> > +      decided by these two properties.
> > +      i3c-od-scl-hi-period-ns should be equal to i3c-pp-scl-hi-period-ns or i3c-od-scl-lo-period-ns.
> > +
> > +  i3c-od-scl-lo-period-ns:
> > +    description: |
> > +      The low period ns of the SCL clock cycle in open drain mode. i3c-od-scl-lo-period-ns should be
> > +      multiple of i3c-pp-scl-hi-period-ns.
> > +
> > +  enable-hj:
> > +    type: boolean
> > +    description: |
> > +      Enable SLVSTART interrupt for receiving hot-join request.
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
> 

This has to be runtime configurable, see hotjoin in
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-i3c


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
