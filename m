Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A0CC02193
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNA8tu6IGR0DipmuEwnCiYZI5oTKNtbX5OK36kpjRfs=; b=DU/vh2Qzly6R0U9jeiXmlrFbuF
	FrL33YC4FiAD2eUjU5K8PvEN9BxSs4OXWjbtFeg71roUsh2kQ37VrUv/tnl/cl9jeMlGcUUrafURN
	w1rwF0KO7yGp6IB441EUfa0jdqwN5LJ3oNYZ5XLowmt+MMbJOv1GwFq8j9jyyqm5AgvxVdZkGKBVB
	cDfz29p4TqZA3bBgFoHa0PrfT6Mcd4fvF2xAzqMNMxzQwBH4MmGPGcAqlNm40NdywY68DwaVdGUVm
	o9mFonfhtnTNxMeBw4vSVk0KCm9oMhHxo9wCJZ0wFqAd0W4vEnQaDa/fRX6Na2Y9W5xjiroZkkLXF
	IEqfovDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdElr-00000007lMn-27rb;
	Wed, 29 Jan 2025 20:34:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taMa9-00000008tFm-2Qh2
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jan 2025 22:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vF22
	TcZDK3gDIMGnmR/qxjIwejEAyGibsrd8qdp1Aik=; b=IF8ZHHBLYXWy0iEGQTM2
	tllDDtLZRFbjoG81kYUKsAk9B3IkV4YHYmXN2mukoFnrOTGnCxxWjZd7Wvo5CJSk
	glOLeN6Jm7g/JmRtliO11zCYWD5FO+K441M681itQRLaZR2zJNUDWBt0sCS++6Es
	3lVcnr7GyqfjXNC5EOVROpZwgRMuT7qdB+Y8xbw9H7y1C3p7X05Bdq0MbkcKQ79P
	k/OKegc8yTMCxlqP2Fg+T00aFyBXD0PcfuiOVLAj9fmk+1GPj+rrXGbWgF6QW8iH
	7VaYC0DuBne3hm6rKYvD7pP0l2OCBcBDCNirjEwkB506AnUaUb5DqxDpRMPugSmH
	Zg==
Received: (qmail 2648197 invoked from network); 21 Jan 2025 23:18:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2025 23:18:43 +0100
X-UD-Smtp-Session: l3s3148p1@I6OIwj4sOsYujnvm
Date: Tue, 21 Jan 2025 23:18:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: alexandre.belloni@bootlin.com, pgaj@cadence.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, xiaopei01@kylinos.cn,
	Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <Z5AdQ9UZWbW_1Dj_@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	alexandre.belloni@bootlin.com, pgaj@cadence.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, xiaopei01@kylinos.cn,
	Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_141850_487046_89E9E5C8 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: multipart/mixed; boundary="===============4998083990959614080=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4998083990959614080==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5F1Lnzx5VCOxxxIV"
Content-Disposition: inline


--5F1Lnzx5VCOxxxIV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 07:07:55PM +0800, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Makes sense to me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--5F1Lnzx5VCOxxxIV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeQHUMACgkQFA3kzBSg
KbaCVg//Y+R5V62Gbxfxz0ZS264Llbf4olfsib8/cbhlY9NHAQ2mg75Agj5xpL5r
bLbcGgWTBTfCBnUPCOPRUz4vcEBbpW+oxjGI7cdeMBMyjRkkIJ3tu6gC0fFCUfq9
uKEMwp+KYEQcNpH+Y8hlq9wwbOth1XkOajp0+AsesBADLGd0BNF4sOk35jYz/a2U
/gxL2Ys1ePWvUEjsYhYb0Q6GIrnNh9YL5yQLtIv75MzpSX5AJe15QD4sPhCA6O8Z
rqKLFP2D4YnTRjmInCNF7ej62vk+J3OyuthmlSt/lEoJkmssAOJeE8HNW46ObseQ
rKxYKnkH/3Z/XKjWFlIIfeonl25uyLTyP0NtL1gDmZwn0XQcIjmGbnJzo2ZRs/mS
npVaYtGtRcDyaemMXCV0D4ZQDbcwjeAmA2cKz/bgqbLrORfIb5RoZ1VfUPyxB1AU
qoTbvwG6jwF45Md46fx2IRu52O9ekQzTFrwwDOV2zYua5jnJUNiBaGAYdipPh65V
7KP9dwFt+MKSij8eQhwUwDe4uTXtc+FozvoD4ZV0VWojiYigABvnRW4Qi/2AtDu/
dXOv2ks5hYAVwOUWlxpu4KYbkmSYKPFfw9WG1aiiK2xJU38nch/kwScw218f/YSv
PdgqYCssHR8JmHZNKddc9vvQK/cKsri3fyQV4dQaHZvRTMiJi0M=
=5Fo1
-----END PGP SIGNATURE-----

--5F1Lnzx5VCOxxxIV--


--===============4998083990959614080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4998083990959614080==--

