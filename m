Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF954C7EE39
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RhGvbiqt4BTrIc9VJ+VeFdW95l4ThO58W4H47XiH0M=; b=m8quzVD5tynWC5GFCZigPCw1z1
	kr8swKyD6DobmzaeuZcGItlApWNMYXCV4c0AHEBzEd0hGdeLlPXome4O1JkyujjmCAWsxgN7vuiVP
	j1ickmEUVGzfWXEME4TRY7WRCJ5/jTzCIeb1XrfGpHVzmPXEpKaE7y28McrEYSTzdIPhZY5tS2c9m
	sNIGUKTPZt/rVUWg+ym5N8ttyXZTQsBUIJLxpPqdm4enjQxqtJfIVgRLqWerYQW/Q93lKL/kg9AFa
	aX7Zyr1L9BywYcAX2894VkjERwmckJCj52c9NLBUgMJ1gcqwIDr500ASX8/AwigIa6EVGwj/Ah3n/
	JesNa3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYu-00000004EnW-1oiq;
	Tue, 24 Jun 2025 00:30:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSj4v-0000000Gb8i-35EI
	for linux-i3c@lists.infradead.org;
	Fri, 20 Jun 2025 21:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8lxu
	UdfMEVpUA9WKW783Zvq4WYwtwx/QH0Hphie6PRQ=; b=ZSQZ9JybRyzcQ89/64X+
	at9LtTjr/uZxjaZw+vYYPZ8hPzVUHcgk7kZ3w7vAlQCHPZFvg+JBSSNmNzlLN6bl
	HJh02D+eua8XD9f/HbCFuFziyXay/5JU95JUUFk0Da9Y1S5rUEZkE6aTeS5KrHe+
	LtD/KzBWfvZLBpbG8mslGuTwVW+UexCrd/x5SQlg5cdplLGo4Fqwt0e2WJBXiQDY
	jxxq8n7dwNxoGG8ZOsA5uPXPDJ+/D5KF3jm+bjHfJl2VTUSEgN9CtZtrDElv2w+X
	UKkQ8Yiji2VmMBCE1wBtsy/TK5f9sf6unxLqepIOqPsUe7WwJ1tGhAH6FcbXNK75
	Zg==
Received: (qmail 2837631 invoked from network); 20 Jun 2025 23:15:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2025 23:15:11 +0200
X-UD-Smtp-Session: l3s3148p1@StF1Wwc4UMeySS9C
Date: Fri, 20 Jun 2025 23:15:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
Message-ID: <aFXPXTUSvgj-a2zC@shikoro>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
MIME-Version: 1.0
In-Reply-To: <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_141518_651442_FFC022F1 
X-CRM114-Status: GOOD (  10.24  )
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
Content-Type: multipart/mixed; boundary="===============6227890603089354970=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============6227890603089354970==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r1jy/dUWgI+dUiEi"
Content-Disposition: inline


--r1jy/dUWgI+dUiEi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 06:54:59PM +0200, Jorge Marques wrote:
> The i3c abstraction excepts u8 buffers, but some controllers have a bus
> width of 32-bits and don't support flagging valid bytes, so it is
> required to read/write long words and to use memcpy on the remainder of
> the number of bytes by 32-bits to not write/read outside the buffer
> bounds.
>=20
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> + * i3c_master_writesl- Write bytes to long memory region from byte array

Frank proposed the name 'i3c_writel_fifo' which I like a tad better.
Opinions?


--r1jy/dUWgI+dUiEi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhVz1gACgkQFA3kzBSg
KbYCYw//Si5wvbmKRsavLRhwf93Y+rnT2QVv88eLVA+Ze2BBsONMdNTYFLoleuXZ
Rsxe4n0FSB5YUXZcme4/AAVMD7ONaush2WnaQyJCb9u361WqqtJt7i14u5sTtlP2
WdtICzW8U0LqzI8uQN875Jrls1f1vkfteENskR3SAIttvEogn/OLfjRUhoklAzqL
or1zlT1MHyKDU/OJHTwhiFcFOH4aKmTnN8KjufgHx9BuvnjxeNh46rwusGPwyG61
kiV1+RCIJ776Aqto0Ll+33C+MUsKH7eb+XnVZjCL0ZCly+OzkEsYZRZC7rCRqIBI
2/dHX0gpy62iNPODFJtJZzQsihED6doXlwF080kVYVIn9MedPzpx+MWp+qj+z5SJ
UXc2yYL2ll8u6VRQ4ObumwtHXU3Z3UbGUsBLNervPbP4Yqx3QAJ7cmv1tRFSHLmC
3iahXiag8+BFPUG3w9BjERF7DIt53GIu3w8Q1VcRtyrDP3qjPqlMXaFRt/xRwNFO
BPB7SL7e3oVnTiG86X9ztl5fGlQYlEJU7wIMblF3LepdmFZ6UvZ7xOJWUq388WgD
0GF8tLemP7inKHpHbzG0LLIlDezZcVntd5hYgIRTR26XrxloKgHU2m7iT+LKWKov
s1SiiW8LlD55Y0zxZednF3p8CEvh/imIdfUtBLPEWq3dNhJngP4=
=3QT3
-----END PGP SIGNATURE-----

--r1jy/dUWgI+dUiEi--


--===============6227890603089354970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6227890603089354970==--

