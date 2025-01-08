Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDBCE7719D
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhSsFu2YhOxQilOCG66Le0SQZVWG1Uifk+UAHSz52oI=; b=ndWMlCF9UObz/U1ng/RRhfNz/E
	5FFqIE+qJn81GRlNtpvvK0f23jaC+RCXDYGLeqs2SaZsfhB+c2bf/9Ovyf3qHOnomOnBzgAeHAzH+
	bf7PeIcGWZeJ7/33l8KE0zi9sI5jEWtrCT6Qn5Kvk2X/9PGQsfhzds6ffr0ui/oYUpfKCXlYXx0Bd
	ZFVs5HZuxgZgh/ubp+djZJzFQEZz8xXb6UO/r3dlvuFirbVpAwQR15BUBUxPCaEuegatLGLWbG4os
	uGB246Hj+HjZEvH9Q6zPlrODjOONstmHHUdwuPuBEbjAwrUPlZ5BlGsOg3uX/DqYhWkR4iraKlyvP
	nPNRPq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD34-0000000F5ch-3EPF;
	Fri, 10 Jan 2025 11:19:30 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVbZ-00000008W6A-0rdx
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jan 2025 12:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8cwn
	6E6/BQ5Z3XCruuhKDbe6JqWw94aMY9yC8bF2a8E=; b=FeH+qqjeSQDz96p50uqC
	ErEJXc7+5dItFp0GlYk7+LHgxIOfPBj+dJuaIa2NvdWE2PX7sdOeWhabQ+9XdEXs
	wZeFvMDXgpSf4rSSvjbV1fwzhgICA9aj4JZuesZtWEojpMudjtCGG4htE505Zeok
	BD2I1OO0CyuMry6e6DG0l0wDWsH3413ixyhyXu89htITHkARZ8QgQQpQEB0upyoy
	BI0pyf0d9FibQOw/hz78vs51T89BafipbmenSRol3YnWFSo5Wfk8DHdZUpIekLf9
	t3SlKNUDKDoQgfvx5XUosjFEyLSMlOA6XNxSyafyKv3qnWRxKWUzrz/pvB/+Vx9M
	oQ==
Received: (qmail 2576107 invoked from network); 8 Jan 2025 13:56:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jan 2025 13:56:06 +0100
X-UD-Smtp-Session: l3s3148p1@/hd7YjErpIgujntM
Date: Wed, 8 Jan 2025 13:56:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of
 open coding it
Message-ID: <Z3515cBvz3yChGoL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
 <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
 <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_045614_122817_A8B6E1F5 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: multipart/mixed; boundary="===============2728806418533813947=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2728806418533813947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r4mfttq9c2W/MPk0"
Content-Disposition: inline


--r4mfttq9c2W/MPk0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Stable rules allow also cherry picking additional patches. To me picking
> patch 1 and 4 sounds better than an intermediate fix since bug has been here
> from the beginning. IMHO not so urgent than a regression.

Even then, doesn't that mean that the series needs to be applied
upstream first before it can go to stable? How to describe the
dependency commit id otherwise? Either Alexandre adds this when
applying, or some interested party ;) sends a backport request to
stable. Or am I missing something?

> Looks like we have been lucky. First dynamic address is 0x9 and previous
> algorithm gets the same calculated dat_w0 value for at least for the
> addresses 0x9 and 0xa.

Makes sense. Still not too many I3C devices out there...


--r4mfttq9c2W/MPk0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd+deIACgkQFA3kzBSg
Kbam6xAAqV3ZgKWTA4vjFGilGyaNc2uygT4v8V3gvnfv4Omak2REUNovVrVXTIqu
sBP5M+swh1qCYDK4r+xGfw5X/D6luuddODEhbqyBjxY4qSRe9CILwpC78Yu7AGIX
OXsvOlc5jBfqMXgXbbsfJeBfI9eKPycVNuP4OnlSsog+1Z1NaPiFDCQrJtWRrqA/
oDCbPpLgN5juTt92JDQbjnCiLRWGMLj7rUdvN89RHpcVDJw5XRKfsZr8VyGra4Ww
pl1F3WW4H+n/C3BDSc9Ursb0XLK33ELvsmW7EvEerMO5rzkxCDWh6r1HzkL2QJ+h
Dhr1+RCGWDevVw5hBLzXsJlGrzrHTzhyE0ZKYxtez4+2oI96lHGoncKoqJxiyBfF
eAqQRLi6Ymt/3UBWFgruWLy+Jw+oib7rrD+hqXrrGnnJaygGqLQxaqdoMJtiF3rc
x4n2HV1+UwbMVldjlLj95Om5GrR82Y+IwbWebe4WsXdZHITkgW1RsRL91MjX8Pqo
FAJSfzlACCxNA1L3TV7iSAWDmwUEMGraj9xfBqDGt4eRCocClTqqimwqZ0Hiz66a
WaZYL4gJ836CpgGWthl6BDvE+cEQjvDdY93bs9UoZkQ+8g/lIhkQHNjj4TlNTE9i
BvNnncmFWn21BbtalC+ZXRBbhcITBSa90E0UIkP8U7/5/Sx1VBU=
=VaP9
-----END PGP SIGNATURE-----

--r4mfttq9c2W/MPk0--


--===============2728806418533813947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2728806418533813947==--

