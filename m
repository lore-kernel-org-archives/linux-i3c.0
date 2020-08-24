Return-Path: <SRS0=jjtB=CC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02445C433E3
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Aug 2020 23:24:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B234320656
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Aug 2020 23:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+QT4Fxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B234320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0xG20kXroF3i2LftKHeAacpvQOcMhjZ88dCuIVJeAQg=; b=O+QT4FxxoxiQkgVIk/FA7iYGG
	dy4UQWBPvpGoQ70wanFHdGlGYOcQsCbOL4wpJowCFQIn1y91vZzOd8IbPX6srncPVHqK7TzKMYL7C
	0Tk1TpK4j2zhohGXQLq8KnToEM/WG3Ps5rJbyrw7bhHSqPYzqIYjBZntfvQmu1RgFNjgPqDrkPM+1
	bcrSmiys1GYwPUbrWaHMOBrlLV9sxZCGP4M/DxCtYu4F/XSrSZWfVc/Ab1HTS9pDTaX9+GomM1N/f
	Y0jfo+Y4rZATCslKntVPIRyKg5mThZQkctc6vwlVWnWNaOSqi0qB9GjElnXSL5xjLxGUIiM7rgG59
	4YPzesJEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kALpS-0004nk-Qq
	for linux-i3c@archiver.kernel.org; Mon, 24 Aug 2020 23:24:42 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kALpQ-0004ms-M0
 for linux-i3c@lists.infradead.org; Mon, 24 Aug 2020 23:24:41 +0000
Received: by mail-il1-f194.google.com with SMTP id r13so8849630iln.0
 for <linux-i3c@lists.infradead.org>; Mon, 24 Aug 2020 16:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JwCY8rswka2evtE21QF7ein3AFgooZR8ofb7Ek5G2oQ=;
 b=Zswu+u6ShnZklTriRHG0eXdBv+BX+SyXvuJp7CrfVsYysBepxbiHClorKb6Q7MrqTu
 FrCp6QgR9tN615zXH0RKMKgP4lchtkSt0hMj/EmgZn93WJ6HH66KMGvFmbjkxg3FaG7X
 89fRKKwKOn/1nu3vZ/2LWHvtF7l2xVr6TD+UqaFgKin6L9i9OZrqJlsvDuavTRVdqZXV
 vOl0ZyiHivNmjBAeHzDHqzvb0MQDpsjP4TehN/YJvxwbZFghUPFe9M450+IOpCM8paYG
 3pOSm/VLDVk+/dvX8OLYwXwAI30J6FH8E5q2N7lNTb7X7N5ij/rXvX/XT+BpF8gPrUEh
 DKOw==
X-Gm-Message-State: AOAM533M+5CIGC9RSpuIPcuc+f7rbBfPG/WRq2sIcDWj02JlNjSRzRWN
 9KM2neMthIk+OZmCGaVrtw==
X-Google-Smtp-Source: ABdhPJx7LtfsqA1qY3DyB66QRPALZplHC090bvD6c3U46iI9qD4WKEflLmoQC5seq1+YwsA9qyvLjA==
X-Received: by 2002:a92:a188:: with SMTP id b8mr7329457ill.81.1598311480006;
 Mon, 24 Aug 2020 16:24:40 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id a16sm8105572ilp.23.2020.08.24.16.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 16:24:39 -0700 (PDT)
Received: (nullmailer pid 3530535 invoked by uid 1000);
 Mon, 24 Aug 2020 23:24:38 -0000
Date: Mon, 24 Aug 2020 17:24:38 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: i3c: Describe Silvaco master binding
Message-ID: <20200824232438.GA3525200@bogus>
References: <20200812141312.3331-1-miquel.raynal@bootlin.com>
 <20200812141312.3331-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812141312.3331-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_192440_785670_9DD59434 
X-CRM114-Status: GOOD (  18.83  )
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
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 04:13:10PM +0200, Miquel Raynal wrote:
> Silvaco provide a dual-role I3C master.
> 
> Description is rather simple: it needs a register mapping, three
> clocks and an interrupt.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v2:
> * Updated Rob's tool and fixed the mistake reported.
> * Updated the vendor prefix.
> 
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> new file mode 100644
> index 000000000000..63731e8a9068
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -0,0 +1,59 @@
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: |
> +      There are three clocks:
> +        pclk:     System clock
> +        fast_clk: Fast clock (for the bus)
> +        slow_clk: Slow clock (for other events)

You basically say this in the schema... If you want some description, do 
it in 'clocks':

clocks:
  items:
    - description: ...
    - description: ...
    - description: ...

> +
> +    items:
> +      - const: pclk
> +      - const: fast_clk
> +      - const: slow_clk
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks

additionalProperties: false

And that will point out some errors in the example.

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
