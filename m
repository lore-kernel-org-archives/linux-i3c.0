Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22650CAC587
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx5FvywqoK0BxHvX73aoCMD81zp88rQTsVCUistPujw=; b=Hhui/76v1Fzwf4o5Oc190ItigG
	L0P8lahWwCQbs+uZEOpKw8ERD7HxiYNOlwjI4pPxt4u3wJ7CIrkl/z37F6df8wyXrBc8ej45UGwlX
	+vnePfY46dIDZ9RTs2dkCBojIRnWOO73bJ4CwT1iRjpIuLOLg4p+g6AAtZV888Kbb0fa9fWAJ3I3h
	TMHCAH61qxJVZkQkpK8GRqFORmteaSFMSQRmVUjcIpi0e6DaQ1Wjw9IuRWHQXXSCIo0XPzjiKpf0Q
	D68a5LdMEV5l/f9ES8AbJasCftLaRNZAvASWOPC+UE/YWoRIlaX/PmNXGrVeZCEAOLfro9iEZhMI6
	1+41knNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPc-000000029ll-3eJU;
	Sun, 14 Sep 2025 20:33:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3EX-000000084ul-2RO5
	for linux-i3c@lists.infradead.org;
	Mon, 18 Aug 2025 17:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01D47601F5;
	Mon, 18 Aug 2025 17:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6D0C116D0;
	Mon, 18 Aug 2025 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536480;
	bh=HACcRh47pib7srbjF+9nIoKNELE6V0XNbpJdUKYXrMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvDPSRoKwNkoreX4vgeYAq/ATnNXaS7iQPzZzziP9JoV/tCSJkwDffOju+TxRu6zb
	 w6BwBKbfEF8XvPXoxMPC6hrlnlWvYZ16NURbnFwZTtk6K7Td2ueBjAsrHgz2THTKE4
	 CwFynAKveW5zabNGgpSYpoTdiETck0x3D3W6kh6Xd2T+rLf7d9HF2Yx95zg+Kwl/SP
	 qKfZgzWxLuD1GHqYIDVzm5QpakcThDONHH8MKpJRrOBXMXoIZRRo3/n6a4hY/QBElk
	 ATOofdGJVHR1miIRKKbb6jg51Ia1Wj3mgYDiq3zw26ToRcVp3wgCLo7vTq/ckBoYA4
	 XoaXav6wkzSJg==
Date: Mon, 18 Aug 2025 18:01:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, gastmaier@gmail.com,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250818-stunner-duchess-abb12098ab5b@spud>
References: <20250818-adi-i3c-master-v7-0-f7207902669d@analog.com>
 <20250818-adi-i3c-master-v7-1-f7207902669d@analog.com>
MIME-Version: 1.0
In-Reply-To: <20250818-adi-i3c-master-v7-1-f7207902669d@analog.com>
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:23 -0700
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
Content-Type: multipart/mixed; boundary="===============2353884720989928570=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2353884720989928570==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fQXvwKjG+OgYED7Q"
Content-Disposition: inline


--fQXvwKjG+OgYED7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 01:51:13PM +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.
> The IP Core is versioned following Semantic Versioning 2.0.0 and
> ADI's open-source HDL guidelines for devicetree bindings and drivers.
>=20
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--fQXvwKjG+OgYED7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNcWwAKCRB4tDGHoIJi
0hMPAQDCIOHavm73r9ecryn4inj2X4/0elOD1EBAKzBe6rgQTQEA4qt0PMMxwDV8
tvH/O3adl8ft4Xr/fj8DjLRwj+iSdwY=
=h21F
-----END PGP SIGNATURE-----

--fQXvwKjG+OgYED7Q--


--===============2353884720989928570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2353884720989928570==--

