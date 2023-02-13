Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901B8C64EC4
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wg9W+4uAeROzAM7irJkGYhBxUUhDqyE9pQLmQ9mJWFE=; b=qvJlnlo1pfMzr4
	6hirSTPtTXgK2brGMYVpgPiGGnU6fAkk66mf4F77cgWuVAlay7g+5roglb+cuSE7r4jThgRQ771y5
	5snb6g1fPAOhpkaAdDsWYjZl4jl8X0L/KyUegiBfjzO1B4NpJzyZlXkk1uTpI1dnovZhQOQ0R9pmu
	V1QjGrmUjBBAxl/jMDF3vYh0ztidgqDNtxvu1T/QKJc8XJJ3yclnEU4YqecAGjIYqqqPiFtkWfQgZ
	mJD5CumLHUgcmT8JhPDxBp1HTpvza9RLg9iVyHANZ4+YyLuKgVm41FFX857fYdtKH06x+7saHdb2x
	bZKBkKeyuT9z61FSOyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWEy-00E8oI-Sz; Mon, 13 Feb 2023 10:39:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUQL-00Ddyw-O7
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 08:42:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso8369763wms.4
        for <linux-i3c@lists.infradead.org>; Mon, 13 Feb 2023 00:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OmNYTifheZvD9PPxr9kkTRGJzSHdY4kbukQrLTBAW4=;
        b=FWK+6HEinSgiua2XGF21FAE0FGr7XnSb0PdJdZ9WqkvUH6IQkN/6MpvTzOiSj6sRXf
         zXiotXiz2tKlhrUQtBXKHMnYDZUpB0vKM2ljHRS+fjTBSQC9SghhIPCD3y0zOUfWvxq7
         tLTs4/cdzxdWgO7LD1m2vTWQyDHKHbXCQdhjXEtPXRmuJ1iwXmHE7Mf5mzrb6AuISa5b
         c30So5xwqsPrNf2KF6BbOA6IQXmj4APwUxT2UVzvjrui7Nv3meQpChtmA1F2nrXIr1Na
         x1ZdfYz0cXRjiQ35Ecbt9OykdOGic1HoLZrOFvydYRCOKO0ltE+xXxUNuXe0oQmA5SDg
         QV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OmNYTifheZvD9PPxr9kkTRGJzSHdY4kbukQrLTBAW4=;
        b=ioF3I8eTK/gMCuCcFRybBawURs1DFKluU+/ZRHlTZ0Ry3kPprY0Nbw2Za/RxRBXyMf
         EGrlu5Pu6DXk1yu+RtVGX1HHhaRe56cMaDmiTPWjH2UoG0/cTqWtXUYm6Cr9o2xw94F5
         sa7F7HejcUBrV0RzwTT9FG51MnB5FKvYEzZcXjRlKvW7dkz0JUSvmY4ubLcw3avy2mWH
         6/0FC/U76+gTgvNrUUurjTR+YQ4iTQpi5EKMjnkNnwLJ5zLQ6lrOUxL9NrzyU0qZX3gk
         h3VCczBndnTF8ftCELG+MztzsokXOGfqEoLyWCigUI8OkRyRGQ5HrM1WQ4f8zkM92tFp
         XrnA==
X-Gm-Message-State: AO0yUKUq9PcJXRy6ZI2eOQ25fC6FHZFOq8HaVm5CKT2I6ceDMpzyVsDR
	ZzXKhs+SawaFN2O317Q/SO4xrw==
X-Google-Smtp-Source: AK7set8dt7dKV4KWBja4N7OSEnkrJwuXkwT2UiLf0cdeBzHUv/RBuhO0QLIFvWWvTbc6kQb0Ztts5w==
X-Received: by 2002:a05:600c:a687:b0:3db:bc5:b2ae with SMTP id ip7-20020a05600ca68700b003db0bc5b2aemr17827029wmb.41.1676277775347;
        Mon, 13 Feb 2023 00:42:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003db12112fcfsm14458194wmo.4.2023.02.13.00.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:42:54 -0800 (PST)
Message-ID: <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
Date: Mon, 13 Feb 2023 09:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_004257_843259_AD913702 
X-CRM114-Status: GOOD (  23.19  )
X-Mailman-Approved-At: Mon, 13 Feb 2023 02:39:18 -0800
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

On 13/02/2023 08:41, Jeremy Kerr wrote:
> This change adds a devicetree binding for the ast2600 i3c controller

1. Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

2. Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

3. Subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.

4. Where is the driver? Where is the DTS? Why do we want unused binding
in the kernel?

> hardware. This is heavily based on the designware i3c hardware, plus a
> reset facility and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - global-regs: to reference the (ast2600-specific) i3c global register
>    block, and the device index to use within it.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
> RFC: the example in this depends on some not-yet-accepted patches for
> the clock and reset linkages:
> 
>   https://lore.kernel.org/linux-devicetree/cover.1676267865.git.jk@codeconstruct.com.au/T/
> 
> I'm also keen to get some review on the pullup configuration too.
> 
> ---
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> new file mode 100644
> index 000000000000..ef28a8b77c94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 i3c controller
> +
> +maintainers:
> +  - Jeremy Kerr <jk@codeconstruct.com.au>
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2600-i3c
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  sda-pullup-ohms:
> +    enum: [545, 750, 2000]
> +    default: 2000
> +    description: |
> +      Value of SDA pullup resistor in Ohms

Why this is property of i3c, not pinctrl?

> +
> +  global-regs:

Missing vendor prefix

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      A (phandle, controller index) reference to the i3c global register set
> +      used for this device.

Missing items description:
https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - global-regs
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i3c-master@2000 {
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +        compatible = "aspeed,ast2600-i3c";
> +        reg = <0x2000 0x1000>;

compatible and reg are first properties.

> +        clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
> +        resets = <&syscon ASPEED_RESET_I3C0>;
> +        global-regs = <&i3c_global 0>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i3c1_default>;
> +        interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +    i3c_global: i3c-global@0 {

Drop node, unrelated.

> +        compatible = "aspeed,ast2600-i3c-global", "simple-mfd", "syscon";
> +        resets = <&syscon ASPEED_RESET_I3C_DMA>;
> +        reg = <0x0 0x1000>;
> +    };
> +...

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
