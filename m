Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B4606A32E
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PGFlJRnN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dp9HXltK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HcI2iE9mrE1q8CmR9GkkrCC9bTMExo2gOORL4N/SMu4=; b=PGFlJRnNi472NlNVhUmAyrquMX
	9qg2oR46Yg0D5Xwa/i5TL+V2ZFTmnl9e/Ya7k4Se8vMYXhQbMNtNrzwNFNkvym8WtbKdarzi2W/QA
	+jIh/hWaLGVXI+6zk3ClzPeommPUDVJwL8eHwLEOYE4ZwGV5SnTefdOiPpmsq9oGs/b97mRfR9AdI
	89Sc4kdspnU/Dqhng8f7bww9gRTNoh9g1MmJWJkq103lbnaCK4epyRnamVcQJJM5A6iQwGSLkhP3K
	Le16msbiEmXC1iFKJUD/w3wNMhlMbbWVPBf2oVpdzKQ+MNTkKWoV3bQGPPQTxIzV52TxHM2bhkrRT
	plFln2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevJ-00000004NOY-22TU;
	Tue, 27 Oct 2026 11:00:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP1o-00000002CR3-0N1K
	for linux-i3c@lists.infradead.org;
	Wed, 07 Oct 2026 10:37:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D51314361C;
	Wed,  7 Oct 2026 10:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4F21F0089D;
	Wed,  7 Oct 2026 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369459;
	bh=WsDUD1TFZA2fOWRE+vsk3ceoJCG7MxBl7m/WBuxsuEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dp9HXltK9x1TngY6K80fyflYAxE2KYsXcel7AUhtobSHZwy63LvuH5B3FMux0rf9G
	 ZzZ2hNGG7x0rldsr8WN8fikZEOyJFDOI/xdlMxkVpwXavg8Uzbt5qFUFrksCi86ABl
	 vsTOdptbbPTBH53eisw1ApvQpBDaWikqe9cvP+Ay9MEu4h0N96o44ZYG/dW1E6mfcG
	 9zCYZwKGifakSubbZKfBLLOfFE3fQQy/NytwbDHzP1Oeu9FPwS7xVy361HRKZ0ngP+
	 lGTlkOAfubBxlMD4v0aN66d3fH8MEe2HV4r90FLgq2yYjKk5Ht4kj2mtN879xp8hQ3
	 fl30XYzmEbGtw==
Date: Wed, 7 Oct 2026 11:37:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: dw: support up to two reset
 lines
Message-ID: <20261007-a1450faf9f78a0ecd2ee9e48@squawk>
References: <20261005152425.25319-1-jszhang@kernel.org>
 <20261005152425.25319-2-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261005152425.25319-2-jszhang@kernel.org>
X-Mailman-Approved-At: Tue, 27 Oct 2026 04:00:49 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8405017726291050214=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8405017726291050214==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HTSLNB1Ohr0OPKRo"
Content-Disposition: inline

--HTSLNB1Ohr0OPKRo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HTSLNB1Ohr0OPKRo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYg7wAKCRB4tDGHoIJi
0gCmAP9is6y25kk/RSvD17DU+AgBQ+na8H8Pg7XOxRUaU+V6PgEAgb4lXZX1Z0BR
a5lBUo8knDvZfmmoBo9H4OQBWjkXHA0=
=e7DX
-----END PGP SIGNATURE-----

--HTSLNB1Ohr0OPKRo--


--===============8405017726291050214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8405017726291050214==--

