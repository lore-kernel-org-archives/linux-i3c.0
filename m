Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ACAD116EA
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 23:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mREtu35MjWaJ7lc/a3MaY18eEDO2fHcKGHwlytpRzac=; b=4TDTG28VoBYtP6sn8S1wXqCJGI
	mg6z/GQMDo92wb/EMo2ZDovFG2Je1reG6ajKnG58iSPLma7v0RzUOUSk3jaXtD3YcrRP/1+oG1lro
	ukHCaxcqFn9R7xqvkBZ8hp+6GYuB31XSrBCdBsnZDPqTHaBKQA5LQEIsYtdlCM1u7ULFStUIehlef
	4vmULXcwZB0fzaowzbxB8WAEfeFoQ7iSLmOQA7153MFU30aFinvGm/AaxD0/co2YD4ehMh5hFHiKp
	OG+4pfYEOjyZTQl8e54xLQXNYYXukiNJrO89Hb8AQ6u5mdv6Mqlx9wxmXK1bWwiOdPI1F5HxyDMXP
	AUn4R36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7jD-000000012YH-1kyJ;
	Fri, 28 Nov 2025 23:18:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2k3-0000000Ah6J-1jMk
	for linux-i3c@lists.infradead.org;
	Mon, 03 Nov 2025 22:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DDAF4050E;
	Mon,  3 Nov 2025 22:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ED8C4CEE7;
	Mon,  3 Nov 2025 22:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762207774;
	bh=NMKYCm9qt0etYqwSa7et7XxCnx4UJaqgyDUhxEDR7Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5+s/V+TI7P/kFcEfMiQgcUY2ByZvoKzuqpsYih4v9wywwgEbuiHVhdFQWVUbBOYS
	 N4Tza7D4JVW2SivsH/MFMhgsJSXazqViDCfynEse2TO+IFGs02o+GkLOiSdfKp41nD
	 CuI0vrbBJlJVm5IEfUIjMc+0ZJZmD++bpfCyJkFfgaxPJM4h+zh0N/LCTg8duQ1PbD
	 cFoNzEsQOmt3pkMIXQI36SsDTIGKwdabhDgvALc8RAdCIeenbjRDX7Nc5Gk4l2RxWv
	 JBp3eidF9esIVdSBQVHr98V7bs3ua9Nw/Uxq+HDeK/ByZLJ9t2rkmIsibEiyy/ti0P
	 dMcYeOK7V8F6A==
Date: Mon, 3 Nov 2025 22:09:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: Add apb reset support
Message-ID: <20251103-deviancy-gurgling-0b37c8637a8c@spud>
References: <20251102100237.9451-1-jszhang@kernel.org>
 <aQjNxCencdfq4bXq@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aQjNxCencdfq4bXq@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_140935_473213_6E88909C 
X-CRM114-Status: GOOD (  15.10  )
X-Mailman-Approved-At: Fri, 28 Nov 2025 15:18:15 -0800
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
Content-Type: multipart/mixed; boundary="===============0742781501647550246=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============0742781501647550246==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cce9vBmfo2ERQ16P"
Content-Disposition: inline


--Cce9vBmfo2ERQ16P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 10:44:04AM -0500, Frank Li wrote:
> On Sun, Nov 02, 2025 at 06:02:37PM +0800, Jisheng Zhang wrote:
> > Add support of apb reset which is to reset the APB interface.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 9 +++++++++
> >  drivers/i3c/master/dw-i3c-master.h | 1 +
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw=
-i3c-master.c
> > index 9ceedf09c3b6..ca2863d2b2b7 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1558,7 +1558,13 @@ int dw_i3c_common_probe(struct dw_i3c_master *ma=
ster,
> >  	if (IS_ERR(master->core_rst))
> >  		return PTR_ERR(master->core_rst);
> >
> > +	master->apb_rst =3D devm_reset_control_get_optional_exclusive(&pdev->=
dev,
> > +								    "apb_rst");
>=20
> Does binding already add "app_rst"?  The name "app" should be enough.

The binding defines no resets at all, so there's a missing patch here.

--Cce9vBmfo2ERQ16P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQkoGgAKCRB4tDGHoIJi
0ulLAP4jeY/i7zrDyTLIPeohketjeYMa0TSVdNJErhtQ8AW1pAEArMK31eQAI690
7wT4UKbXl0Cw+XJ9/pBKUj3zX4/q5Qw=
=R59D
-----END PGP SIGNATURE-----

--Cce9vBmfo2ERQ16P--


--===============0742781501647550246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0742781501647550246==--

