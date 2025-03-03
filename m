Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC266C021B8
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Mar 2025 22:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBbd795fHv8VE/PBzrJzFOc5WngIaFFZYnMdylUxUYk=; b=47yn3bKCFoyGfdRKibHneOMgXi
	PFpqUH3SQWsySiLG+PxxNf2jwvB1/EduVH3bPj0otf5pej/UhJFynWQCXpktsPQZOHmIQ35Nkr8gQ
	xacq6HlM4BHoVudl0KRqD2/nX4dmhsOq0eLfRhjhMsAzPr6ok8Plh6eqcL71OoTRbFhyvlSkI1j9B
	Sv2PbGarXwoQpLjwkNUdPRPhc58aZQ/oS6KSAgwzAgu/zvqV5fhtpTJ2mAq54gWDqzjtVuCHn4D+t
	jFIj3CEVOxcCv7Ng/mYZbeJm/jW6QTfNIKOVYMgAlnC4Eg35UNbi6xEHwGNVUtcY9MM75UT2hASuA
	MPQjGIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpapU-00000006Qbg-1urz;
	Tue, 04 Mar 2025 22:33:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9KG-00000001goe-3KDc
	for linux-i3c@lists.infradead.org;
	Mon, 03 Mar 2025 17:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36FB45C53FB;
	Mon,  3 Mar 2025 17:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0E6C4CED6;
	Mon,  3 Mar 2025 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741021891;
	bh=eizNalHCTuxVF3+1ahCWWok9u/AgiM8Ny0irTXJi51k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=of7odUmJ4GW9tgOsLsWTabrhv9EKztee8MTxrKncRQhZ9zl4LdrKPVrrzI7+uQe+l
	 Jz7nKTiJOBMlz+A+eVjL3+k2tLGB+bMHzI2XEHZiEBHNdMi44kt+fKATFk4VbeK+Fa
	 7ntIcHcijQR18eYJOviPqI0Fmdal9PxTFe1XtH2Qm7/bxRaDG+2yXAf0+v3hGEJnzZ
	 u3eUVnEOmjDQyxiV+gDcE++to7dS9MFB8d7wdXs+hRc3tIDx9+dER4IWGawpXdzlLL
	 BQH3o58pOvLn/XyuCCOWg/CRl4QEDENEBf2KtaqUGUosaPxnANoYGwz3PA0xqfGYLN
	 cw6msE1rTWvGA==
Date: Mon, 3 Mar 2025 17:11:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: frank.li@nxp.com, miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v2 1/4] dt-bindings: i3c: silvaco: Add npcm845 compatible
 string
Message-ID: <20250303-chest-presoak-5d3f3b821d1f@spud>
References: <20250220054330.1711979-1-yschu@nuvoton.com>
 <20250220054330.1711979-2-yschu@nuvoton.com>
MIME-Version: 1.0
In-Reply-To: <20250220054330.1711979-2-yschu@nuvoton.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_091132_888942_E093E847 
X-CRM114-Status: GOOD (  13.72  )
X-Mailman-Approved-At: Tue, 04 Mar 2025 14:22:49 -0800
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
Content-Type: multipart/mixed; boundary="===============2488206218809611924=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2488206218809611924==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VzlPWCTDiZiwVyeE"
Content-Disposition: inline


--VzlPWCTDiZiwVyeE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 01:43:27PM +0800, Stanley Chu wrote:
> Add a compatible string for Nuvoton BMC NPCM845 i3c controller.

Why is a fallback not an option here? Your commit message should call
out why not.

>=20
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index c56ff77677f1..9be4bc4cc482 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -14,7 +14,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: silvaco,i3c-master-v1
> +    enum:
> +      - silvaco,i3c-master-v1
> +      - nuvoton,npcm845-i3c
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20
>=20

--VzlPWCTDiZiwVyeE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8XivwAKCRB4tDGHoIJi
0gSPAQDrU/Mgy4KedvZ0NfvAWGiJ0jnOqPXnQOk0r089AFRSXAD+OnTmtaJUfc3I
q3e3xQUV5qSfsRKa0s8ClZFRs72+PAE=
=RiRD
-----END PGP SIGNATURE-----

--VzlPWCTDiZiwVyeE--


--===============2488206218809611924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2488206218809611924==--

