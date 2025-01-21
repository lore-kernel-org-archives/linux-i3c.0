Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A43C0218F
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qo5ioS69lzKOe92FSD/HBVJwGDpzlfL4iUc9ERPijQ=; b=vSKA1gtaCIWIQoaPcSh+/b+SQ6
	bfAVXHodzTP6V2LgKTvF84dF4Yv+FKRg996XTti4wnpE2gNrrxBerKZ6pn/rvmWKS5hV4YtHuM/ED
	AqE8J3F3aGZRl7zGzEXjolFI2A8ushhLb/JK9btXntiBWK8eH6dTj1AqIruhOAYWfFLOL+Lt4LyAK
	JH7MhQtDJ1rU2r9Jz4Gj+w7rvvOPbp9c6vmGsxdCU5BNpMIckfs4TDo0DvFRgih7qRe3U+sNlYSFr
	PFO75fQL2GZPj1D7N0EOo1namgT3nSA4m+Vn/nxrhg+ugeXbugcFmQB0jdRKyKOI1NjEU4/xDN0tw
	X2Za9CDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElr-00000007lMu-3R3O;
	Wed, 29 Jan 2025 20:34:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taMan-00000008tL4-0dxT
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jan 2025 22:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=P0BO
	rzLK5T7sCCldyX9YDIuvcc/Xvl99LxCDIMYUTHc=; b=FvL1w2R2HqqA0s5rK7d2
	v2vRVKrN17G1hmoeGjAZcyb6cFCU9cCzH7ZYuAJaLRwoovw8xAEjBswfo/YCLphU
	a/tz6U2BVm2QR+jg9PGGiqOla//JZHUuCAM68X7nD6jqDZZVievnMM4OlfKWHERq
	SpzWz1WwtCtxlxkmhsFKK5Nz/gF8xrPJ0d1Fh8moKLjc95Y0aIAZQg58SnvaSmni
	mp5UBZgt9Zo+Wl6Hg97Om/z0yBOi4ttku5oUFiXH9Bh3MzGUjQU8lz0LFpk7fCt6
	lUiH4sahzde/6wdGrQ6Z6mfxzKRQzFun1jL/ePrV+pheW/l8jaR1WWnJLQYP3CV3
	Hw==
Received: (qmail 2648460 invoked from network); 21 Jan 2025 23:19:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2025 23:19:27 +0100
X-UD-Smtp-Session: l3s3148p1@bM8fxT4saIEujnvm
Date: Tue, 21 Jan 2025 23:19:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: alexandre.belloni@bootlin.com, pgaj@cadence.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, xiaopei01@kylinos.cn,
	Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i3c: mipi-i3c-hci: Use DMA-safe buffer for I2C
 transfers
Message-ID: <Z5AdbhSetlHIqAEN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	alexandre.belloni@bootlin.com, pgaj@cadence.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, xiaopei01@kylinos.cn,
	Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
 <20250121110756.214714-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20250121110756.214714-2-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_141929_468936_377C711C 
X-CRM114-Status: UNSURE (   6.56  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
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
Content-Type: multipart/mixed; boundary="===============1723758682388413998=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1723758682388413998==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AvCCbX8fJwTRM5lD"
Content-Disposition: inline


--AvCCbX8fJwTRM5lD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -		xfer[i].data = i2c_xfers[i].buf;
> +		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);

Where is a 'get' there also should be a 'put'.


--AvCCbX8fJwTRM5lD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeQHW4ACgkQFA3kzBSg
KbZKFA/+MZ5EGIOy/WR8Ob6WyncHFrBtr6HOsmTdPyizY7IyHOLlcJerFjABdeT6
xVOiOiqWSpzmWH14DdZ24T110+CFrJI6S5rZ2XhVWSEEIaPGIZZLIBWuHd20nLGf
fT91WvvH/CNZwTN7NpyLmklzNeb9QVCUMh6N5W3zXonyGHu9kE6KtpZvOEdcT9kH
Ibex1u6KpYuxmcCqGW3itVXOgscUZ4HtKKFFiFasL0Et6OVAgQdtk9fk0/ycwnIe
gNFNtkaQNDSOigq5R26ENEuPuyn6s222GGLLlpMtWbxMXtkKahBG+ARwGKMZW2yN
CNpHjabhq29xI6pR0dojqPrl58Gvwh0OD6vg69cYcVbxl2X/l9oxX0BBOf81siQV
zMOFgE/VHtrSiWCt0PaIF7hY5JNfkHKYhAlqKA+e3+VtDqot/A8u/DGoCYw6gymL
qLex6tiGNkMkZieKg7uM/HPQZX+NwY+HOuneqf87KrqMkJSkRnQOkcjXXxcMfoPV
Wlh6kyrTE32/M2pOqelvVaCK3Xzn/UPqnWQGZhqZOq+foD+b5rYnC16uBRGg1vwb
6+UFhlLAGUhDpDuqzw1p4bln1cW7ZxGcG140Nlz7Jv5GCeV6YgTXzTJ9MX5279+o
+bNYfmYckFupvL1wN5/DgRwO57fnfBickHTsGL9jy+LDfFGiQcs=
=dguV
-----END PGP SIGNATURE-----

--AvCCbX8fJwTRM5lD--


--===============1723758682388413998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1723758682388413998==--

