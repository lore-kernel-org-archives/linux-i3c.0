Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE975C61CE7
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9K8+i2yY1COZL8CMlv6jltff7+7507mFdhp9hRP1MMQ=; b=TT2Mbqf86y72V9ADQKB42hV7bY
	O+RlDeurSTsZ526Yrvwd1+/hI0868az+WkmfFcVvlcnMR2nbDzVSmSuA3mHMvBwHNiXIkeZKwnmep
	dYsaVjoUPvarpLGFQ+ROSHDiIve0FN8ofAKIM3D+vEehE/5Cq1VlRqKvJt9xFxn4vcy7UyHu1vFke
	i0zuaa9FByLXNyaLcko8mem5vlwTCWBgaD8bn0QSqz1Rup4tL611RWdruD3rYtwpPgzJl3Ciyr42u
	qNaYlacoINES1wFcfYIWBUeBwHXqOgMbha7QaHnJzKdCW6ljh3efTavqarhz4wayIoCkJRFMjbkPs
	qhrTM0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6hA-0000000F8wW-2BxY;
	Thu, 05 Jun 2025 09:15:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMwBD-0000000EHtx-4BAA
	for linux-i3c@bombadil.infradead.org;
	Wed, 04 Jun 2025 22:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XYsN0Mxu6kzOMZRM8G9bwLA57Ld88W2+ErglUKi5dak=; b=UZmC/tHdSjnbP8SN2SMpb/W7pF
	6LGmU78Caq0GWaoVL5SN2fJSWh3w1reY3kCRUwjb41C3SSYmXKIRQ7N83taS/xLnm+N9id1oOPbJy
	qf3mywey+BJbKMA2arSmp+If8HdC7FM/wMd6GFDI0MibfAfyX7WEZ80b3A84UbGDRjJrlh52bmyue
	mdChVC35JjQoY+jwr/gsKGC5E9z4ebkgfITgv8i4vzl8qNVhJo5N8l+MmVKyi7Z4VUs5EjGSNmfxj
	bMbfDNC3GsTeISjYAz5mO8xFJag928m+5kOzcfAS3mlXjIW67CqV3Kv3CZGnIpaChzR70q3UlITJt
	+cobxTHA==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMwBA-000000010je-12ns
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 22:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XYsN
	0Mxu6kzOMZRM8G9bwLA57Ld88W2+ErglUKi5dak=; b=jVeSPsDNQqPEw3/xHqL+
	kx3vWv8851KBNbLrJXyvOKKPqL5amUiL3u0pPovHND+tjTeDpaUxenV6v5pQTKBx
	st94fRkYdI/JVwBetrw03cszeLPm2zqUm9VFwcU6IIpv75NAuiro9QqyizfKB5Qw
	WemovnvDZvU9r3sGEhkeQYFfYut1qwRsqBRCz7tY0KI6M9bSoi23JZU1QMBlEfgS
	nB7Hr+pxFlJZ7sCwZquw62o53QVNkL5sW286h2DoVgVr9HD+ECPtoFAueOvo2eFX
	ujUasmXp8KXzbwWd+zCAqnzleL5wwv5HLgwIyEcrlZ1Me1muLSp0IBuDna26z4BY
	8g==
Received: (qmail 838888 invoked from network); 5 Jun 2025 00:00:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2025 00:00:34 +0200
X-UD-Smtp-Session: l3s3148p1@2VpNIMY2csEujnvc
Date: Thu, 5 Jun 2025 00:00:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <aEDCATbPA9173lGI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
 <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_230148_580719_0DF61C5D 
X-CRM114-Status: GOOD (  13.80  )
X-Mailman-Approved-At: Thu, 05 Jun 2025 02:14:09 -0700
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
Content-Type: multipart/mixed; boundary="===============1407098640608816962=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1407098640608816962==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2BXrAn6PXUNyIVW"
Content-Disposition: inline


--a2BXrAn6PXUNyIVW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

On Wed, Jun 04, 2025 at 03:10:13PM -0400, Frank Li wrote:
> On Wed, Jun 04, 2025 at 05:48:58PM +0200, Jorge Marques wrote:
> > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > core that supports I3C and I2C devices, multiple speed-grades and
> > I3C IBIs.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Hmm, I didn't get the original patches. They are probably still in the
moderated queue?

> > +#define REG_VERSION			0x000
> > +#define REG_ENABLE			0x040
> > +#define REG_IRQ_MASK			0x080
> > +#define REG_IRQ_PENDING			0x084
> > +#define REG_CMD_FIFO			0x0d4
> > +#define REG_CMDR_FIFO			0x0d8
> > +#define REG_SDO_FIFO			0x0dc
> > +#define REG_SDI_FIFO			0x0e0
> > +#define REG_IBI_FIFO			0x0e4
> > +#define REG_FIFO_STATUS			0x0e8
> > +#define REG_OPS				0x100
> > +#define REG_IBI_CONFIG			0x140
> > +#define REG_DEV_CHAR			0x180

This register set has some 'cdns'-vibe to it. Maybe an earlier version?
Not sure merging this into the cdns-driver is a good idea, the register
set looks quite different to me. Note that I don't know cdns hardware, I
just grew a habit of comparing register sets of new drivers to avoid
duplicated drivers.

Happy hacking,

   Wolfram

--a2BXrAn6PXUNyIVW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhAwf0ACgkQFA3kzBSg
KbapNRAAmhvODM46QrZz2ghPGvdqckgqVY4/n7p1Ha0YrYzEDKmxOitwVpG0eK/j
E2GDaBu/UxPX9yEeML2K6saO0dyvPk+lebuPazJE2IHILYmXo4bBhkCXevYLz3zr
dX2/fii0I/ICPdT26BAbfMaoc5A+hbuyKhLBxK5NMxiosW1RNaOcRvRsXiiuiKhG
4HLFcOy2st2mhQ2O5rvz1bga3uFevGVX5gO1mcXMACaewmt1YveOg8jZMr3qKXS/
P/Dai25n/D4ADbDqw3kWiFBfFbVmQuT0OmGx/x1B8FHX3RsmDXmEpSR8cLV2/mpp
dg22jS9BMtPBjN6VUFHUFIcoaz3XTJ4DBLASU8oKVlRofVmdcf/1loQiqTQp20Oc
TZZj968JmKZxfP2OQP2xXI9ZqL3rlnU1/3dKkmuChmGSpy9VI5ln0eGSwwX3DTXd
RkGuhgNWP3m3qCCD1MCmHkrdyhUb9E5UTRxV68LZTDn5jc+J/RA+xaQb+euOeYiL
dv760TCCBMtMWUGeBQ8xCsNgAc7o1BwuXUb7byguXJBZAdlaJ14yyRNodA2HxVjr
FbPGADy9M14iTGSQFKM81EXHZxZuvPlW0UQEk1mfat1U5/ZI/+MJ6SGPK5QhLXwm
vZqyLU6pPihEucm8rAiOD7SP0j3nU6JLKnr1INxO7KfOqW3Jr/Y=
=QtfA
-----END PGP SIGNATURE-----

--a2BXrAn6PXUNyIVW--


--===============1407098640608816962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1407098640608816962==--

