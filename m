Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B612FD2D9D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 06:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2hWMs3HZZ+M54+EtXNVYjC11OmPnAZYfOUdm+xzG+Q=; b=b5dJzDCmT+ytrr
	/RMhSmyEKkZNcXF03PKlyPAjL6fEj1q0kusgatSz8ZhBK5U4GzLJwPwlRjF+teV6/kVBUraVHMqcp
	YL03/E+gdjFIilRcYrB8Wdn28lCLcseSyT4Tu27oOKHzxXar0tCMwCgP19iD7OgoDdYgNeyM5K5ge
	URkL44CHhq7ZRpf+1ranj0Se7RN2PQbXotgl39+I4Quwoyzps/YbePZVFiPI9D7XZSyipRMs6Bf7n
	NWaJ5zw0wGWxJqBBUTr9XiMfY4pOzkg4NO6Xtn0yxYz/M1a8wksi/Q3ADnIpVI3lzBFK8fXjIjAkw
	akEw3kQY7j6zNoy5sUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CpR-0000000Atlr-228S;
	Wed, 11 Mar 2026 06:13:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CpO-0000000Atl6-3SKj
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 06:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25DB342AB8;
	Wed, 11 Mar 2026 06:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C6DC4CEF7;
	Wed, 11 Mar 2026 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773209634;
	bh=5Pjyj7qk26e2UZMRGFZd5jRSfl4UY2EVDMukmfLCbls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JACoQvodn5gPHNCS3B2qSkHw+zfWYKoOljAIkZQLh4GsdPkaYViOYujlu/zbKzIzo
	 TFsbgJHU/1TlE4qnuWAQWnmiJtpQ75DYclC5MaJCtkOwp8HjWcqyFKBM9IIkqZ2++g
	 OMbukG/8rh6Qt2xijo8/YHRUKFxnCKRlyMmM3PuJmEB6F4HK4gYeO0SwfkpL6StiWw
	 Yqwq4GqMzqLEjrDM2A9JistKOrqBxHwgMaVoQTl1nybcUjvmmlE8hBeCW9VMwgPYuj
	 SkyED2pGN9FVpfu7CSLaqjjpwpiGYfDXGHpmSsMMpKlIrW+wEFsvxXhWOYtNhu7oNr
	 Efa9idbayrQiw==
Date: Wed, 11 Mar 2026 07:13:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, Frank.Li@nxp.com, 
	lgirdwood@gmail.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <20260311-outrageous-unnatural-jerboa-53f5a8@quoll>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-3-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-3-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_231354_907242_3D3E493D 
X-CRM114-Status: GOOD (  20.29  )
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

On Tue, Mar 10, 2026 at 12:27:23PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
> Changes in v6:
>  - Use a vendor prefix for the attributes

Where is cover letter with links to previous versions?

> 
> Changes in v5:
>  - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
>    tp0145-ldo-microvolt, tp2367-ldo-microvolt
>  - Changed supply entries and its descriptions
> 
> Changes in v4:
>  - Fixed DT binding check warning
>  - Removed SW properties: ibi-enable, local-dev, and always-enable
> 
> Changes in v3:
>  - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
>  - Added Regulator supply node
> 
> Changes in v2:
>  - Fixed DT binding check warning
>  - Revised logic for parsing DTS nodes
> ---
> ---
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 209 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 000000000000..e592952e8164
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> @@ -0,0 +1,209 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP P3H2X4X I3C HUB
> +
> +maintainers:
> +  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +  - Vikash Bansal <vikash.bansal@nxp.com>
> +
> +description: |
> +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> +  hub devices that connect to:-
> +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
> +     peripheral devices on the downstream  side.
> +  2. Have two Controller Ports which can support either
> +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect to
> +     peripherals.
> +
> +allOf:
> +  - $ref: /schemas/i3c/i3c.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,p3h2840
> +
> +  nxp,tp0145-pullup-ohms:
> +    description:
> +      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  nxp,tp2367-pullup-ohms:
> +    description:
> +      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  nxp,cp0-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 0, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,cp1-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 1, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,tp0145-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for target port 0/1/4/5, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,tp2367-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for target port 2/3/6/7, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  vcc1-supply:
> +    description: Controller port 0 power supply.
> +
> +  vcc2-supply:
> +    description: Controller port 1 power supply.
> +
> +  vcc3-supply:
> +    description: Target port 0/1/4/5 power supply.
> +
> +  vcc4-supply:
> +    description: Target port 2/3/6/7 power supply.
> +
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      ldo-cp0:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-cp1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-tpg0:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-tpg1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    $ref: /schemas/i3c/i3c.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +
> +      nxp,pullup-enable:
> +        type: boolean
> +        description:
> +          Enables the on-die pull-up for Target Port.
> +
> +  "^(i2c|smbus)@[0-7]$":
> +    type: object
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +
> +      nxp,pullup-enable:
> +        type: boolean
> +        description:
> +          Enables the on-die pull-up for Target Port.
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c {
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +
> +        hub@70,236153000c2 {
> +            reg = <0x70 0x236 0x3000c2>;

Where is the compatible?

So this wasn't checked/tested. Try yourself, remove required properties
and see if there is an error. No error, right?

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
