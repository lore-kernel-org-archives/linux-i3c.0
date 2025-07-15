Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C098EC83F17
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jul 2025 04:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tw0fIOcnOUTGwdum02F0+tuVFTCXyQtnRq+Ki8UVpz8=; b=zCDEItnBsxZPoX
	R0qZ2s+9gpjfSnsJ44i1II9dWnPZjYoFBEezhinC9Qp6t+Wfjb4eHnqb1HT9wzyuScHHmK+iNeYoJ
	v4hj8re2hO4qfXthb9lnqETbQrHcbR5Yx2IeyGGe6RtCA715rcJRe9O1jhmWhaQPJwLlLnTJ9168A
	jgc3s9ApmI/AfMUKQG9tOVr5UTA7b5XNXnn8TImDcMiG4rFw7RpnwMmTFMtYhyjlD8GO9aKH0Ipeh
	EncflVmi7JhAHtLaG8kZZFRff6MNGkqCh3y5uahSwM3iMiIbxflrIUv4k8sTp/s9ORt5fO5Ad81KC
	B+IuULov283a+KuHt88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXHQ-000000040QE-1pwW;
	Tue, 15 Jul 2025 04:28:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWax-00000003vfn-1BvI
	for linux-i3c@lists.infradead.org;
	Tue, 15 Jul 2025 03:44:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90926A4B625;
	Tue, 15 Jul 2025 03:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AF3C4CEE3;
	Tue, 15 Jul 2025 03:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752551082;
	bh=SFnlblJV2LTPacCzanOSpqW7BNUpkXOMLqiq6h/Tr+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVstyHr0A/GqQRMJSqyegZGPttVsjfqUJiBDWLK9rvS3UARWL8B+pXBkJLlOLvWlS
	 Bwcf4FlO6VQc9Gp3dVqyIGJqdJ/intvsZEU4lb/icCbzM9Z2zDExBnOhuS0SKUsf/N
	 yPgzniuRGuapfxssvWNOXXgPDRbFBK8Qy+6sMSejNbeLA5G+ymprNJ7rDlfMlvtGal
	 mn1N62Hu3QFdatFBqwjN7EMhZ8xvTuSNWuMExc6zWF+EvYWB2a4YJ0BhpHU/6Yjql3
	 NfKIiTMGKYRemglEGFAU4S9lQeRQu0lfE+Au17ECShs6Bk5GQBkUKCUsNvE+F0RRxB
	 xrJfDZgTqmDaA==
Date: Mon, 14 Jul 2025 22:44:41 -0500
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
Subject: Re: [PATCH 1/2] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <20250715034441.GA4186417-robh@kernel.org>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
 <20250714091211.20497-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714091211.20497-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_204443_385273_08929B29 
X-CRM114-Status: GOOD (  16.27  )
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

On Mon, Jul 14, 2025 at 11:12:08AM +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Available in R9A08G045 (RZ/G3S), R9A09G047 (RZ/G3E) SoCs.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since RFC:
> * resorted the clks, so G3S can only have the first two while G3E needs
>     needs all three
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 180 ++++++++++++++++++
>  1 file changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> new file mode 100644
> index 000000000000..f53a176cad2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -0,0 +1,180 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
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

You already have to have differences between these 2. So how are they 
the same and compatible with this:

> +      - const: renesas,i3c

Even without a difference, this seems like it will be short lived for 
how many SoC will be compatible with it (though we get to keep it 
forever). 

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
