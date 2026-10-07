Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD6606A329
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rKWEo+AS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pcsj1r22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JS0QTHjja1zQroP2LVy+lQ5VxxKRAHL3GQQQc0x1+5U=; b=rKWEo+ASHd/otcmCNx/Ubb6l9z
	RsEKP2+AVC35JtDItzZW3ttI/L2vH7CqLLZTxmshTcI6gmjP1zLyW8vzsIpncZ6cte9v+tHLdoq2h
	BPheGSfkrHrhCcOpmoriiMls7NtdB8T0zMjBWH4fowADw3RgXQTiL90uBZaWnK3DiBu2pL+/GEwza
	momwWXd3fp56nQxZVVgAcBSA6zZXPtX40gWIfVmYFYK4g+5nEYcTTX7r7vWZK95kxWVW8SJYtffsI
	KmNdIw6iKn4SCIIZy/u9CbnMnz6SdT2nMb89NI/Q1A6ehqJnAgp14lZJ6qmsbV1ZhNH5xIAECDYDX
	VHzrzpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevJ-00000004NNa-0AoE;
	Tue, 27 Oct 2026 11:00:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP1U-00000002COv-3ePH
	for linux-i3c@lists.infradead.org;
	Wed, 07 Oct 2026 10:37:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 52DF442E22;
	Wed,  7 Oct 2026 10:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338281F0089B;
	Wed,  7 Oct 2026 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369440;
	bh=9oD6SiM7hwS4mmlcxsA+n0Q5aV3xxpYmE/umyOd2pGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pcsj1r225lp8sruvb80qUYye2yRgjpOzsXpMGfe5MT6Htxc9NcBJyfJHhzK5UMAb+
	 wqp3byxyY+UM/90i6fdFmSJ28wZb0IKmGoM/bsqGVbQa5I3osAdcwsSHjvZLX7Rmzt
	 Ef760I7K4LbvZrGzIvJvG9WATPgVDeNH6a5v6hlRJmgTyhc8Jvu4V66sdPYVOueB85
	 Cxzxhv99kcP7rr5rtEMdvAJiCkTDuEg1iL+K8tu3+jJD+Co6O6SFYfZvhwPYDY7tJ+
	 8cLe5EzOEK+V8Kstc6bLmnXsNFg4Vph0i1BCxE6Hdp+rb4DQaxqnYWCyqwIsW4437H
	 5Y7kVsnbc3v4w==
Date: Wed, 7 Oct 2026 11:37:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: i3c: Add Synaptics sl2610 i3c
Message-ID: <20261007-598c73d6eb56707384cc7bea@squawk>
References: <20261005152425.25319-1-jszhang@kernel.org>
 <20261005152425.25319-4-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261005152425.25319-4-jszhang@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============2592954465892925792=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2592954465892925792==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knpgiYXBDiWCdQ9M"
Content-Disposition: inline

--knpgiYXBDiWCdQ9M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--knpgiYXBDiWCdQ9M
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYg2wAKCRB4tDGHoIJi
0sXmAP98KtEARVi+lXJKBYwfALrNieJYNUSQmj9A09/7o5SCJQEAziQGIGvxEaHm
bCGTqpG/tsLMpvnooIo3xHpFlPk9MAc=
=WnUy
-----END PGP SIGNATURE-----

--knpgiYXBDiWCdQ9M--


--===============2592954465892925792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2592954465892925792==--

