Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0A606A321
	for <linux-i3c@archiver.kernel.org>; Wed, 28 Oct 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAc3aTN6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQAtIssq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z+no2jYdt9aTNTzfLmttr3RQM6WuEvJrgdUWsVaRdEY=; b=gAc3aTN6S7cAa0ldwOqnqDHX/1
	3SKILx8s4J/WEABLU3jzDp0P2fr5RQDdImizN1J4xEcnS2iQFHQEAZEviRaGNpl8O58t7Lids4oc2
	q3p0rk3JRxCz4yl3GPH4SG+fhoYm2obiNLlgb3JYeG9RFxFYcs1VdMuQxvhIPFEhf4VHtvpOjMGZ9
	Ko92qaC7iCUi0v252+DXJtt9VGlCjnY3uJZcMhe/J6CgIKY4+eRJMt+UB9+e5JMocmkfT66sJJxIF
	/x3RTg/XKHlsW6wjqFuCMyeP65QdX3NV3KP0CXlT8adItv7/y+sqoZ5xoT4zUEeTl6m5iAn3kCn3o
	iCM0as0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1rX-00000006rfE-2VAV;
	Wed, 28 Oct 2026 11:30:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1rW-00000006rf8-22J8
	for linux-i3c@lists.infradead.org;
	Wed, 28 Oct 2026 11:30:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CBA2600DA;
	Wed, 28 Oct 2026 11:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814231F01828;
	Wed, 28 Oct 2026 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793187033;
	bh=nK4wxJlF1X3a08zXOdP0lWerEzc2FL4X4MzbdiQi0B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DQAtIssqPLSYUwXo8Ja4LvMO2QBS6lM0CVubOc2fgVe0DYA6540L8UjP+/LUMOYxC
	 d9f0s95LUqMcD8UJrMoh08bgrL3biChIoMrCb/9AvOJOoqgwNMaFXH0K0JWB8J9nN/
	 9DNYr2n1eyq5ID1zEFK2+gh3ryw23/7RNNArffdKb8Og/0+RJXdC3NawUd90Bq/rus
	 GvZKRtclUuDHvSIBNr2T/8yIqhXwccXt8gG8w0i9DmFUOg5QaaJqvxuuCzDPIrU+cp
	 1D6LRjYJwrFrLsFOj7EPCBqTp0BW0vREj9HtWOBZNQ67ccb1hHuKOcVJQLWdLDsMJx
	 iAI9O3rbZIALg==
Date: Wed, 28 Oct 2026 12:30:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
Message-ID: <20261028-ecstatic-fluffy-lizard-9a5da6@quoll>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-3-2e76b87209bb@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-3-2e76b87209bb@renesas.com>
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:35:46AM +0000, Diogo Ivo wrote:
> Add device tree binding support for I3C on the Renesas RZ/G3L
> (R9A08G046) SoC.
> 
> The I3C IP on the RZ/G3L is a subset of the one on the RZ/G3S, as the
> RZ/G3L has no HDR Exit Pattern detection interrupt. The resources are
> consumed by name (the tclk clock, the presetn and tresetn resets and
> seven of the named interrupts), all of which the RZ/G3L provides, so
> software can match and bind a RZ/G3L node through the RZ/G3S
> compatible. Add the RZ/G3L-specific "renesas,r9a08g046-i3c" compatible
> with a fallback to the RZ/G3S "renesas,r9a08g045-i3c" compatible.
> 
> The RZ/G3L is not compatible with the RZ/G3E, which has no input analog
> filters and supports high-speed mode (up to 3.4 Mbps).
> 
> Split the clock and interrupt constraints into separate if/else blocks
> so that RZ/G3L nodes inherit the 2-clock limit from the RZ/G3S fallback
> while being constrained to 16 interrupts alongside the RZ/G3E.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
> - Describe the RZ/G3L by a SoC-specific compatible with a fallback to
>   the renesas,r9a08g045-i3c compatible of the RZ/G3S, instead of a
>   plain compatible, and drop the corresponding driver patch.
> - Split the clock and interrupt constraints into separate if/else
>   blocks to handle the RZ/G3S fallback on RZ/G3L nodes.
> - Explain in the commit message why the RZ/G3L is not made compatible
>   with the RZ/G3E.
> ---
>  .../devicetree/bindings/i3c/renesas,i3c.yaml       | 27 ++++++++++++++--------
>  1 file changed, 18 insertions(+), 9 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
