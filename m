Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E31606A329
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Oct 2026 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eyNbZUXx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hr8ZJelB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3X0hbKg2TJIRAwTsiuzmvGA/tTP7jBj9ODgC06qKIxg=; b=eyNbZUXxpcPMiB4CXMDf0kOCwN
	N3uCfiQ0asWIRqSGqmeyneGcF8N4vPBpgWFZvr8X7BbRa2seYke8EMJy2krGexX7iTggkHIOESPTR
	fi5yqIzr67PBi4JU5wNVmp7GCmQuFhZ/cPmi0sj7aZInuRu74n+936vxQBgl57y5e7yAD+muTSfAi
	I1TNwZq2kTrdl2z4joAyjCiKYug27Dfj+2FUoHe2a05YHPpbVkOFnpn4rZMlhKvn56/hOZSzw1fmm
	XzpOVo4kDq2IlZeCCprW/k3sTWruUQVClmro8txcery3/qnE2zAXf7mN4P/KSTbWjZXRkAMCvJs6D
	03v0kxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAcI-0000000Fvdx-34fT;
	Fri, 23 Oct 2026 08:27:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAcI-0000000Fvdm-0JuA
	for linux-i3c@lists.infradead.org;
	Fri, 23 Oct 2026 08:27:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7740842A18;
	Fri, 23 Oct 2026 08:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B131F01825;
	Fri, 23 Oct 2026 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744029;
	bh=hZ4LTxTbxL21MjLYHVGFboP9xeIOHT2gI+p386T6LsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hr8ZJelBTW1jgFsheUQ5A7Met57CUogRvURMPTN2z7dioE2BCqbE/ONRfjnTxe9qd
	 nNbcYWA3Mggs2MALq5x8ge64yNAL/K2WUvoJ5dJ5nkMjwmZHXsAWXsHLtacdFKcWGi
	 9Q6RZf/d7gVSRsOIzqFxahJeNHW3uVEkpTwfsTNQ/6rcTVXGqB2nEPccjSVIbiwEDy
	 J2gtBacADqktHFdQZMoTMgvzC8UUVSlbJKhWZvgU7A+4dIX1VRfpieVjzW+Gs2t+2H
	 jlPxyrUuTVCtEU19TpUWjS07j8EWp4qlVvcTp6hlx+LJhJY6ifYjPKsXbZ4hUl1GDL
	 6vwMvrqJk0wCg==
Date: Fri, 23 Oct 2026 10:27:06 +0200
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
Subject: Re: [PATCH 3/8] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
Message-ID: <20261023-jovial-agate-bat-f4bdc9@quoll>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-3-30a47f25e515@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-3-30a47f25e515@renesas.com>
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:14:57AM +0100, Diogo Ivo wrote:
> Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
> SoC. In this SoC, the controller has no HDR Exit Pattern detection
> interrupt and no SFRs clock, so constrain its number of interrupts to 16
> and the number of clocks to 2.

Your driver code suggests these are all compatible, but commit msg above
is silent on that. See also writing bindings doc.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
