Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29790D58CB0
	for <linux-i3c@archiver.kernel.org>; Sun, 22 Mar 2026 23:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCGDydAdzfi9KM2NPCR5zOZ4cn84RMtYVeIxGfq6cr4=; b=Lr4Bhsn5h52mIq
	xMKTegnZVE8iHes8d5Bj7nQls/WCT5wtCo7XxR/p6dS8z+D7FOr1gHxqAjrXlvlGNwhHg90sj5OJf
	wElXPxnt3ki7fHDLyJiMOil35W/EH+WiSz1tMrojbb4MJ3lMVHbdl/Pqz0i7+FtnFaQAaaP1GwdG4
	VfUKSSP2z5vfmmP6oUh+mDmvMfOjTz+mwjPw91cvAqqSUz/t3hGqGZ1/NqE4zO/p9lmVH0IZAax/+
	0QH9Fif0lZk6tcn1zNjXRwE4w3BwnOe5dyXbQqtvDEKz9nz3mN+/FEdNdb92gmQCjwSF0yfkxmZPB
	aGulVuzsaF7rDqwruHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4SKD-0000000FlBb-3pAK;
	Sun, 22 Mar 2026 23:35:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4SKB-0000000FlBF-0zOZ
	for linux-i3c@lists.infradead.org;
	Sun, 22 Mar 2026 23:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D992542E11;
	Sun, 22 Mar 2026 23:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89799C19424;
	Sun, 22 Mar 2026 23:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774222512;
	bh=Ri2XO0FRCm/AQC69Y7/yiRkrFDypS4Sf3lBTGwO2Cj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJjTBDiIGGTwBzFDT8QcTO/uzsuyg57sVwapN1/YeViEMULkUxLrBsq7pLiMNaukZ
	 VInPeSdsAFQTF02mgA2VnOqFkf6ON6Z9ZV+t9ytZfMTRPvUuS8fIDvzdyuULSKfQKQ
	 No0nUXY0ECd3hep+YmAllEOrKFrGnNudYFWZHNBre6BbI4SvlIqhwxR5s25vAMC+HC
	 UIGf/NYPOgDkcSI+W9Xul0eazjllV7WI06pMicNKeNzJM9y2kLuhO25Bf6PbGSFoIQ
	 Vna2pgjqKoxPZEyrXb9Py6FSbgv8s2yw85qiuGx/JHByxszJ219VifR8VIeKNCsVA/
	 KqhtR41+0ZJww==
Date: Sun, 22 Mar 2026 18:35:11 -0500
From: Rob Herring <robh@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v7 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <20260322233511.GA72130-robh@kernel.org>
References: <20260319112441.3888957-1-lakshay.piplani@nxp.com>
 <20260319112441.3888957-4-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319112441.3888957-4-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_163515_340452_6D96CE92 
X-CRM114-Status: GOOD (  20.15  )
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

On Thu, Mar 19, 2026 at 04:54:37PM +0530, Lakshay Piplani wrote:
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
> Changes in v7:
>  - Fix schema validation issues
>  - Adjust required properties
>  - Add I2C example
> 
> Changes in v6:
>  - Use a vendor prefix for the attributes
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
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 303 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 311 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 000000000000..495e0e4c1ae1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> @@ -0,0 +1,303 @@
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
> +properties:
> +  compatible:
> +    const: nxp,p3h2840
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  assigned-address:
> +    maximum: 0x7f
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
> +required:
> +  - reg
> +
> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +
> +      '#address-cells':
> +        const: 3
> +
> +      '#size-cells':
> +        const: 0
> +
> +      nxp,pullup-enable:
> +        type: boolean
> +        description:
> +          Enables the on-die pull-up for Target Port.
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +  "^(i2c|smbus)@[0-7]$":
> +    type: object
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      nxp,pullup-enable:
> +        type: boolean
> +        description:
> +          Enables the on-die pull-up for Target Port.
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
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

Once again, you must have a compatible. "The device is discoverable" is 
not an argument. If it is discoverable, then don't put the device in DT 
in the first place.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
