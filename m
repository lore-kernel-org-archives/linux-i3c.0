Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849B0CD13DF
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R3IyL3y0ai3MhZMIukCULOpK4RDse5KN1f7DFaRj1o=; b=kl/jxdGIXDPt51yGFO2TJz6zOV
	z0FQDrBVIJ1Od3jrrqiZlxxF9SXqe9CzZHbeuylvZ7jXvSa7TKEwDTZ8ImnkuxK+Wcdc/ehVwY792
	PwwlcOVzIFsTQrghJbxjdX8sqg579CB4EwzlGsnXy9NxWHq0KQxlJeg8m5+Cxh6zXjy4U/+2ygJjc
	zCUM6SZfuAnP1UPaYTUf22e9uXSKz8fnJnVuK0Cxq7pGKYUxR6XVp6+Jma6p5AxBkEa4D34Rh42XW
	dKHrf8GUTBj9e5ydfH+G9EJUzyi5mgyswcJW34M7MbOrosdCVF/yaKLq46/2820jFIqXoZLeqf9YK
	KCsrNdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOG2-000000059wB-0vp2;
	Thu, 30 Apr 2026 10:04:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEjX-00000008xoT-1V5W
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:17:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC3C76024D;
	Tue, 21 Apr 2026 17:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E1FC2BCB0;
	Tue, 21 Apr 2026 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791878;
	bh=ZHXUvun2TlKFXNCDSGQdCTzBZQfFlVJtfqEGkFlFT20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJmIYNUGWE2v3JDEqFV3v8ed2ikp+LWBQZJi36TrGru35KaAVU3pn2FyE/vtqeLm8
	 +E16BGoVTPxvHJ+eFD+szgxRN2Hoo1mKFZKjEfIs+vt4SfE/7RV3OBETmFyob/q7/U
	 6zSF+V0JUAZ2+dXydHqUS+EjvqrjPgdFNMy2rLUmtQvSC7DjLbfKxvndaChmvh0bbK
	 tjgf8ks24gZAIiHsaax69GWY5LV/lCeRFc4eE6YMuVJ4nmN48uU1efR6rylW0SX29W
	 ztImcTaw2ZxMHhOkmeoVENDqD7WjxTS4nBM3iz9Xs9F5VUZHj8WGpQjxoOs+FZsInY
	 +YehVknVIJQYQ==
Date: Tue, 21 Apr 2026 18:17:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: dw: Add VersalNet compatible string
Message-ID: <20260421-exorcist-panther-d43470a97cec@spud>
References: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
 <20260421103059.2484623-3-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
In-Reply-To: <20260421103059.2484623-3-shubhrajyoti.datta@amd.com>
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
Content-Type: multipart/mixed; boundary="===============6365492121360001786=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============6365492121360001786==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dQx2Rh1ek9fvUPx8"
Content-Disposition: inline


--dQx2Rh1ek9fvUPx8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 04:00:59PM +0530, Shubhrajyoti Datta wrote:
> Add amd,versalnet-dw-i3c-master to the of_match table with
> snps,dw-i3c-master-1.00a as the generic fallback.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
>  drivers/i3c/master/dw-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index d6bdb32397fb..69fef7fdda37 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1845,6 +1845,7 @@ static const struct of_device_id dw_i3c_master_of_m=
atch[] =3D {
>  	{ .compatible =3D "altr,agilex5-dw-i3c-master",
>  	  .data =3D &altr_agilex5_drvdata,
>  	},
> +	{ .compatible =3D "amd,versalnet-dw-i3c-master", },

This shouldn't be needed, you use the snps compatible as a fallback and
have no driver data.

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
> --=20
> 2.34.1
>=20

--dQx2Rh1ek9fvUPx8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeexQgAKCRB4tDGHoIJi
0qvGAP9/+7DnoRT1GExnrC2mRyrY3z5Oqr4kZPP0XiqlO/y9ZQD/cPVmHrcfPShs
JyyvpbZ8/52F8OsKJ6oeweFr59IvKw4=
=utWa
-----END PGP SIGNATURE-----

--dQx2Rh1ek9fvUPx8--


--===============6365492121360001786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6365492121360001786==--

