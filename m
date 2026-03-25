Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABF2FF8875
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rq4RVXtY1OZWSmTgTJzRg358jSsGC9eKX7wj4TN6Jys=; b=v0MDYVhSvTKmXpOPrZla8WZ1fV
	ZiD/7UuoxzdzWfn1Nwd9e/pjtqIQ0HArFXttH9UBnL8rttJahvNIStLjw6ZEyWcaM5WkpFw+xUUMH
	yzZHgdKgor/u4icFK7Ea9IqfPsvbUkpTLzvahmMDbqGLhloK3qTM+fekGX/uBkuXQXprh928db2Ok
	hxSutjY8HMR/kIL83uYI6hKR6igiNxG8pJ6Eig4ZDcysqPL1D3bSMGfQ7LJlrrJA2npdC9zuHke/j
	2luIxXG7KKH1pWpk2usjto9I0JmCkiIsPNPEEKTdESsON/dG6soNuv9y+P2J5nBHCZfUXJhUDhhuK
	kKkAZBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOFs-000000059rP-3cIh;
	Thu, 30 Apr 2026 10:04:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LW6-000000039e9-3XIp
	for linux-i3c@lists.infradead.org;
	Wed, 25 Mar 2026 10:31:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14DAC40E19;
	Wed, 25 Mar 2026 10:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BABC4CEF7;
	Wed, 25 Mar 2026 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434673;
	bh=oJjXP7xdNnZ/BGIVuhLzu0MfsHL3XvKpMIM3SaBhYfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MNmggxTin7K/6W/4SAhXxVVhhDmcwZaEhsjbkFJHNe0FYCa7T9o4k6z1t2QuMcGmk
	 77wUYCQTFU54CIbmC1E+4JnJe/CDzVLutHSsNR3KlBsrlAzWiGVU8lz97OAW7eNgLn
	 ALBL9WqwNniCGj6bi5utGFCqQ5UN9ep5k6/6yd8ImitK/Xp8jlegDjw45EM29a+j4N
	 NkpbYmaW3cdXPPUHrBCkfPh+yfzQIXixAyYawvKhvA3/ia8HXrlMRm2a2qebz5JhoG
	 00Pfy1wr7CgjBofXbGUNLA4uZhJ9yqh+asjiB1txJ98jFVMPlNTrrfibDmL9NQ9Sr9
	 WARIuC86D6dCw==
Date: Wed, 25 Mar 2026 11:31:11 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank.Li@nxp.com, 
	acpica-devel@lists.linux.dev, alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@kernel.org, fredrik.markstrom@est.tech, 
	jonathanh@nvidia.com, krzk+dt@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com, 
	p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com, robh@kernel.org, 
	smangipudi@nvidia.com
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Message-ID: <acO4NKPDUayny-I4@orome>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
MIME-Version: 1.0
In-Reply-To: <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_033114_925163_C881EFD3 
X-CRM114-Status: GOOD (  13.94  )
X-Mailman-Approved-At: Thu, 30 Apr 2026 03:04:23 -0700
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
Content-Type: multipart/mixed; boundary="===============0314134558357007503=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============0314134558357007503==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hefw7yhop4kz6jja"
Content-Disposition: inline


--hefw7yhop4kz6jja
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
MIME-Version: 1.0

On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2026 18:09, Akhil R wrote:
> > On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> >>> Add I3C subsystem support, DesignWare I3C master controller, and
> >>> SPD5118 hwmon sensor as modules to the defconfig.
> >>
> >> Why? If there is no user of that, why would we want it? Your commit msg
> >> should explain that.
> >=20
> > Ack. This is for Tegra410 which has a DesignWare I3C host controller.
> > I will add this in the commit message.
>=20
> Board or products. Not SoCs.

Is this a new requirement? I see a bit of both in defconfig changes.
Some mention specific products, other mention SoCs. Does this
requirement apply to DT platforms or also ACPI platforms?

Thierry

--hefw7yhop4kz6jja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnDuWsACgkQ3SOs138+
s6GkJQ/+KHih7KGdwK8LUXDaRizPuwcIwvX5HHc3TOdKw2Gw/XtV+JaoI7c4wtx4
MvnJjhsHhu4zH+4SMnxqEzTP8jbxcV96L9WhQ+Zfurvs+4X+vZ0KsNXN7H+uTeOB
UKlf8JumnoVOs74dUSxIy4c9s2XoY/q6W/pBIguuczmMO/uyuUIIV7tiS+IAHVvG
V+ySkgCNZR+6XH9tyAdN5xTvt7K26KFKoPUgOEXzY7k1gPWCL297YdEoWAfaw0PR
7DxE9hn9z8DcflEbdkwLwD6z5wfJBgTPvZZgXNheyMv3Spr3lpmAOLFqW6a5QicG
HllawC3G+ShlLltKAbjxygCX87Wf6fmKKYT40da3GrEkex+GWfDsDYXK5hijGDas
2nxOZPvXBvQ8aV4Fx4kJHr0GmL6psv8VRVvDT1GWn3clzC7VBOzeMvf7cJBXImMv
uxr53vBDzVSuLNZbt2ZZu+teJREZG+pM4nxC3jPIgh2t2tXWDtfco9O9qUyJsK2Y
ibZ4l+p2uBzRu3cD3obBsHjnVLY79XEd6LN9RH6ZXNGn5t6PVHarP2gLW5hx5VI/
rc++EMVFU2qrO2fe+duASYGyQs+BS4u7u5S9j/jnjEO+Z7kZi4zPk9cnAZEZXSZl
tWV0O0BCLlbHYHHVrKTMZmT7Ay//JLt0uEEsogX+Cm7vH3z0U6M=
=cTw6
-----END PGP SIGNATURE-----

--hefw7yhop4kz6jja--


--===============0314134558357007503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0314134558357007503==--

