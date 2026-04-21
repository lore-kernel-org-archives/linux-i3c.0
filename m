Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4179ACD13DE
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojQ0b7+eAjwstbThR0hvv9HO7d9jVZ5J71Xb6Pu1LC8=; b=hg7aXyldX0XlZel16NkhMncnxG
	3fvoxX78H0O0LQQ5uV3ZbASfZaJV+qWIpnACaMzzG97MAiZbvjwK6219OzeQKs1q+7nK/JFQucl0A
	ueKD+8O//EiOI4+IMQIP8M5Z/9hB1Q4skDxNyf/JauNaVy8oj4aIbjeuifzlztjXv2BKG2UFZdRvX
	7W2Z0r2AXrYoxzbguFAZUmshujiSxP0mtwX0I8j8TS5q1P2rw3nzQpLuwZ/RiPOSqgAVz9k6kTlbJ
	RF8OXRIRPblMbBOos8qgIpmNdXp5FOK7RBWHYJLCPR4ctFTwRsJ+WMVCOLVcVetoj1pDsybtwkXV0
	Z+bTkEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOG1-000000059vv-44rZ;
	Thu, 30 Apr 2026 10:04:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEir-00000008xlS-0kg5
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EEA460172;
	Tue, 21 Apr 2026 17:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB95C2BCB0;
	Tue, 21 Apr 2026 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791835;
	bh=qz+UTYnQ/3atOxznUSJQeJ0xPXa7iKA7CMp5q359fEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBbDXwixTZZiXhJr5NbyCGPcqYmn4rAG6fS81WLVX9BCBZ6yyad5eT2IEsO6VrujO
	 0TTtQWc3+/WEerkk6UfzK2QYZYzHIaHPH7HjDQrtEWonkGkX/aVgpnDdS0vUJ7cygu
	 8PgBzCrFUWGDiYYxSXisODx78YcBvjcLs0ArN/9qvqrc+tan7Cora3gbD+53RMixEq
	 +39wnN59/y9KI4xW6Iu5ALpyI/3kIcfcc16CktJTGYQp4drzMZwmG3zWPNYBHx9a20
	 jaRohjWhxDt2dytVRUSUshtlLUbEqzScTyPIpHM0BqmbgXR9cf3wTW5khHuD3pJEVS
	 2q2fdUK2esxAw==
Date: Tue, 21 Apr 2026 18:17:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add VersalNet compatible string
Message-ID: <20260421-voting-proofs-3a4b86df5383@spud>
References: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
 <20260421103059.2484623-2-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
In-Reply-To: <20260421103059.2484623-2-shubhrajyoti.datta@amd.com>
X-Mailman-Approved-At: Thu, 30 Apr 2026 03:04:33 -0700
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
Content-Type: multipart/mixed; boundary="===============1600668876790113248=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1600668876790113248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bpRFO5pIWMcCxPid"
Content-Disposition: inline


--bpRFO5pIWMcCxPid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 04:00:58PM +0530, Shubhrajyoti Datta wrote:
> Add amd,versalnet-dw-i3c-master as a vendor-specific compatible
> for the i3c ip available on Versal NET SOC.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f55..98dafec0ace5 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -18,6 +18,7 @@ properties:
>        - const: snps,dw-i3c-master-1.00a
>        - items:
>            - const: altr,agilex5-dw-i3c-master
> +          - const: amd,versalnet-dw-i3c-master
>            - const: snps,dw-i3c-master-1.00a

Yeah, no... This will just introduce warnings for the existing platform
and is incorrect on your platform because the altera compatible will
match before yours, dragging in the quirk that platform has.

You need to make this into and enum with your new compatible and the
altera one, with a fallback to the snps one.

pw-bot: changes-requested

> =20
>    reg:
> --=20
> 2.34.1
>=20

--bpRFO5pIWMcCxPid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeexFwAKCRB4tDGHoIJi
0smmAP9xAHCFNlFYQbAU2Kk3Ai7/0TbhcEH/CPDO0GF21BegpAEA/PXycRys1LQG
K/mWElDS/CbUjBfHgI8siu6raNZvcQo=
=zI7w
-----END PGP SIGNATURE-----

--bpRFO5pIWMcCxPid--


--===============1600668876790113248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1600668876790113248==--

