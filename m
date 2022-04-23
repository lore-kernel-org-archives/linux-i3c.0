Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A481FC433FE
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Apr 2022 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNao7MFbdnRRsaCKUuugbOBYT/JrOAKr5bUkLZd0FC0=; b=N/9x9MQHlNEEMb
	thyWzsLSaRnYuBBhBL6hz5GM4Q7HP3z/fuiV/eGyfheZgwkYgE0wNTowIGyAmUhcRc1xi+yFkhkQv
	TyR47wfTwLe0K/TMzq84wp2HrFSsQSptT6xwYW7uUPKyBccg2dQ5BNwAPrbs6vMMv4AjEvBZhYjgL
	FD36FziXuc727M2uzeboCHhHRBTodLdLXDqGV4syMkwbdds9Pt8OF3RkfF5dER3bbVn1IWO7gjUSG
	swj57AUzwTZYyyCUTBC9b5Dorpxdcn1jHXtzUusCUY9s7p3Z65659O7VY598xtbclgHt5QW5zXWbL
	w+nhfS000QtVuOAY2/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcS1-000OTU-Qm; Wed, 27 Apr 2022 07:51:05 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niKoR-004rQV-8h
 for linux-i3c@lists.infradead.org; Sat, 23 Apr 2022 18:48:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z19so826860edx.9
 for <linux-i3c@lists.infradead.org>; Sat, 23 Apr 2022 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cn6XbdSV75AzJUqDkArX7N9Qwi67g268+E4pm2dewqo=;
 b=nll2PAJt9YMO/U59Hz37tDWVllasTrAyD3eCrwHBbN7g69GupF5QvhZK7r47s73zmv
 lKM4M1IM0d6ouCQjoWcZ1EoMFOjNhw1IeQBYzMihZv+a/tL2BUhoZsokr1KtK4ydPrAX
 fl2txqmjV93IWaFB0D2Ed3IwG/ZIaoM7ekdzjWGlK1X35Cm2dWCJtH1EWaIVquFWTMfy
 BetrPYvG9XNYTs6dKEG8M0Msy8Um5erafxbhRp0dtjazpFdSBXfTpMU7SxeCfPVWexVI
 oFN9xoJ3h+FV4xTYC5tur8a0iPICcTpTC+qpQbCoWsHI61wxqTDriiRf9iZ7n1bbk6hY
 BGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cn6XbdSV75AzJUqDkArX7N9Qwi67g268+E4pm2dewqo=;
 b=CcV3qbexWuPymPXM3UYoJAR691YzIXxMAsszL2MpzLtcQF9w9BtYx+8DGaJ9y4m3W9
 k8UfszsZ5ecCdq1qHuJADfE6ltP4BFUpULEJQutl2H0XQND1Jq6jKLd/5ucml/MqV3S+
 eUkoD3Zd9jnAPQJvTDTBNe+2CspPA4Jj2ndocuaN3K/OxuFtCaoU6FZBfkg/rSn5Ss55
 NZQO4usV+asO/Ec1rMjHz0rnrXTBjKgckJSA5lo61QzUD1XO3MT0D5Cp5bEoaI+Le6s2
 hKGnuqhYkZScKTTBGtPEk9zM01YdAmZmzDDCiPeA6hc0I/+E6U2edIixvTVUJsKr8AOE
 G/6g==
X-Gm-Message-State: AOAM532klbd8oya+kXu0+STIRq925xYJ7FmUfUeaLV0/4Oy4+U3Mw3MF
 lrQah02z+dAeQhPmDcu+WpfaQA==
X-Google-Smtp-Source: ABdhPJxqvrPTE82vaER+vS4BSUdN4v+0Gf2elep3T/QIBc2ZZd1aa8/RuntBcjoHt4V0LrYFGGNoZA==
X-Received: by 2002:a50:e70f:0:b0:425:da3c:4731 with SMTP id
 a15-20020a50e70f000000b00425da3c4731mr683754edn.223.1650739733391; 
 Sat, 23 Apr 2022 11:48:53 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l2-20020a50c102000000b0042423e1328fsm2445889edf.26.2022.04.23.11.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 11:48:53 -0700 (PDT)
Message-ID: <24d1c786-17e5-bd70-df7f-55cff045df7f@linaro.org>
Date: Sat, 23 Apr 2022 20:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: i3c: Convert cdns,i3c-master to DT schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Przemys=c5=82aw_Gaj?=
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220422192224.2594098-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422192224.2594098-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_114855_356989_E1DB0BDB 
X-CRM114-Status: GOOD (  11.55  )
X-Mailman-Approved-At: Wed, 27 Apr 2022 00:51:04 -0700
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

On 22/04/2022 21:22, Rob Herring wrote:

(...)

> diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> new file mode 100644
> index 000000000000..cc40d25358ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/cdns,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence I3C master block
> +
> +maintainers:
> +  - Boris Brezillon <bbrezillon@kernel.org>
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  compatible:
> +    const: cdns,i3c-master
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: sysclk
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c-master@d040000 {
> +        compatible = "cdns,i3c-master";
> +        clocks = <&coreclock>, <&i3csysclock>;
> +        clock-names = "pclk", "sysclk";
> +        interrupts = <3 0>;

There is a chance this is IRQ_TYPE_NONE and should be something more
reasonable, but without DTS example we might not know.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
