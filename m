Return-Path: <SRS0=dljQ=GO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D55CC433DB
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Jan 2021 20:08:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF6522CB1
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Jan 2021 20:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF6522CB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pdEdvdhbGJZII96CcsqNc8vqNHhTnaYEF03mlRIrChU=; b=uSevhV+bBCyx4kReZuGsu0ShT
	vGEp5BN2tZb/5PS3D2bt4yAsIsthnOxTPQa3OmixezdX/u2dZLu1LTE30bzvCbRinsfR1MooYFk+t
	QMrpnXSHqy0UGSYqUR8rh0oelgJ14cp4rhv1mP9UAedPSXWSUb/F0g9hL8esdVPiCQoNgBV5RpQDh
	x41jYYXlcD8mDsr/lRt4mEJpekVLk6J0QI1qTslUmVcsEzonHnuQX0PKRu2nZ+BzJMhrp2elgBMER
	F+rhfLP/9zFdiylxTzwBx6Hn9DGDsq7ZO6mOSFPoRKFK9fXg+pG64UYpf18IrV64gz09g/W/JXF/1
	v15aLAy/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz3UK-0005A9-Bb; Mon, 11 Jan 2021 20:08:28 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz3UI-00058f-Cq
 for linux-i3c@lists.infradead.org; Mon, 11 Jan 2021 20:08:27 +0000
Received: by mail-oi1-f170.google.com with SMTP id 9so663784oiq.3
 for <linux-i3c@lists.infradead.org>; Mon, 11 Jan 2021 12:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NQOSC8PaC1kKsvf/PmL9aKJMx+ll+VvCy4f+MBuP6YU=;
 b=Tw5ArmppxCSH+6uORWfC77rY+0ULendbE7JX4pj/4ucofAnpD16Fw93Z1lluQDfYtU
 bnltooaLLBRdxSAytTHmWjxcUwvxN9pjtEKy3v7/O/bgapuyEWAVwXCijENa63KDDtYg
 1WnOhC0JkXpirWMA27b44dQ4Hi9z03TUmPxCX1kapMsvuJ4C4rUKnlBfj6VNeo0O3UJq
 tXGL5CZRa9g4219LsVme8KbKLNN/xwqPcAp6gg3aELOZlUWi5/bvTC5UhnIj6GNL2OFt
 lbe5wSCUyabdkvdTWEswmlyBJf7xm031+y8yfr/IVNX5bFxv9QZlMjIramIH0Ghp9Wvw
 my8g==
X-Gm-Message-State: AOAM5330133qsp9/S1kwMlvZm+12S9GqSIBjF1pbx0YXdohWbxs5tVJ4
 QheQUboK0IvdhJ+CqEgmS2xy48TtJg==
X-Google-Smtp-Source: ABdhPJwtEp1qleZAeMJpwHW6TlxIvCt4o9ThpnLaiv1LRJBVFVtVSWE0gkro2j9lbgQI1dou0vVvcQ==
X-Received: by 2002:aca:fd0d:: with SMTP id b13mr314332oii.27.1610395703905;
 Mon, 11 Jan 2021 12:08:23 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t19sm172347otp.36.2021.01.11.12.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 12:08:23 -0800 (PST)
Received: (nullmailer pid 2985245 invoked by uid 1000);
 Mon, 11 Jan 2021 20:08:21 -0000
Date: Mon, 11 Jan 2021 14:08:21 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: i3c: Describe Silvaco master binding
Message-ID: <20210111200821.GA2978830@robh.at.kernel.org>
References: <20201228161107.11804-1-miquel.raynal@bootlin.com>
 <20201228161107.11804-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228161107.11804-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_150826_483242_6F3612B4 
X-CRM114-Status: GOOD (  17.44  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Dec 28, 2020 at 05:11:05PM +0100, Miquel Raynal wrote:
> Silvaco provide a dual-role I3C master.
> 
> Description is rather simple: it needs a register mapping, three
> clocks and an interrupt.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> new file mode 100644
> index 000000000000..509de48455b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/silvaco,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Silvaco I3C master
> +
> +maintainers:
> +  - Conor Culhane <conor.culhane@silvaco.com>
> +
> +properties:
> +  compatible:
> +    const: silvaco,i3c-master

Kind of generic. Only 1 version?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: pclk, the system clock
> +      - description: fast_clk, for the bus
> +      - description: slow_clk, for other events

The names of the clocks go...

> +
> +  clock-names:
> +    minItems: 3
> +    maxItems: 3

here.

> +
> +  resets:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

This 2 should be defined by a bus binding. Care to convert i3c.txt?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false

No, don't you need child nodes?

> +
> +examples:
> +  - |
> +    i3c-master@a0000000 {
> +        compatible = "silvaco,i3c-master";
> +        clocks = <&zynqmp_clk 71>, <&fclk>, <&sclk>;
> +        clock-names = "pclk", "fast_clk", "slow_clk";
> +        interrupt-parent = <&gic>;
> +        interrupts = <0 89 4>;
> +        reg = <0xa0000000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };
> -- 
> 2.20.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
