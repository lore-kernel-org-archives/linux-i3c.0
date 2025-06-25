Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8780AC83F04
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPczyCx+LHjNfFZav+CGNgwC+pzdacv87Ir5dTLywvQ=; b=ZDaCfJ27dudJ5+1kt94tjS6xRf
	5UB+gWdV4/csFTsN13W6HFC+/N3ThVB5JbdkJATA7WG2Fc8za1Xse3R5vUyrTQlZrhX/2dfdrSsVY
	uPAZBm5W+y+U8cXCWi1u0NcKjkJPn6dVGIs4WlOdZVuvtNqj6RsySu3saspeQgsoUydP7Wnt6je3B
	D2c5x0YHVAT4H0/HyB6ui1NgYJ8BDvN7QstxmteQSmJ4qTuj6NyEJigNos738x/KLNGYWiIjxmBlb
	AjVsw4CuTl06ulAOqvW771Jqhnqr8N1uSnpDSLUVQODZOJiypFAxzkrn6pxywSBsqqC5c9cBaOA2P
	HMuveZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bS-00000009f5G-13H2;
	Wed, 02 Jul 2025 22:06:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKWR-00000007oT6-1hIu
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 07:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ggHW
	2tGXUpjDd3Eq6i8DXWy8N5KdCD87GNfxMzC0698=; b=JkQktgIwJEK8ksTB5Tcy
	+Q6LheG+7zZU1jFD9/0ryhCA9m7m0vLgslEUK3Bqj0Vi2VAg/0Dhvo05LPnU7f6M
	7UTPfcF8JKolEMectzcauz9oaeAIXLRGxT02fRsXnd6vCt2aGE7gqZfDuWhVmPTY
	/nAH22ieDjVsZjv4U2Vef3UjdGYgz1GokhJNjmXXu1Du3kltVVpQ5xMS9SKO52EZ
	X/G+Xu/zm4oW2R7iXJo5ZNfwSXXLq7ca7HOlVzWj2HoMaom6FBJZaLuMVnOQONzt
	LufIe77/A/CsWxNuCgoUEpZm7sWA03GOAtjyW7mn0Hgv1aTdI+T1If4btK/CC8zS
	pQ==
Received: (qmail 547658 invoked from network); 25 Jun 2025 09:26:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:26:17 +0200
X-UD-Smtp-Session: l3s3148p1@155GXGA4HrJtKLNf
Date: Wed, 25 Jun 2025 09:26:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i3c: master: cdns: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Message-ID: <aFukmFhJUCeRWLU9@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-2-63ccf0870f01@analog.com>
MIME-Version: 1.0
In-Reply-To: <20250624-i3c-writesl-readsl-v3-2-63ccf0870f01@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_002619_727999_79AA5A03 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:02 -0700
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
Content-Type: multipart/mixed; boundary="===============8481763522468801555=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8481763522468801555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SeTz2P++3ECJKrVD"
Content-Disposition: inline


--SeTz2P++3ECJKrVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
>  					  const u8 *bytes, int nbytes)
>  {
> -	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp = 0;
> -
> -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> -		writesl(master->regs + TX_FIFO, &tmp, 1);
> -	}
> +	i3c_writel_fifo(master->regs + TX_FIFO, bytes, nbytes);
>  }

What about getting rid of the surrounding function and use the helper
directly?


--SeTz2P++3ECJKrVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhbpJQACgkQFA3kzBSg
KbaAog//TEjzg+Dg7YzE6khvyli0iHrL/OE/JvSH5WnH+VKEVxqVMjTEETFQYY7S
CL6IUwveSAit75VPrCNlnUCrOQnqpZ7rTnhHocR415otKxBbfj45yE/DE4FZdnjZ
pK8oEaXrGvoYqywh7fHakBXhwxpT7oWNVzQW6DxNLkHIthRBVBJwKqZPMN74m6MD
JBRM5V9wxn1/eoMAH9kMCT8F6KKG7tqbcWDaPsfYlw6Bi7cwyNIVdXQ4IjJTXJLw
kHqay5CJtwjrpajfjtbF+sagQ75JuV6OBNP2Nsk02O5Tc+vxNlRnllbn3unPFBLr
ylLrcTlV0m1gsHQ1KGsjXovWHpq0p6bk+iYk8Hdy9900rUg87gegLHkj35DDnXmA
mNm8PCZqSNJ+tEg1SPTNvDhflnQdyP7ARb1qVGKEyN8pBECX8lm7quxUKB1cL2be
ewMJDQ8G8ADgHNtq4jzbQS+TkyavGrDt/ndqgMIpZCloIss99PcmIo8O+QAmpXQC
NuLQRAAk7buatljx93D+gkntY27Ttooyyl0+M1vcIGoFox4CGZQMUNiOEwmU/DGk
G4eF2DSFFoiTpkaE+QZhg4tN0m5yBkZM+VBPLzNTzTScD24stk4P9tBus/6J13z6
Vmaf0FnkMdey/JwSei19SbeipZH3K6fJ2fcMChkL2rEr1pCzoOQ=
=SX2G
-----END PGP SIGNATURE-----

--SeTz2P++3ECJKrVD--


--===============8481763522468801555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8481763522468801555==--

