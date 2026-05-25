Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A65CD5BD2
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgPz0y2/FhhaOYo+Bp7Hmm4qGODqzeDjBq9zsHOHeec=; b=4CDXD2+6OSK0kv
	PGY+HYsaAUemXkvE3seT9oXjV7+h0aAJZ/l52R0iuaIVCO3M9qSDY18kgeHupwdmFBp6a8xWeCIUb
	JD5wxg1l0uYM74utyJuG4aCz+MLINyn/weYYe+tVa2rYgGm/ueArJqOWfNHaF/tRVViftDEcq2e4V
	xJRGg2YOTRP6EQSbdHAfsOLfEbFUx44qEnOWNSMZqnob3B8AN+debHP8DlT1nmWJGb+fh7WscBXUv
	Hm5KvzKMBG7v+PBUI3CU5DkZu0vXtRk9Ym4O/iiYMw1cmSKhX26t+JBqXmFZjfuM0XOaA8ZRrs0q3
	z4VO1ll6yb2fICCactmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVpf-0000000HMlE-17cO;
	Mon, 25 May 2026 13:59:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVpd-0000000HMkR-14Ub
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 13:59:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF44743B85;
	Mon, 25 May 2026 13:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EA51F000E9;
	Mon, 25 May 2026 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779717540;
	bh=RIUWmMygyhldSJFbC7rHQlnc7wlI1UHEtpSHfrxKi7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=M/XL+iiYZ0OMXe/bFiUvmEm014iVSeMltcW8yFcQDqZu2yti8DRmktyo2ORzST9b9
	 b7SniUKgrt+4d+K/kKBLwEbY6TzNHYwVlyw2mhWpD1bGBYuJ6Z2hOI6tlvUnnE9KQt
	 7mX0E/t+oIXDOb9L/6gVxo1eOppzipL9M9gvvA5G8qETNwMk+EErfWoAJY+Tzci/nm
	 jrhnoq8NzWeZLPH2DxbBbXnjhQ2mnTempSZw0a1/0A0mc93gcOo5DtK5Q1pyTeP6ND
	 0iTajM8kfILya2yOb/3oBDgmTgnV0vBErJ9p08tQPR2g32VXNFV67Oq81Fjl3hRVg7
	 2gimDWbOZqYXw==
Message-ID: <64a8ba7e-f044-4f51-8619-9419ec7dfc27@kernel.org>
Date: Mon, 25 May 2026 15:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: add Realtek RTS490x I3C HUB
To: zain_zhou@realsil.com.cn, linux-staging@lists.linux.dev,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, alexandre.belloni@bootlin.com,
 Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, wei_wang@realsil.com.cn
References: <20260525125128.297-1-zain_zhou@realsil.com.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260525125128.297-1-zain_zhou@realsil.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_065901_343436_534431CD 
X-CRM114-Status: GOOD (  17.11  )
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

On 25/05/2026 14:51, zain_zhou@realsil.com.cn wrote:
> From: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Add DT binding schema for Realtek RTS490x series I3C HUB devices.
> 
> The binding describes configuration properties for:
>   - LDO enable/disable and voltage level per port group
>   - Pull-up resistance per port group
>   - IO driver strength per port
>   - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
>     IO mode, SMBus clock frequency and polling interval
>   - Hub network always-I3C mode
>   - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)
> 
> Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Changes in v2:

Messed patch. DCO is always the last. And this should tell you that
changelog does not belong here - goes under ---.

Anyway, did you test the binding this time or we expect another failures?


> - Rework binding per Krzysztof Kozlowski's review:
>   add realtek, vendor prefix to all custom properties; use boolean
>   for enable flags; use u32 with unit suffixes (-microvolt, -ohms)
>   for voltage/resistance; change to unevaluatedProperties: false;
>   fix title, maintainer name, description, $nodename pattern
> - Consolidate examples; add dt-bindings/i2c/i2c.h include
> ---
>  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 263 ++++++++++++++++++
>  1 file changed, 263 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> new file mode 100644
> index 000000000000..851a433abcd3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> @@ -0,0 +1,263 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/realtek,rts490x-i3c-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTS490x I3C HUB
> +
> +maintainers:
> +  - Yin Zhou <zain_zhou@realsil.com.cn>
> +
> +description:
> +  The Realtek RTS490x is an I3C HUB device that provides voltage level
> +  translation between I3C controller and target devices, bus capacitance
> +  isolation, address conflict isolation, I3C port expansion (up to 8
> +  target ports), simultaneous dual-controller port support, and per-port
> +  mode selection (I3C, SMBus, GPIO, or disabled).
> +
> +properties:
> +  $nodename:
> +    pattern: "^hub@[0-9a-f]+(,[0-9a-f]+)*$"
> +
> +  compatible:
> +    const: realtek,rts490x-i3c-hub
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Encodes the static I2C address, manufacturer ID, and part/instance ID
> +      as defined by the I3C specification.
> +
> +  assigned-address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x1
> +    maximum: 0xff
> +    description:
> +      Dynamic I3C address to assign to this device.
> +
> +  dcr:

Where is the property defined?

Read carefully writing bindings doc and DTS101 slides. I finished review
here. You still did not implement things we asked - to follow other
bindings style.

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
