Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E4CE94625
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Feb 2026 02:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UHQDEpiffp7SFIp0Uw7RcG0k5FXMjafJyOVktFZbDs=; b=c/lBwYUkMAaKB8
	vZAXp/uaqBENqEvANbuDmRSzFt2BxtoT8kmlQOiQa56SOcBIB8DQfDLV+PYzTfECD8lKigoHWdBTc
	xDWdzyTxx6CctbftB0wafVSKC61vJM5iMiAj+5vbe7wjJwNBnzoUQSSxz41zYc48scFbd5GzfwWcL
	KgEA5ZNUJTCAxGZ3E8QYQj5aS4oK25M0av3PF+vLfS9R9QmpQI3BJjkx2l9ry4DfVDC682T8LJM+O
	qIZJmrplnsWURMUtRKEQZjyEYlEtG5sX5r2PbSnLqjFwHlIWzxGgPSQd3OteCaUUduUYWCZBHyCzU
	3w1dBCWMtopSW1BxtMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdZe-0000000GKkK-3WMm;
	Tue, 10 Feb 2026 02:33:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdZd-0000000GKkB-0JIl
	for linux-i3c@lists.infradead.org;
	Tue, 10 Feb 2026 02:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E07060008;
	Tue, 10 Feb 2026 02:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B91CC116C6;
	Tue, 10 Feb 2026 02:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770690835;
	bh=syuWAARA9iMh+dVzeM0HvjnT9Pn+uWfXe2/ZwAPb0lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l14SjJWzLh5T6b6liwE7ujFsCjhFE5DX34l6qLa55FV8bu+czERFYBlgI13vg3KiG
	 t9OpZGsPqGgb/Q7VYxcXUOZBg2Z6IFQhNhRPhoUqq8IdR7zXduCRUPUu0wwAYLg1f1
	 2xAmMbQnnaKjz1B3OPQzszTOj2c6+xm3C4yheudms6lV6w83fq4gMhgd7NuRxKhdaN
	 Fa4Zok/+BUyQIeWohwT3j51cf0JDSdcOU3KAUBf7usUvkUNlgIluVBXTQXfezKRk0K
	 EY6WDGmlQuDyOVI/InRUVfffCamCgJ1Xt1hLvrW9LvXj18+nukmX9TV83xZv0cg715
	 5b6r8ECfUwG7w==
Date: Mon, 9 Feb 2026 20:33:54 -0600
From: Rob Herring <robh@kernel.org>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v5 2/5] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <20260210023354.GA2357771-robh@kernel.org>
References: <20260206120121.856471-1-aman.kumarpandey@nxp.com>
 <20260206120121.856471-2-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206120121.856471-2-aman.kumarpandey@nxp.com>
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

On Fri, Feb 06, 2026 at 02:01:18PM +0200, Aman Kumar Pandey wrote:
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> 
> ---
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
> index 000000000000..edc1f988c0d5
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
> +  tp0145-pullup-ohms:

Needs vendor prefix. And on the rest of the -ohms properties.


> +    description:
> +      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  tp2367-pullup-ohms:
> +    description:
> +      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  cp0-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 0, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  cp1-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 1, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  tp0145-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for target port 0/1/4/5, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  tp2367-io-strength-ohms:
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
> +      LDO_CP0:

Lowercase and use '-' rather than '_'.

> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      LDO_CP1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      LDO_TPG0:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      LDO_TPG1:
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
> +        maxItems: 1

maximum: 7

Instead of maxItems.

> +
> +      pullup-enable:
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
> +        maxItems: 1

maximum: 7

> +
> +      pullup-enable:
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
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            assigned-address = <0x50>;
> +
> +            tp0145-pullup-ohm = <1000>;
> +            tp2367-pullup-ohm = <1000>;
> +            cp0-io-strength-ohm = <50>;
> +            cp1-io-strength-ohm = <50>;
> +            tp0145-io-strength-ohm = <50>;
> +            tp2367-io-strength-ohm = <50>;
> +            vcc3-supply = <&reg_tpg0>;
> +            vcc4-supply = <&reg_tpg1>;
> +
> +            regulators {
> +                reg_cp0: LDO_CP0 {
> +                    regulator-name = "ldo_cp0";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_cp1: LDO_CP1 {
> +                    regulator-name = "ldo_cp1";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_tpg0: LDO_TPG0 {
> +                    regulator-name = "ldo_tpg0";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_tpg1: LDO_TPG1 {
> +                    regulator-name = "ldo_tpg1";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +            };
> +
> +            smbus@0 {
> +                reg = <0x0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                pullup-enable;
> +            };
> +
> +            i2c@1 {
> +                reg = <0x1>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                pullup-enable;
> +            };
> +
> +            i3c@2 {
> +                reg = <0x2>;
> +                #address-cells = <3>;
> +                #size-cells = <0>;
> +                pullup-enable;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..7e1a6cb22ca3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18906,6 +18906,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/ptp/nxp,ptp-netc.yaml
>  F:	drivers/ptp/ptp_netc.c
>  
> +NXP P3H2X4X I3C-HUB DRIVER
> +M:	Vikash Bansal <vikash.bansal@nxp.com>
> +M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +L:	linux-kernel@vger.kernel.org
> +L:	linux-i3c-owner@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
>  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
>  S:	Maintained
> -- 
> 2.25.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
