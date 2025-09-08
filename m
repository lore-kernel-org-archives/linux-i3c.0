Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2EFCAC588
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g59NTsT0pNoCGeC+YkF1T1iHqAdONm/jTc51t3ck3Vg=; b=uksdvWYLgwSzUQ
	Yde87MJOyh+8Yuy9+cnDotj1GLr9vrvzWSKLc6VYR9pCtrh77tRX4f5LVQjQhm956QCNCqFDGutlQ
	j6Z9onbiMd73M2SdJ/C9gEbK/Z1+uyOXSwuC+2k5uOnsJolK9dZ2DHGEugD+KMk4RXUcy35V/IIjR
	y1fRjMw5Rpycicn5NXQaYCOk61sza+ZGic6fWaIp53nz4wuXpjITubfpmkU3NpmL+Llbb5mlmxlRW
	RDuZmElEQsbZtzdPMV/xsbqjsbiUNvNyO5JtS6C1ktg11cYxW0GqONmoVRVuJkOIZKZUQY4nxBF0c
	UbmoZK81P32EjIrV0MFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabe-0000000GqAi-1Zrr;
	Mon, 08 Sep 2025 12:04:22 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYO5-0000000G72Q-3fYP
	for linux-i3c@lists.infradead.org;
	Mon, 08 Sep 2025 09:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W2is
	/B86XOzKSq4WSKL4Bv/G+KLrAqqioep1TTWBCXU=; b=PkcdiBC01IbDmXEoUIWt
	7wbjjEaPM3YICYaPuexAWAM/AsgzOJzSN8OraOH1otDoImid2phVc3+QeJgU7FZi
	GiAR1X6IPQUUiHsWFnljx65mJdmCKyq/tU5bDR7OweIseEv8na0ZaiPkZDbA9tew
	D7C2R12+W3eAHAsFQuLlQQtWT5hYscMWAIRad+BB6eAQ5ZZtqEImhtkDCF7HkHwX
	uY60ptxtJgGqRlasnlxrvt6vsxF4lkgPCTaMITB/4YxrKCrwztCyaqm/fIhgERPR
	P3gpafLQpXJJebX552ZMrfooksMXIx8GhiUqYbKPY3z8+qxVTgfUjYf0AzKfURbv
	Ow==
Received: (qmail 780016 invoked from network); 8 Sep 2025 11:42:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Sep 2025 11:42:08 +0200
X-UD-Smtp-Session: l3s3148p1@1fI+AEc+ls0gAwDPXyerAKQ7QDbxBzog
Date: Mon, 8 Sep 2025 11:42:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and
 RZ/V2N support
Message-ID: <aL6k73TBfBcrW2J9@shikoro>
References: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_024214_791129_159E5A03 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Sep 08, 2025 at 10:39:30AM +0100, Prabhakar wrote:
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

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
