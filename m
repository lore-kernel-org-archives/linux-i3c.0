Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF3606A335
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJwkbe2g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exKS5AOW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sHc0uq0my+IXhoPLt+j2LDtROU5EzEAYjCd4gIAg+IY=; b=aJwkbe2gLQ8MxUFFxnBM9dQa0K
	3a9f1x72q9UnF7XiNTG//CjAfnPA2ZJS0JX1FX+iG1ncmeKqI1xgLatC2IQnvGeJXfd5hgRFrsnP5
	O75s5Wr3z3r2GvfV6WpKVd2/lVIPWY3+o/KF7OBcqUVPmuJ6nj3DPD0iqnOhVU90pxFvjl43/7TQM
	W11i4+aBKBAIalv7Z7vz31M0+3++Rw71jyBxep0ozqgZkRkZ8iXGFWd+PF5Uct5LxCsMywwN2VqH7
	96Lq3BicD2nUtzFkX25C+hyCFaJxmigkKGvr0gZl1Yc4qj6E6gIchjVUnvq5O69Aq6T0KhCkujPpa
	EuF9IPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBRw-0000000DeFc-1ewI;
	Thu, 19 Nov 2026 23:21:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBRv-0000000DeFO-2SzX;
	Thu, 19 Nov 2026 23:21:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B2EA61107;
	Thu, 19 Nov 2026 23:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1B31F000C4;
	Thu, 19 Nov 2026 23:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130510;
	bh=EGAR8AwNfaaNnY+c/wiFpYuTC+Sl5mX+8pWJKXAFaeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=exKS5AOWd6cAQi3uKf0M74CRJzeUBwGdpYRoTjlYR7fTPEjOcGC4rXhLCfilnGMOj
	 GbyKnhzg6qW78qHFLa4/ixUSdp5vLI4GUzXd6MiavClaZjFKuf467oG9sF3G3l0hlY
	 CBhaIimtghJ0QNny8wVb/xbPZmBcPbRbG+h4P5/CGhM7rZip08eVsIa5UoQLhMGQsA
	 IKNucTsQGrmQSMTcLb0400X5qWSeKCoyoaPE0nnle+m7Y32qNkeR2QYh2lk1W1zmdF
	 uTcWQw2gZap4gAsBB8JK9G8gOIskT8M4mEXIJUACjZRTuKrcqfH1syxTtOXv4X+0Gd
	 UETr2tmDegMsQ==
Date: Thu, 19 Nov 2026 17:21:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, tbevis@amazon.com,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/9] dt-bindings: i3c: Document the AST2700 I3C
 controller
Message-ID: <179513050618.1478011.10339945188286451327.robh@kernel.org>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-2-4d8fff5c5196@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-2-4d8fff5c5196@aspeedtech.com>
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


On Wed, 11 Nov 2026 11:16:30 +0800, Billy Tsai wrote:
> The AST2700 I3C controller implements the MIPI I3C HCI programming
> model, extended with an ASPEED in-house control block and a PHY
> programming window advertised through an HCI vendor extended
> capability.
> 
> The controller takes a core clock for PHY timing and two resets,
> named in reset-names as the controller's own reset and its DMA engine
> reset.
> 
> Boards without external I3C pull-up resistors can use the PHY's
> built-in pull-ups instead, selected with bias-pull-up; the achievable
> strength set depends on which pin group backs the bus, since that
> fixes the pin voltage domain. Reuse bias-pull-up (pincfg-node.yaml)
> for the strength in Ohms; it is declared on this node rather than a
> pin-config node since the pull-up switch is part of the I3C PHY, not
> the broader SoC pin control IPs.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> 
> ---
> We considered expressing bias-pull-up's dependency on a pinctrl state
> in the schema, but couldn't find a clean way to say "depends on
> whichever pinctrl-N is active" without hard-coding pinctrl-0
> specifically, which would be wrong in general (a node's active pin
> state doesn't have to sit at index 0). We've added pinctrl-0 to the
> example to illustrate the typical usage instead, without a formal
> schema-level dependency.
> ---
>  .../bindings/i3c/aspeed,ast2700-i3c-hci.yaml       | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
