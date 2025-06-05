Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12285C7115B
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBdZ3gh7UYnBVm9m3KxYjG/QNgpP9UcW66BgKOzGQbM=; b=czMfqOx83NqInmrcGteRi9+pzV
	Trp8FZUfPdqZ/flPAjodMuepJ20iTgfvEVUpn9tKE03lqCZc1CKLJPk885/WlKdDZYAtjBSu/6kVK
	kttpDPWJS4kNjiKsTn0grLz7Qf2WfJIfiaHX3L5U5EPF8EEGUXURGVhMLbfTZCvHUx3EOIGzk95ds
	jEPKchZG2ja0Iufnx4hG6jnlq0aaFMt0QPWP80gcIW90cMRRpeC0xyFlVH+/j1tNwWMJAT/Zz/zI/
	4ubO8WIIwpJdlh3S/BnrcgZfv8yz3+uQAouAbDauiMbzKG0xF/Vy1N7BdOSe+UuiiBKSnP/vXPtMD
	S/UFwomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYk-00000004Ee0-2nAh;
	Tue, 24 Jun 2025 00:30:46 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGye-0000000GZgt-1yZX
	for linux-i3c@lists.infradead.org;
	Thu, 05 Jun 2025 20:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=x0qQ
	mkD815o36B/CBxf3GbNgkCrxbj8Aa0uApsHGYeU=; b=dTQ7x9VW8DyiF6mWre53
	kLAnYG71rIdTjSPu9CeV2IO04Uqx8SzyV/wUDTltYQITKwuUfw56ZySY296CCqeW
	p8Dd1/X033VfYfkZ/BPB9GYrJhWK1Q2F3qeZjscDB0ZCAqbIzrq4XJbWdW7h4XxG
	uKFtsNGQaRHeTLosa+4zbYjk47NU65cs3ylKDOaalGCi/fCFJSbJiTAOKftzRVYw
	BCpms55xb1+p25TMSLMR0O+UyvU873OvE5V4DaUl1PlX7qdnWpC7vrdhFJPyIe8E
	vNNFh3bOLWBJqu0dSDRmeMqxdAwtwPkUvrKwAXVBGvF2aTR6WyAGO21UqMEDhoec
	PQ==
Received: (qmail 1269126 invoked from network); 5 Jun 2025 22:14:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2025 22:14:10 +0200
X-UD-Smtp-Session: l3s3148p1@McGvwdg2OoAujnvk
Date: Thu, 5 Jun 2025 22:14:10 +0200
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
Message-ID: <aEH6kpXStLc0dWZq@shikoro>
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
X-CRM114-CacheID: sfid-20250605_131417_371152_FBBD2CA5 
X-CRM114-Status: GOOD (  10.41  )
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
Content-Type: multipart/mixed; boundary="===============9054231376605384764=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============9054231376605384764==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GXe3Ct2mLNY0M4s8"
Content-Disposition: inline


--GXe3Ct2mLNY0M4s8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
> > +					 const u8 *bytes, int nbytes)
> > +{
> > +	writesl(master->regs + REG_SDO_FIFO, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp =3D 0;
> > +
> > +		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
>=20
> ALIGN_DOWN(bytes, 4)?
>=20
> Do you need conside big/little endian to trim down data?

The driver uses the same code for reading/writing the FIFO as the
Designware and Cadence driver. The Renesas driver I am working on has
also the same pattern. Time for a helper function maybe

	i3c_{read|write}l_to_fifo(register, data, length);

?

--GXe3Ct2mLNY0M4s8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhB+o4ACgkQFA3kzBSg
KbYmSA/+IZXTuecloMa7I1/LbmBCQFy5sAh/vUPxCCGQUPFR6YJoIhUs+s7l8S60
Z5P//0BW4bh2/5sLRBy18SN3UI0ADP1dgeKaTkSb/fxTM49YUJEaS44MxKrfLN4Y
1g8GiTgx/GERwouQHQDHn/wKQ8ADgynJcoXEldLu6LqpYIq7rRKRYBzJuXnHgRgk
M3BK8sCOUGt3yU68DO/p5wHyfJHhIaVnP7ZyKFL0nNkfzoQZoz7x3xzsSNJhpUKg
st3J9Z3K1rFe6lBB1Of5WgxNyqab1GagJl5LkZznUqC5t9YCihxMaeovXrl6Dm8Y
U1rUU8+ddO6bcGE1cCYJAIAnhJj2K0QCZrFKhrcLqf2N9yRuhvRnSiJ/fD0gHVPL
4yD/J9bxLQgB++AFlgjGGpCmtSSuUDiYTl7SvC/iaBFb8lW6vFCGHX4ECANbPXA2
rnlsXWir4YaeLAaD6ryQpOAiTOhhAZkOXtLAPN979UOUPtVl/WkWPKx1YlMdDSgJ
s5ZhMRU75q8RLM7CLfoWokjj3AEi36fv0ebSPtUS05spiSJVJzTVCCYgIpoiCOPV
iTjl2VL+22LD/fw4ammODlx/dullZDyOHDqyA5esIjgqKtu8D2wECEsTCMqpV7cd
410fdnNrxP7UKRmPo8rVC4lY3PrWnHgzSZSv3QbikScKqy8rg7s=
=xqhH
-----END PGP SIGNATURE-----

--GXe3Ct2mLNY0M4s8--


--===============9054231376605384764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============9054231376605384764==--

