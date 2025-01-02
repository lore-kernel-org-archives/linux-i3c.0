Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C4AE7719D
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yu3xXF3W/GcANcaY91RueH2JYIlCnutjZZzyYexQUA4=; b=d06HCVCcg4wtpMai39lNGZYZMy
	ALMmtHd5JG8KXLR1xLoC/lOtQpq54KVDbN5Wx5YCU+WxDXp/4QbUGf2+DYnrPxM0rxAc2k66mn//y
	Ff3JdS5xdRN1nfYyNYoFF6fFI1zurpTZRrFzQPzlxIzynk5TDHvejKjzGw6ew66MKOe0rvi22tWIV
	GYWZY5Qv6A85fNykeJoTlVzVM1ziedHI8mzh0zTCTgGLkw8JyU4zGFG8aeLT4TThy5ObST7rxRsLk
	yp8bZ5Q9jSsSXmLQ/jpwQncW43O7M2mmzHlZVvtdx88JqF+rbwSflLQvP0hehHGK+0leOYr4WmqOQ
	FT6Lr3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2z-0000000F5U4-1Bb0;
	Fri, 10 Jan 2025 11:19:25 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMTU-0000000AcwX-30SH
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 14:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=StcD
	F5+7kQlxPYvTykrwHF3Sr4p4uG65z/KjwN/9j4E=; b=RJmZSppvOwe83nqH5trG
	kl3+6oWLGLXhT3Hge+sEVlJMCSgp+QGuFKI9ygD6ulqDoyk0rI31dczORczoX9Oq
	ipbN2RO+unIUIoe5lR+VGb+UawzRFb+Ea5p10e66mpDRvMLKj0B11pGors77Zan/
	qavCyM8TsiYQ83i0AZa0yg6lhJw27GW/+s470r4lHuHTU57ltMBr75rL21lB4TuL
	9TC29tDCsjSfyzxwkRn6RBViwsRaxQ/rpJm/XvqIIYjrpLL6avb5ppyv1wmEk2e1
	vGwtaaw1Cm77dn02+dH4Ka6enXtx5lrAK221AEXPPtb4PUVyvQOPMTX+A6/uLxE3
	SQ==
Received: (qmail 651281 invoked from network); 2 Jan 2025 15:46:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 15:46:57 +0100
X-UD-Smtp-Session: l3s3148p1@WC7jO7oqGIAgAwDPXwckAOCWr5vU5gRW
Date: Thu, 2 Jan 2025 15:46:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3am4CLTgidnFmTP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
 <76f97f65-28ad-4d7f-894c-e2d1f241e973@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <76f97f65-28ad-4d7f-894c-e2d1f241e973@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_064701_627880_4A0C1426 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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
Content-Type: multipart/mixed; boundary="===============4964631083857675943=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4964631083857675943==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ePuQ7l7ANqBwk8t"
Content-Disposition: inline


--5ePuQ7l7ANqBwk8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Please rename s/get_parity8/parity8/ also in the subject line of patches
> 3-5.

Oops, yes, will fix!

> For this patch:
>=20
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thank you!


--5ePuQ7l7ANqBwk8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2pt0ACgkQFA3kzBSg
KbblUw/+K3Fvfj+Fzt8Qr+cVqEWjfZsGNK4byBMX7MKRczt2Y8vA9ejviDHJp99k
O+R0qNrKyXt5ZubBqCQAls3doSTMTv0LLFuPpgrn0v+5UZgioEtK+bt4dd0rGp/z
/OdLnMwV7MrE3Ck6YL4aaCSJOU4Y0499f/eWHaYBvth5ZnzxPU/zT7LBqBzTRMtF
f1gsbyKfauUqgl+JD87wJ4M0tKBP/ZjTFg6kOl8V87pVKFkwTIECz9kYGZs5QnmR
07ylMBLMS7jTWtj1Nwga85XgzW2HCuy9dj1g7KRNsA13Hlqopq5WVZwAAYyNb4Kr
bpzQTaM1UVIgn3bsC8xHUR43WZMtNKxDTZ9EPWebwETwzztp9IRQ4CxeU7BXN8s9
ipa/KXb5bxbrRT0MSCaKZ1NtNKTSO52VCaPL9cE+hVkpTUHgbOqaCgeYP0JuBs5r
tONRTsz/a/eK/a9RvhwyhNWUmK8Q2Q8GNoB8qtlE5zcxVBfIld6U/Bs1cUp+tucy
PFXfkEXDt04JL4ZmgVSaGbIHPQZR2B+54zRalAyBUJcZpvPURKOY6YdBrQ/l4bFB
AJk2eMHfDq2Q1WdOAfFjyIJvmMb6hk93X3SudTg/zOCKtFpisHSWupzkyPE+FjnH
E0vZ+0JrVCm5EBhP/0m1Tou64E1C9HeqeOuNg/TdGmJF+3DHVmU=
=B5o4
-----END PGP SIGNATURE-----

--5ePuQ7l7ANqBwk8t--


--===============4964631083857675943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4964631083857675943==--

