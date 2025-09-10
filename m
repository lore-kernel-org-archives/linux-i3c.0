Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EF8CA0FED
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Sep 2025 01:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bia7MGBvrs8EeHXx32QjIKyJ0fNEBf65z6vACVvMNeQ=; b=H/l/JiU0HQh1ZU
	q+r7tso1ju4AvYNxf76JrgBdmzfpYhgM3hjIrxv+xlqSC1BZt+yCFStyK0TxduONauHGvC8Q4BOpl
	N0zC2h2nt5nrHKg+ZLQVEytC6j/67J1aThb2mHoUClszOij0gbrR7Z6xOxCme9Rspk5vmajxrpohJ
	xtXPOREgL3N+fGYvQUsaAImapmrIujqtjVw8IEwZ9zQ497+GS9vKdfAUXjD9x7YFHFSwuW895o6HE
	k/kR6d8G+F8NYajydDR7oF1zcopiCQCShb8Hob3uuPfa56Y6WlQZ9/3Dm4iCQ2FMcBis3+Kx+Jxrw
	pdvRlHDip7Tdtvykvj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9cG-0000000BOiq-28dc;
	Wed, 10 Sep 2025 01:27:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9cD-0000000BOgc-2T10
	for linux-i3c@lists.infradead.org;
	Wed, 10 Sep 2025 01:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0525D44159;
	Wed, 10 Sep 2025 01:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECF7C4CEF4;
	Wed, 10 Sep 2025 01:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757467636;
	bh=NRt740wDewvEnDlLdECaG6cLn7kaZWZqxGlfu2JNWsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/p4zt+9Uw2DL4OMJy1/XVbuSqelY/71VrvHceoS/1wEaVqHHCD+ZmSjt49rc8Ogc
	 Kewg8NznvyUjJPrJ6xvSwqS50JKJAqofD0DX6cUVFycs1vLwQ8NFV/2dBDFYHkhcrM
	 x07qultJGHaugcJLAOgBZOhbFLImWe95uUEG9FSBHJ0vxsDm5YrmunclJtWPvWpMM3
	 1CBUgAQjH+0vXspTD2O6d2hSAS+tXxnYd5I2Mbe/MrAfwzphOwQSmFAPD+IjLW1LSs
	 +fXZ6J8Rr4bwJUR4Zd8HHRhh68Ga1Zeo99S9wM9FXCIkeLg5wU00hhJ76sPGfgL9In
	 Jh5O7DU3QdnHA==
Date: Tue, 9 Sep 2025 20:27:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and
 RZ/V2N support
Message-ID: <175746763548.3566130.10675698517636127630.robh@kernel.org>
References: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_182717_645764_C20A04F0 
X-CRM114-Status: GOOD (  14.76  )
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


On Mon, 08 Sep 2025 10:39:30 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
> 
> Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
> "renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Update the title to be more generic as it now covers multiple SoC
> families beyond just RZ/G3S and RZ/G3E.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
> - Updated title to be more generic.
> - Updated commit message to reflect changes.
> - Added Reviewed-by tag.
> ---
>  .../devicetree/bindings/i3c/renesas,i3c.yaml     | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
