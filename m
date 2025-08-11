Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D5AC87FD2
	for <linux-i3c@archiver.kernel.org>; Mon, 11 Aug 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aejbQHa3qDgFP0dNuy0sGMGEFjmF3NCegjxysEe5ME=; b=WTpZg1puMCTCga
	ytvlTzqn7nJyliNiJxGIzMUs4GqPoO3RFRjCtvtDHR6dsG923VbnukApnjwOV0qf87kZqU5XabNM4
	TE4LNZxzuCJkq8ATgl+ngeeSMDFZo06hW1h+GlMN37PO8TUhZhv6RHUha+xyhLzDt5D/uFguEojPU
	CtwNKjaxVut08Oee81ixkSW8a0Pvn4NkKAMwolIBmYEN+TIsrawN3AaNgyEa1GNPIu+gwVAHJd+2g
	vf6pIMKW1f3xUryGoZewKyyesL7BdN0EC9pPTbRmQ4hYAF6+++k+2it0xgvMHqaZNNhl9Vby4cOU1
	PZ9DNjWwauWN9uEKHC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNma-00000006phm-1VZg;
	Mon, 11 Aug 2025 08:21:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNN3-00000006lpH-0okU
	for linux-i3c@lists.infradead.org;
	Mon, 11 Aug 2025 07:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA6B343AC5;
	Mon, 11 Aug 2025 07:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C6DC4CEED;
	Mon, 11 Aug 2025 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754898904;
	bh=T6S5RGpXvEebt20lVpqzNu6jotmv7zyrpQ5ocjd9L10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqY+U/0gvevmegRF7Xt5jlEtg6Wcj7bSH1HlacearcGr1diJGXrkNgb+Tc+ThIqFM
	 tfcjQb82VVGZekDiJfDUm9ttU+tdDcHRo+aj3JqP7q9hMt3AZX5l7xAYMN0XQ8q2E0
	 oD5GjOLbrNEzqbHusdNzCYKPbIJFVcwJKgmBiMuxNhMqnWxGUBsI3EFDaBlL847J4H
	 HaKG9WD7FwBHj6kHxCgt/WS9VxsXFu8ZGJ0uFxCgH9tfuYS1mO+meRu0N9+qHaeYli
	 h9tGyIYM6xu9BBeJ6njlwK/z6NwLoHK28Wd47WPQC0y2lngVnYWgSeUjjcV6G5fsIh
	 /jB4j/Rr5VV/A==
Date: Mon, 11 Aug 2025 09:55:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, vikash.bansal@nxp.com, 
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com, Frank.Li@nxp.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <20250811-bittern-of-abstract-prestige-aaeda9@kuoka>
References: <20250808132033.3996614-1-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808132033.3996614-1-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005505_278211_C4047E51 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 08, 2025 at 04:20:32PM +0300, Aman Kumar Pandey wrote:
> +        hub@70,236153000c2 {
> +            reg = <0x70 0x236 0x3000c2>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            assigned-address = <0x50>;
> +
> +            cp0-ldo-microvolt = <1800000>;

So you just duplicated regulators?

> +            cp1-ldo-microvolt = <1800000>;
> +            tp0145-ldo-microvolt = <1800000>;
> +            tp2367-ldo-microvolt = <1800000>;
> +            tp0145-pullup-ohm = <1000>;
> +            tp2367-pullup-ohm = <1000>;
> +            cp0-io-strength-ohm = <50>;
> +            cp1-io-strength-ohm = <50>;
> +            tp0145-io-strength-ohm = <50>;
> +            tp2367-io-strength-ohm = <50>;
> +            cp0-supply = <&cp0>;
> +            tp0145-supply = <&tp0145>;
> +
> +            regulators {
> +              cp0 {

Messed indentation

> +                regulator-name = "cp0";
> +                regulator-min-microvolt = <1000000>;
> +                regulator-max-microvolt = <1800000>;
> +              };
> +
> +              cp1 {
> +                regulator-name = "cp1";
> +                regulator-min-microvolt = <1000000>;
> +                regulator-max-microvolt = <1800000>;
> +              };
> +
> +              tp0145 {
> +                regulator-name = "tp0145";
> +                regulator-min-microvolt = <1000000>;
> +                regulator-max-microvolt = <1800000>;
> +              };
> +
> +              tp2367 {
> +                regulator-name = "tp2367";
> +                regulator-min-microvolt = <1000000>;
> +                regulator-max-microvolt = <1800000>;
> +              };
> +            };
> +
> +            target-port@0 {
> +                reg = <0x0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                mode = "smbus";
> +                pullup-enable;
> +
> +                eeprom@57 {
> +                    compatible = "atmel,24c32";
> +                    reg = <0x57>;
> +                    pagesize = <32>;
> +                    wp-gpios = <&gpio2 2 0>;
> +                    num-addresses = <8>;
> +                };
> +            };
> +
> +            target-port@2 {
> +                reg = <0x2>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                mode = "i3c";
> +                pullup-enable;
> +
> +                sensor@68,39200144004 {
> +                  reg = <0x68 0x392 0x144004>;
> +                  assigned-address = <0xa>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4262e8d833c4..b33e90030188 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15477,6 +15477,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>  F:	sound/soc/codecs/tfa989x.c
>  
> +NXP P3H2X4X I3C-HUB DRIVER

Does not look ordered according to rules in this file.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
