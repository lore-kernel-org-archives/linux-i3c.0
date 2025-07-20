Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677F8C83F22
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Jul 2025 23:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRrf6C7pGbO38D7/5MDLFCTQfkn6ISucz8o+PIUvLeQ=; b=DSsOMbShTPb60k
	9PaL80XcgXANB6LrnZnOR14NPzreo0FH+PUo52cb8NTB4Tj97zU8sBeDpn86oiUVrF+lSa1fnFxjG
	zcY26N8O5rg4uuSIzldbRdLjyQY/lXevoeADGjOA32RTjqbRzj6DyoECW6k6ldcNnpt0D3gN5qY7U
	qd7x9Z/pNksj9ig/Ru1RbPEmTYfM7X2gaXM60aq5FHhNtQoMshNaFsClILCBDiuxyLNR8576yOG2G
	0Br+dyKFV4PMPtabGrBHpleB2ccTwlobQOCWtY3dSCBeGxD83QfkfUi4iQOK0MvFWRtTF7xeX+cVE
	MnwjvGXWLLKw6FOaUkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddYU-0000000Fptp-0evl;
	Sun, 20 Jul 2025 23:34:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddVW-0000000FpiH-3oaA
	for linux-i3c@lists.infradead.org;
	Sun, 20 Jul 2025 23:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40EFA5C44A1;
	Sun, 20 Jul 2025 23:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE4DC4CEE7;
	Sun, 20 Jul 2025 23:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054308;
	bh=+hYXnYULbaJgyUVTwYKqdlYBEBB9051Tt0CMsxT1e0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8ihaHbgNN9lXZH7oAR2RgEGYmqoSVX3Qcoqs2HU4/POKDKcyNb59UA8n39d/s0DN
	 CQkJ6H5j6Cb4zzXcNsL44hbJJWPD4SPsJ04kLRzmo9Y7nRL5itqTbgeztkzshk+LX4
	 dpjX9bXLtqv5L9O4XZYTpmU61vtilpb/W3QbWbm8HHuNvLWRthD8PNManMLnlL1It0
	 oPKCcFYjFglIdSw4+vSEtXLrvt43zzQ4wmYSgmaD03q/nOjw3BCd4qOJiBeL1a2vVd
	 Ma9L6didwjxro5jX/cJi17WqB2ltPGFopYv1HDOMBHQ+/dx7UP0lSdkGdKel7JfBo1
	 XDKiBU+GQeTXg==
Date: Sun, 20 Jul 2025 18:31:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <175305429252.3069370.16176862151205935873.robh@kernel.org>
References: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
 <20250717122455.9521-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717122455.9521-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_163150_990981_9E385F3C 
X-CRM114-Status: UNSURE (   8.61  )
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


On Thu, 17 Jul 2025 14:24:52 +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Available in R9A08G045, R9A09G047 SoCs.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * removed useless generic "renesas,i3c" compatible
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
