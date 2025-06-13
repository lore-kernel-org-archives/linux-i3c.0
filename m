Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EAFC77B7C
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SX6Xeonhl51a0iPz6G7jKluyi6499exBR/T2C9492ZE=; b=MgmQhINll/7+Fmy/QQ+446GvHM
	tXIdApw1Az2kK9bq9KNoGMYMtKE4YP0g0ZjBDqRFSd7oubl4VwuGHl/J+Z6kfRjxJBuX1Ct2/JFmi
	S7XC50iXrYwmRh94CHzNL/c1eMfvDnvdJclIvRdRI6JvkLOSQAI7fWPmARaB+cV4woj4tlauYa59C
	I2zpaA2G6xO9qdG6b+yVmHu6CXqgFYJ284s2IRgrxBITlk4dJjQl9fXpIqNjeF8fXpsAYUoRGc6T7
	1h9pV1VOCbeG2MyIumdzEtyY92aNz+hn9ldc8MKVRVAer8PMP2p+WgMGH1UB57bx7VZM/YuOwUCAr
	fZKWb9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYs-00000004ElT-3zUO;
	Tue, 24 Jun 2025 00:30:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4BJ-0000000GSfk-3cvF
	for linux-i3c@lists.infradead.org;
	Fri, 13 Jun 2025 13:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=l0Vg
	yYB/ZSw1IAdEkULqtGq6LH1Skbo3zycVkQRMxtI=; b=LWN+jg3E2eQbAW2r+yhd
	O4Bpm/CZgezWtgvbbg1GNKBXfrJPM/qTnHcQEFtjknfjQgkztR2GXyalOYamHmVg
	JENDJejLMPtmZBLjWw6BCK7dFMFcsrI1vc/TliFCj/3sKT2iXN5X0UGbuTwyLl8e
	Q0tKis3epiKb2rxmJELqM4eRUFhA3Dl46nDEUX36/Mss6vi48usvrGBBaL4SbdUs
	nFpHs0EAxf85QbBTgrQ17711Z6VsW6X03T6YQCLPvD7aXXakX2wkvrfS6/aiEySN
	8+juIEnVcKdUHPJoD5EUzaZu2+AvVYK14rfaeqTc8m8rvBrgiF71iRE180BrSmLD
	bA==
Received: (qmail 245682 invoked from network); 13 Jun 2025 15:10:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2025 15:10:43 +0200
X-UD-Smtp-Session: l3s3148p1@/DwExnM3jrAujnsC
Date: Fri, 13 Jun 2025 15:10:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Message-ID: <aEwjU-uq4XsNzrOO@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
 <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_061054_764396_3828AB78 
X-CRM114-Status: UNSURE (   6.17  )
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
Content-Type: multipart/mixed; boundary="===============2692289422210786837=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2692289422210786837==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X+Zw/Ma7TThVuQ+w"
Content-Disposition: inline


--X+Zw/Ma7TThVuQ+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Perhaps your overly-long Mail-Followup-To:-header?
> When replying to your emails, I always have to prune the To-recipients...

Let's try if this comes through. I told mutt to not add it anymore...


--X+Zw/Ma7TThVuQ+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhMI08ACgkQFA3kzBSg
KbYZIhAAg15c5Y44NP6UIZb08GFS9r8HIOSlt3EgKq3SlKYplf47YWrNic/AGYCo
bri4irl5GndW3ciIjD/wEA1O6l1wBV2NC6ebi1fcoImqAwVB6RpZa/5CtRC1iIim
YUrXnte0RfKpcKLWBoz/40Q32sSM7Muw+w34d/rEsPEC/dehtf2ePOsjrWhSEP95
y/Qd0T19GVW0py+aDtqyXSwW/50PgWzDD2+BeHiMliTV1+XO40DgxCOJ58zWKtdq
QtDvI5JwK8yCEayVea8TDZ6oNiXjfHIPpbkmYJGAU99DepSNI/aaXaLi+G769ju/
hsDmlRHYAOn833tI013Bal1/qeWD3/GxRlOUKucS7+6Znwyq9tc51JJbtWFPYuad
/TuGwXJzqtTs/dpkIiTOlC7saiJCY4qqYhroyHqN1ytCSyMPBorC7LSSSjuk6Kk4
uJlAR+feS381I/URq3DAwS9aDBg7Z7INHFqh3Y/9KOjZ1U2wSsQaOuYY26XKsgb9
zMkmmWlD5F8sOY8pve/JdaKRphMRHDz6I6TQJ603S0dkmJyTPAf4rh5Kji4dzG27
b3f/lSeeQ7vlgmtP8xk2G4CRQoHWtQi6/jSk6n9dUsiBlSDwAOQgYe4HLz/RpKUy
QuNxGppKdSU22gqUcjJqvbT89Q6AnnGJ8OKs2fN+SidwUknFxuQ=
=5whn
-----END PGP SIGNATURE-----

--X+Zw/Ma7TThVuQ+w--


--===============2692289422210786837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2692289422210786837==--

