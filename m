Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C64C7EE3A
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N25QX5ILuVKd0pCSH2uAucr2oeDhQJNr3qgJt3bXXM8=; b=GAKeMAMwXla3GabRV0WuedO0vX
	q0v8MsHKfIHc9GRhNVu8hCVrQ3tvBEHeOwbisjF6rYEzmVLt9lLxJvFsaRfz4vef0Fo/glEeN9Jsr
	4Q7dz3zcP5Y36Mgw9FtLrcKoEwcbUgSbGyVqNSKpEAe/luZYgJlbYMfWtTtyj/2LzutCzCWQvTz0J
	Mhf8LzBAVBHrh8XDOJ+LY2bQq95mIGo6TC8Sq63ZORvp3wYXvChBCWJY/2DjiGppmJYcNeWCb1VmM
	okDMvaZL4sBMwQMKWQfxkM9cbMrUCoFiMQ+YJiiwXkVsiYgxFyn4H8wrsu+VsAhmhOU81NYofR4jX
	tzQ2nMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYq-00000004Eiu-46ya;
	Tue, 24 Jun 2025 00:30:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPixv-0000000Dd4g-47yA
	for linux-i3c@lists.infradead.org;
	Thu, 12 Jun 2025 14:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nvX4
	gaASPxW8NzIAszKH+xfR6o3pGLbxslvAvlUHCVU=; b=Ifb8Elga9Hq+WuT3KRxS
	mf4hNdyFGWeD5WnrMu+hPrvK959f8HMrexl2/lRy/lxSt1edL7v6HmSdXl/5XJJD
	mVGcVnXowqjSVUMkVRwSYOGaMwatXTMZFQMjLWmcbUEPlbt4VPSVRysfZb5QUdVi
	FKV/dMn8tUYsYblVK93c+qcMa1FE9ptr293YpDmjhigAc1+41pvVYWuM6J4tquqt
	JD+meruUvZ8l48yFQiIWqCW142Rh6dTB/ac+IMrzIDPpAshdoxOYnqux6vrbSqSp
	IPf3b0yyFX75EtV5uagbg0ihpJFnTPGLEtL1a3R9dGowqawe2GgYqr0F0b1BXL7H
	pQ==
Received: (qmail 4027197 invoked from network); 12 Jun 2025 16:31:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2025 16:31:36 +0200
X-UD-Smtp-Session: l3s3148p1@axByyWA3dqUgAwDPXy2/ACpZfVCNKldR
Date: Thu, 12 Jun 2025 16:31:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aErkyDQvV3C0TZSu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073140_888228_495AEAE8 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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
Content-Type: multipart/mixed; boundary="===============5792438301972182174=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5792438301972182174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yxu6D1mTWsYb+Rh+"
Content-Disposition: inline


--yxu6D1mTWsYb+Rh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frank,

> > +  clock-names:
> > +    oneOf:
> > +      - items:
> > +          - const: pclk
> > +          - const: tclk
> > +      - items:
> > +          - const: pclk
> > +          - const: pclkrw
> > +          - const: tclk
>=20
> Suggested clock name is, apb, trans, srfs.
> Needn't clk surfix and provide meanful name.

? Why can't we have the name from the datasheets? It will be
unnecessarily hard for users to verify the correctness of the clock
assignments if they need an artifical mapping of these names. If they
are the same as in the datasheet, the same task becomes very easy.


--yxu6D1mTWsYb+Rh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhK5MMACgkQFA3kzBSg
KbaFJg/+KeiNeq05WPjw2bEJSYqw0HawAApouvZSc2qN0M7xhrHqvU6cFplYCJlC
NZmV015zCr9ulnP8GFmigTu6gkjaW2YLSn0UEJMBdTHNAut4jjl43VKkmkVRYShU
Hr3ob55YKWX1GG/MNo8+miZsP8iZbZwO2kvFegO6SrVzuKgVzLZVBEIbBZdZuy5P
y55f1LVO6uYtH809SAPf2jEccye7y7EVPRTGQydNWaLzWYqNteSUBx2S22bZ3GRk
lSVRDgTMkmLJlVdNBO4vjbNldMklN2YfEYMgGpyBmUjbATuu2gaERPpAmyqLV1el
40Kns1+fMLsfpstbv5LJ4QdHl/vgKsDscZlAeis5wXuQNRYLBp1mZziV1d6uK4U0
RS6Uza+rn9Ub/wj7/m6qNQC0NsrnK6BZJVoijGciQumZJC+brugfiFHBm5+q5/M4
gnY7mT0YuBRSBTppXRJM4tgSCSEGDQUluFZ19zOu28TJq/gmbwo28GJwUG/Ozd82
Bgnm/6EM/u72iqx6pLS2y7RdBCCXl84UVdVbMoV/dyWf3Zd/RR6w8bmplXi/cOyY
fXG3MWkh8jRCVx9B1TL1kd+UT3qKyARQJNQ+u/5YZ8UvaFVPgcusglixuTReps5J
jiwQoITVVoHr6OrB2FkmNFeRkEuL8nIewZuKrqLQ0wli2VjROJQ=
=OjIv
-----END PGP SIGNATURE-----

--yxu6D1mTWsYb+Rh+--


--===============5792438301972182174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5792438301972182174==--

