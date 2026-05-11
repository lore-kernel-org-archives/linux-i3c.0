Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2643CD4F35
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6XbGE/z0RqfAZwu92rR5u33hTLZJXWWrOwF2GWCKVk=; b=CUJC8m1lfIWLOOjwM+Nd3uOkzY
	GbiGDGkx5Px6wUtgyeeQSYWNeFHvYVpyZkiJ4fN0xmRG/O+vAEidBKSivN5R2gakIv590BjOCyiRH
	cYURTxBDQJUF6GbL1zKdxbFWczjDDhbqdzVQkHxk4YlAqp9DD2JRxS1LVZZZcX4oyRBEnuo7j5N7A
	C9LlaLl2t/Rr1mpa9/TJFZogvg2L2ckd9J778wBXCHaIlnBdd4T4hjY5L5D2T9o92f6WAE1X/FJ+3
	t2QOWkcYtOAyNci6SnKN+t40bB16VoPWNDdPPfedzrNNfgrOFSGilPG8Dfpj6LCf/NVsrl8t5WPHy
	Zv0O9Iyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Ro-000000025j3-1qql;
	Wed, 13 May 2026 10:04:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT5L-0000000E8TI-3MZW
	for linux-i3c@lists.infradead.org;
	Mon, 11 May 2026 16:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EC3560120;
	Mon, 11 May 2026 16:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFD5C2BCB0;
	Mon, 11 May 2026 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515342;
	bh=uznNZeBvkQNFwgstmmxLx35Y58HlJI7x/00h6NLAsFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2UX9yx9XuOSw0NbAmyJJnddOcPRj8LGLdBV8iH2RihMb9hT6taGFgNzwAlWkGzup
	 swaJBuE4P4caIU7aQgJ2e8hi0yD7n3C7xM00RyNmIlk/cgQUfcIA3zjXaTVucKygbJ
	 wUw5iCMt4wncNQVa15Qucj4GwRCf93qBuUwhafh+UeSEliIumpsvEguiRmtC8cwHSi
	 jBAnz1y/n/9bXj03ovoQMSwE0+hsHQwthPrzjetPX4pyAIA+iw75Ryd66Ntchej6IM
	 1JK59P7jj0IVvlGIfnnjnH9N98zgmtaQA1E4qOQHHeazoJdPmhpRiW/BI21Lr9ndJ8
	 9pPHy2gfDJS/g==
Date: Mon, 11 May 2026 17:02:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <20260511-amnesty-afoot-84537aafc02c@spud>
References: <20260511031945.3228-1-jszhang@kernel.org>
 <20260511031945.3228-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260511031945.3228-3-jszhang@kernel.org>
X-Mailman-Approved-At: Wed, 13 May 2026 03:04:10 -0700
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
Content-Type: multipart/mixed; boundary="===============2572508749975030321=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2572508749975030321==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CfZp+rhr9WmPbCrF"
Content-Disposition: inline


--CfZp+rhr9WmPbCrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:19:44AM +0800, Jisheng Zhang wrote:
> Add dt-binding for support of apb reset which is to reset the APB
> interface.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Please squash both dt-binding patches.

> ---
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index 613dce7757bc..2575442b28ff 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,10 +38,12 @@ properties:
>    resets:
>      items:
>        - description: Reset signal
> +      - description: APB interface reset signal
> =20
>    reset-names:
>      items:
>        - const: core_rst
> +      - const: apb_rst

Drop the _rst here please, not as if these can be anything other than a
reset!

pw-bot: changes-requested

Cheers,
Conor.

> =20
>    interrupts:
>      maxItems: 1
> --=20
> 2.53.0
>=20

--CfZp+rhr9WmPbCrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH9igAKCRB4tDGHoIJi
0j/AAQCY7CZ3OJqPaerq0V45HxlhuImAWjnvZaxXnnw27iRhPQEAlYjvac2dz21i
83ktp/UsrKOZqGB0Did72sYL+5huWwE=
=L3cQ
-----END PGP SIGNATURE-----

--CfZp+rhr9WmPbCrF--


--===============2572508749975030321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2572508749975030321==--

