Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBF7C7115B
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Jun 2025 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGuldVLTbJE7tf5QvaQ6fTgHQiC8hODAs4L3cudyAVg=; b=Xw6yoU7tV+WYDS
	jfakIsjz3LiayzbV9ZDA4TWhC2LfHwQESXMy3EggIcOlfqqt0T8QlW95WDVRVOV90CiKU420zLK/P
	NYY48E6lgoMAAK3vN1Vk7+1L5k5nvJc9eClF7KOzmpebU6dEpwn+e1a2x5NybmkPAAUi2+DrZZ+kn
	x94eVMCDM8jHWXUBEdeulniXUh/xHdFRwK8ZxCtC8pLd8mUxEP+rHwSMsTRVztmU+tImYdU7wSkPe
	TTGDWCVYHzq9I2Fpxb4vMykiH9rArGqJ6PsYUe0r9cC54bbPQG88HpzcJrB4hzCxZpVgfD6AMmAEW
	8N13CC7Mcli5jbgeBsbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRp1A-00000009ZWy-14yx;
	Wed, 18 Jun 2025 09:23:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoz0-00000009Z0g-0thL
	for linux-i3c@lists.infradead.org;
	Wed, 18 Jun 2025 09:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BAB85C54B1;
	Wed, 18 Jun 2025 09:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6A4C4CEE7;
	Wed, 18 Jun 2025 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750238485;
	bh=zTcgqaF/0GYo093jxGYoUNjPlooySG9s1mcys1CjAgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNIDpUmRpDhMC9ZpBZgtGiBHCtsLuJY4/1tDc2RdaP4LB/xjSyo6FujuGhdh5k2pP
	 320klkimYNBwl1qgomVOldkyRQV8s1SaokJpa9hF5puefEoEAAdpIddnMZ3f3vz8hR
	 eohaYoY3bpK3ft1qO8ti2fYhOPR/CQRJDU2D+gjcxhp0x2U6wTQcZXRb+PuD3Q4V44
	 1TpAFxpbkyGyZpwRV1dZEyotbs8T6S5mDqRZR9UKLVkvbz+Du5kUtg7T4+0kG+6/mU
	 6KDkd/+MwEydodNjkubO4nvvLGV+Zw0rbNC9MvGwAJrq2Cu9kMQzBgA8po9MeXCOGk
	 vjKxXAFRzDz8Q==
Date: Wed, 18 Jun 2025 11:21:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gastmaier@gmail.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250618-visionary-hawk-of-success-d4aab8@kuoka>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_022126_354299_BEDBB782 
X-CRM114-Status: GOOD (  15.22  )
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

On Wed, Jun 18, 2025 at 09:16:43AM GMT, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.

Here you put outcome of previous questions - why such compatible was
chosen, that hardware is this and that.

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml

Filename based on the compatible, so adi,i3c-master-1.00.a.yaml

> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices I3C Controller
> +
> +description: |
> +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> +  implementing a subset of the I3C-basic specification.
> +
> +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> +
> +maintainers:
> +  - Jorge Marques <jorge.marques@analog.com>
> +
> +properties:
> +  compatible:
> +    const: adi,i3c-master-1.00.a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Why?

> +    items:
> +      - description: The AXI interconnect clock.
> +      - description: The I3C controller clock.
> +
> +  clock-names:

Not synced with clocks.

> +    items:
> +      - const: axi
> +      - const: i3c
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
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c@44a00000 {
> +        compatible = "adi,i3c-master";
> +        reg = <0x44a00000 0x1000>;
> +        interrupts = <0 56 4>;

Use proper defines.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
