Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC8FCA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+1SjgyV/aCR/Rhdnglh6vueyBqxHL45+EpWCUl5+aQ=; b=KJVpzrWpLGRbDR
	t5f/IJ6+8DFAKSms/E3fcH/djG1y8nBuIGyw9sp5X2xwOmKEe3MIebj5bPTj1GvvoL1Q3jCz9E+CO
	+3VpaeIsIF4VOmuiMCkHBNjWezwbFhws8fbcCGX3KqRaUgoWPKtXYq5UookG+HKxlgBR3If8xRkZR
	nY5WMbTIRVs5jYGiqimfaRTzp7tj9XXS5xSK+T2bX9HgHp1wHYCdSk+O8e9kOHmCFAt8P10efFWon
	nrsP8ns1FjCNp3YCTNfIqW1ChVQSC7gt8BkMr9vvhDEMyeQWhTCBBl0NdKKSqFaoJygDQmCPZxzZJ
	soGJAyc7c2b/lVPRODWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtjS-00000002CJ6-1tq2;
	Sun, 14 Sep 2025 20:53:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtjP-00000002CI7-1gal
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:53:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAF5A4E40BD1;
	Sun, 14 Sep 2025 20:53:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEB056063F;
	Sun, 14 Sep 2025 20:53:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 694A4102F2A7F;
	Sun, 14 Sep 2025 22:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757883233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7xQaSzl/TxXQwIRozChDy9Tm+5Lzv6IuUtQ4mWGkAgY=;
	b=QeyRXE6GcF8lBbDkyGWh9+amy8cLIw7ntDBnRdyEXuiNgbP/aYoh6ADxf6vNCPzUiLbz0F
	pqaiy+sbbdG2o9oKZktxDx1dDI4uxN0/sBFrVxSnvD83SBEysQ0avybyiKOjr5sYTE9tPe
	b/1oKLTWKDHonJo0H/Wd3K/QCeRRn/80eSjNCN5V1/Kd0F2XnNaWyabckJAKCr6WVPxrpa
	sUKz/kGVXdZ683iF5BVJ14YiLuBUNjUEmCYxgNMh9spHX+pvpKCxk8MOB+iMMJF08n7oEw
	HybkFAX8QwxSbaRFsKk6frbQdI0zK8I0ijJ3jv9xtp6ONwqVKKvRmp8aYnVPcw==
Date: Sun, 14 Sep 2025 22:53:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and
 RZ/V2N support
Message-ID: <175788312845.382502.12492963502213477306.b4-ty@bootlin.com>
References: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_135355_573267_1DB86983 
X-CRM114-Status: UNSURE (   8.40  )
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

On Mon, 08 Sep 2025 10:39:30 +0100, Prabhakar wrote:
> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
> 
> Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
> "renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
      https://git.kernel.org/i3c/c/12ba31828681

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
