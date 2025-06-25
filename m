Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0E1C7EE31
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwHtc/wAg+NrYvrwcDjrNC37qKJuN2K7qh4sye4xuU8=; b=j/thpvADcSumHj
	CJ9CEHEDodhWQz6j3h5lVn4zTTL/lTyw6oFzpSEbUU33jWSXH0r/LaFmQLTLGBlFdaUHDXQAjsFTD
	xoJI1Q7mkcRUNCofkVGJvfEVOrv4pIc/EP9kp/q3HpIAAWG5z69GqKGmBZWDnOQfbdlEsfzmTsuu3
	+TFXkcnYq8OCI6Dtc5B5OinyEFeWvdzWfs5ew5TWYG5U3/ZUaSgm/GgHsU28Bp8epI29ItpbcPoz8
	KZYsB4UF8WTh6SrNMd3nV/EiFx1rVUnIK99fpy3pbDOG70CBoZ0WjuxdrFHPjZyPnGj9n2EYnDxnZ
	KBLMDWCkMlLBaKXFoDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpZ-00000009yiY-0fx9;
	Wed, 25 Jun 2025 21:38:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWOm-00000009oDL-11Ud
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 20:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3715760010;
	Wed, 25 Jun 2025 20:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FB3C4CEEA;
	Wed, 25 Jun 2025 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882030;
	bh=3nMq3/Hym2/YQbY6AJkgEG17d/VOkEQF9DjdSEWeZyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDeAAmM7YFLQOvDlRTxPOgr1KPTZLElt9jK0PkSZQcrL/JcgOkvDGOgmFCWlQohoB
	 xeC0L04ed8DvBzsaIY42FMQ8ETnfxfT7XFdTIa9haZi38NXpY/3FX93suJLMxN+0Qs
	 xnFuGuSmocj2UgqJmyRDi2McdVmr4sQVIp78a+I/zwn06bC7zvlwzNDq1ObNHVOECA
	 SlYQQGVTUYd78mbJUeKLQeiTA1E9TO77uwibbWPok7rgmHiu1ECjaDFx8De8VqRNGp
	 5CCGH+hHSho6h1H09zuHAry0LZm0r+HCoAo5mRKS/bXBWifAlxNjMIg71MgDQ8gyNr
	 KGKsKD47YH9pg==
Date: Wed, 25 Jun 2025 15:07:09 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <20250625200709.GA2125481-robh@kernel.org>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
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

On Wed, Jun 11, 2025 at 11:39:27AM +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Available in RZ/G3S and G3E SoCs. The G3S has 17 interrupts, the G3E 16
> with the "HDR exit" interrupt missing. This interrupt is put to the end
> of the list, so we can handle the difference using "minItems" instead of
> defining a separate interrupt list per SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Tommaso also did a version with two interrupt lists and using 'oneOf'. I
> prefer this version but maybe the other one is preferred upstream?
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> new file mode 100644
> index 000000000000..e6e6c57bb56c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas I3C Bus Interface
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a08g045-i3c # RZ/G3S
> +          - renesas,r9a09g047-i3c # RZ/G3E
> +      - const: renesas,i3c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Non-recoverable internal error interrupt
> +      - description: Normal transfer error interrupt
> +      - description: Normal transfer abort interrupt
> +      - description: Normal response status buffer full interrupt
> +      - description: Normal command buffer empty interrupt
> +      - description: Normal IBI status buffer full interrupt
> +      - description: Normal Rx data buffer full interrupt
> +      - description: Normal Tx data buffer empty interrupt
> +      - description: Normal receive status buffer full interrupt
> +      - description: START condition detection interrupt
> +      - description: STOP condition detection interrupt
> +      - description: Transmit end interrupt
> +      - description: NACK detection interrupt
> +      - description: Arbitration lost interrupt
> +      - description: Timeout detection interrupt
> +      - description: Wake-up condition detection interrupt
> +      - description: HDR Exit Pattern detection interrupt
> +    minItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: ierr
> +      - const: terr
> +      - const: abort
> +      - const: resp
> +      - const: cmd
> +      - const: ibi
> +      - const: rx
> +      - const: tx
> +      - const: rcv
> +      - const: st
> +      - const: sp
> +      - const: tend
> +      - const: nack
> +      - const: al
> +      - const: tmo
> +      - const: wu
> +      - const: exit
> +    minItems: 16
> +
> +  clocks:
> +    oneOf:
> +      - items:
> +          - description: APB bus clock
> +          - description: transfer clock
> +      - items:
> +          - description: APB bus clock
> +          - description: SFRs clock
> +          - description: transfer clock

It's a new binding, why don't you put SFRs clock last and simplify the 
schema?

> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: pclk
> +          - const: tclk
> +      - items:
> +          - const: pclk
> +          - const: pclkrw
> +          - const: tclk

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
