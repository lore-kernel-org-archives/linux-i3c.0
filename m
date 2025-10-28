Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D76ACCF9F0
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Oct 2025 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJszsTiUMIm4vwaqIjJRMigwegiVENG01mea0TeAMlQ=; b=oi2Gw43+F3+vw3VJIuFT5Cq2UF
	DW1lkZO/XZQi6g+nwKrKPxom0usBK628kmC1V3qH/E2cUAbHe/I/raT+fNPfBxQNxyNwN3RkbkMrm
	gas3tiP3AUNqo0wpD/R6ItfKa7sI+xkHMvDhPtvxpYxBkrcN85CpdWhCRjOYU+hVn1Gfi9M6A+Bod
	V5sSuFSxeM5F6gN+8706em8/PAvCFSpy0iTPgVHEMm8WbKaqI3yfMxT7Gi5z9G9kK2wHT70ZD8CnJ
	AXbPgg7iu+i3N6AlgEFUXThARNI+Y7w01iHvV+wfYzubYL7Typ47h/j63ce570xXNs8YVNlOfrTIz
	znZMH0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES1t-000000048sM-2xzV;
	Thu, 30 Oct 2025 12:45:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlLC-0000000G9Pg-19l0
	for linux-i3c@lists.infradead.org;
	Tue, 28 Oct 2025 15:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A54004358E;
	Tue, 28 Oct 2025 15:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95680C4CEF7;
	Tue, 28 Oct 2025 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761664229;
	bh=8YthI3p1g8E4fGp4lN5pfwCWiXSbbb5wGc582EqpCjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwa51bTiOrIpGOHkNIBEiX7kP/09KzLNe5W5S31eEiwfmD2aXj75b3LAjIsTM0km0
	 DcNx0qiQjL/f+WQKgxpCe7o7vUEwhfFzm/VmSL9vHOduWKVbbKx196ZU4usyr4qWXe
	 xRdTnTG3OgrQvQ/gHi3TYi3dR6SHMMkcYnsfmD7X0RH2+9pPwJi9mLJqMAf0Hy/chI
	 5tAvjKN0PWaI2XbqcCCu81H4SEO1H4kLVbciU2uzCDOlKsiwwGzbGDCaOb5t7PXhHK
	 AlCLB6etAT13QKtzysET120YKJ03bOuDWj+rYOSi/GO5FzHWwfpxB0zCDtn3hN63tc
	 lRi485x8qeYRQ==
Date: Tue, 28 Oct 2025 15:10:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 3/4] regmap: i3c: switch to use i3c_xfer from
 i3c_priv_xfer
Message-ID: <718f4e83-48e9-408b-9569-42769f76d302@sirena.org.uk>
References: <20251028-lm75-v1-0-9bf88989c49c@nxp.com>
 <20251028-lm75-v1-3-9bf88989c49c@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20251028-lm75-v1-3-9bf88989c49c@nxp.com>
X-Cookie: Your canceled check is your receipt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_081030_335457_4D78D3C5 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 30 Oct 2025 05:45:24 -0700
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
Content-Type: multipart/mixed; boundary="===============1289425441946819987=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============1289425441946819987==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dGU0FRXfnJSl6dVk"
Content-Disposition: inline


--dGU0FRXfnJSl6dVk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 10:57:54AM -0400, Frank Li wrote:
> Switch to use i3c_xfer instead of i3c_priv_xfer because framework will
> update to support HDR mode. i3c_priv_xfer is now an alias of i3c_xfer.
>=20
> Replace i3c_device_do_priv_xfers() with i3c_device_do_xfers(..., I3C_SDR)
> to align with the new API.
>=20
> Prepare for removal of i3c_priv_xfer and i3c_device_do_priv_xfers().

Acked-by: Mark Brown <broonie@kernel.org>

--dGU0FRXfnJSl6dVk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkA3N4ACgkQJNaLcl1U
h9Axzwf+Nts9b0hUZDWoyFrOrpdSY1gklGWScN2Fks55EWfvF3VaTQcAxgCJVAAg
9r7n+t6WaZ8GP3AoLKQiVkfWG7sIidWAblqi3STK4L/hIGB5mHHm6Ifo9lva0fWW
tbVehX6/hVX1GgVpKXkMnAKAv3blhYSr8hck7snQRQhpMPLlZRWZAg0uThD/8dNv
+54oSPGCVLLFsu4XM9QKpMJdE/wrEW62iycsbBNcf4zFnHJM8AkYm9uGxi057nas
hOTiEK0i+MRUNGtow58ju9OxAuWwbwi6DPmc+5aCA9zLFStjufAPf16hx47db44F
yYvT882Zu53UH2SRvFrgCpHfojWzvA==
=3M3t
-----END PGP SIGNATURE-----

--dGU0FRXfnJSl6dVk--


--===============1289425441946819987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============1289425441946819987==--

