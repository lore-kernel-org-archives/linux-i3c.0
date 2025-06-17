Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9231FC7115B
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyCl6MNrt7WV4pH98r9oETXYivP3Mn/Uwx2sCOMQ134=; b=nBekUmHRjiVR2ZoNraHj7LUUgA
	tfaOVV4sXXU42EUbPZnomWnB9PZ+4HZiHOBPI7D/L5OUxWmjBjbHovFSMFtUnpB+eINyHdYD+wSNl
	U8gl9NDZ70FH+UrJIjZlHySTAD9IeaNchcoK6aplszF2VmBlj965Es7cX/epbVtQGnth2ULZZ6gZb
	ywFett1RL6ZB2ljXBVHZ20SzCoxGkrb/r/cRm4HwEKJM1ZFRyx92HcfiyLh83BU2mYyO+5wc//eXm
	MwDfkOAu+3LEzPnbFVlLlVHZchEgP+fAQFYiTtqcxQFkB2VPvBcdZ2njP3XhGjaMH8anE0T9VvckQ
	36ZYl1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYt-00000004Elx-19SS;
	Tue, 24 Jun 2025 00:30:55 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSq7-00000006nUT-3q31
	for linux-i3c@lists.infradead.org;
	Tue, 17 Jun 2025 09:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5Nu8
	wYWOVF85nemsZ/25+lLkQ0qafeZ231O7LDkXoXY=; b=GMWwKYhNyjWQbrAjDmk5
	ALhySfdH2SBIbpPrN8OF+qNr1gBtkbZJX8LFYfK0+mvERoiUyg8Sbr61qzDZxFo5
	sI+MtnwhzKTEkqvoymiGms1zmu45ImFhL3h0JQ3WkVjqyCJ8rwWz2PCnYB5nIMOW
	GUDJ6G1BQgWI74qThx9sNu9/9l+opUdzuy3HZXnyQULuWZ5gDVGfeTx6TVPbnMzJ
	DTH/XbxMkExkjRa3z558hQgmzJ545MEnaOIlY99pa8cTfthHsZcXlG0moC6PHhLO
	SM0PSqTVLZ2FZeNaBWbVUXi1/Thx7EdNVOWlVyTj0HWPbOedMggO8bIohfWxFB7J
	4g==
Received: (qmail 1600317 invoked from network); 17 Jun 2025 11:42:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2025 11:42:40 +0200
X-UD-Smtp-Session: l3s3148p1@Vc1UVcE3DtUgAwDPXy2/ACpZfVCNKldR
Date: Tue, 17 Jun 2025 11:42:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFE4j86NaZcMvxBF@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_024248_861736_673E64A7 
X-CRM114-Status: GOOD (  22.23  )
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
Content-Type: multipart/mixed; boundary="===============8289300408803388477=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8289300408803388477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ty0/U/BdEFVy0pZE"
Content-Disposition: inline


--ty0/U/BdEFVy0pZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

some status updates...

> It is similar ADI version. Can you simple descript hardware behavor to sh=
ow
> why need RENESAS_I3C_MAX_DEVS,

I hope the documentation links I sent were helpful.

> Add common header in drivers/i3c/master/core.h implement inline helper
> function

I decided to handle this incrementally. I need to work on the real show
stoppers first, I'd say.

> #define PRTS                 0x00
> #define  PRTS_PRTMD          BIT(0)
>=20
> Add extra space help distinguish register and field define.

Done.

> > +#define STDBR			0x74
> > +#define STDBR_SBRLO(cond, x)	((((x) >> (cond)) & 0xff) << 0)
> > +#define STDBR_SBRHO(cond, x)	((((x) >> (cond)) & 0xff) << 8)
>=20
> FIELD_GET FIELD_PREP
>=20
> check other define

Done. Also with GETMASK

> > +static inline void i3c_reg_update(u32 mask, u32 val, void __iomem *reg)
> > +{
> > +	u32 data =3D readl(reg);
> > +
> > +	data &=3D ~mask;
> > +	data |=3D (val & mask);
> > +	writel(data, reg);
> > +}
>=20
> can you move reg to first argument to align below help function?

Done.

> > +out:
> > +	kfree(xfer);
>=20
> you can __free(kfree) xfer =3D NULL at declear to avoid this goto branch.

Do you insist on this? It makes the driver less consistent because there
are other 'out'-branches with kfree() in them which we need to keep
anyhow, because there are more instructions needed. I can do the change
if you want but I personally would prefer to leave the code as is.

> > +		if (!i3c_xfers[i].rnw && i3c_xfers[i].len > 4) {
>=20
> Only pre fill fifo when len >4? what happen if only write 1 byte?

That was a really good catch, thank you! I think the code is completely
redundant because we fill the FIFO again at a later time. Then, also
handling the case of < 4 bytes correctly. Sadly, I can't test this with
my current setup right now. I hope to have tested this by next week.

> > +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > +			renesas_i3c_dequeue_xfer(i3c, xfer);
>=20
> This may common problem, I3C spec have 100us timeout, target side may
> timeout when driver wait for irq. So target side treat "repeat start" as
> "start" and issue address arbitration.

As said, I will try to discuss this at the I3C plugfest.

> > +	i3c->addrs[pos] =3D dev->info.dyn_addr ? : dev->info.static_addr;
>=20
> Are there extension of "?" operator in C ? I remember

As agreed, I will keep this.

> > +		ret =3D devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
> > +				       0, renesas_i3c_irqs[i].desc, i3c);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "failed to request irq %s\n",
> > +				renesas_i3c_irqs[i].desc);
> > +			return ret;

I removed the printout comepletely. No need to do it for irqs.

I plan to resubmit the non-RFC version next week after the plugfest.
Fingers crossed.

Thanks and all the best,

   Wolfram


--ty0/U/BdEFVy0pZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhROIsACgkQFA3kzBSg
KbZ/Xw/8DX5jexSQzPCertcmZdvx2WFQht/3bF3fEGKe2TolB3N7T6+8ufA4IKTR
66mcTrw/JX+hmPbyxFb4ycfNiczSJ2JwhM8r4Wi+29DKO5VN5Ijp77eGASXlCUOz
9jQKbz8pbFY9X6yCY8YZGS8KWGA0Uy4icKY8tnGmtOgWg7A98fYOk5zN6YY3L1Ua
P92qa55YKSdduD5P1oWWxg7xdwKGztgwuhts4ImslmMjR8DaTROHuDUGWbA4A981
nUoqoZ4bTvszO7ANJ76Vi0blUVZd6uPC5IMfg246/r5fXWtMtPUArWQ5tsrGgj4p
vAzQ3Scx5dgNTtfVJ+aVR80+LYO4RHkXzV8UGmZpb/FDo06qtNyXbayCF1m+kDC9
KvieuLnfsZro5T6WjeAjDs97CCnf0Q6MP0HPbiHUGxr5DBL/fUGxCI5W7nNJE5Q2
IlU8vJev+xu1Gs5IYoemJvpquiVP/dDiTW8cOfJzW9EsQyypseasCSf2QrzMHkNT
hoDiGo0Op/gV6YZ7Kq0t1qNfHM5vMI1fnki7YIo4oZduPWlzhUleb+FCjQJosfQl
ypC0WYwprqZYVzX51d3EderVsu4o87OeydEa72ctv2gp4WD80lJwbxOwO9BHFAOT
UChANBnupaV93h/WDysb5jB8ZCgE0laQ8m2Z/+Y4KGvW4Qj2gtg=
=gPHu
-----END PGP SIGNATURE-----

--ty0/U/BdEFVy0pZE--


--===============8289300408803388477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8289300408803388477==--

