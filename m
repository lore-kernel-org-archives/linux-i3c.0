Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFF6CD13DA
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKhInRRhGDdKB4KO1frrHC7XJNqvg4IwAsT1obJjrqE=; b=iqDBL3ILWMdc/feSgyAxg1bej+
	6iXNaUclfakFv/X6raaQDr7JjipR4MENqsiff5n+gB3v/e1GTfj112hXiGn6Ufq8NKvDd8jC3dQxM
	/u276uPTdudkY8Y1Vi23eE1kngkg0N9RCkMI5MXdoQGJtdNBK3KUWRO8vbGy/nC+cVgJfWpB36C7s
	Uylo1Z+FqpYtwvEckx2YR1EqBvVXhZk9Atf2uelYqGCDfWXqSTMdVKd/2nD73xNAGeJn9W+DEDNLH
	cI/LVEWbjvhDeGVwFmXdcLpZBIFwDJmQK4TQ6s+sgBM2+tijXFH9KkKc1yngIvHGhZjeDZHAeBZIm
	gmSJFhvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOFu-000000059rx-1XHC;
	Thu, 30 Apr 2026 10:04:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Noe-00000003Pzl-2aAY
	for linux-i3c@lists.infradead.org;
	Wed, 25 Mar 2026 12:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3F1960130;
	Wed, 25 Mar 2026 12:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB66CC4CEF7;
	Wed, 25 Mar 2026 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443511;
	bh=hD3wT6tjlm0FZ6f+/aByElhT2FOrNCcYidkpV2qsHBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQxlz/IbSNGwOhT3DzvNOsfSEQt1Trr9V3reVh+TiD37vnf2gsPnZRxjc2v9djimX
	 zMU/LDQbbDkjDlL6qlKPNDIpTVEWajhaKCtaaMMez7kvqueQMyFYqilRbGQNHKB92p
	 Fd7K1J5qCCKVIe6YoJWQXn52wFXY48TaxohXvkWJXvWKIp3tsqvytiHiIqpX+lBj5F
	 MNoqJFEtdc8Dy7VPxv+EHxlAy107SwOuVc0DolAaLp8AlE7A5qhSCc+G8+i/d55t/x
	 9dCdhpHlqW3zUNrXl1yb5bexHRAYRLUUkF1pGxT1tcWij9kpZxIDZAsIlPvTGL38kh
	 /vgu7BTL2ZPAQ==
Date: Wed, 25 Mar 2026 13:58:29 +0100
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
Message-ID: <acPX-clIX4UfBNdM@orome>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
 <acO4NKPDUayny-I4@orome>
 <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org>
 <ed3828b9-fd2d-46c1-b486-c5172f61eafa@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ed3828b9-fd2d-46c1-b486-c5172f61eafa@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============8714175777729721043=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8714175777729721043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzpx7zw374bolivb"
Content-Disposition: inline


--hzpx7zw374bolivb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 12:03:37PM +0100, Krzysztof Kozlowski wrote:
> On 25/03/2026 11:59, Krzysztof Kozlowski wrote:
> > On 25/03/2026 11:31, Thierry Reding wrote:
> >> On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
> >>> On 19/03/2026 18:09, Akhil R wrote:
> >>>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> >>>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> >>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
> >>>>>> SPD5118 hwmon sensor as modules to the defconfig.
> >>>>>
> >>>>> Why? If there is no user of that, why would we want it? Your commit=
 msg
> >>>>> should explain that.
> >>>>
> >>>> Ack. This is for Tegra410 which has a DesignWare I3C host controller.
> >>>> I will add this in the commit message.
> >>>
> >>> Board or products. Not SoCs.
> >>
> >> Is this a new requirement? I see a bit of both in defconfig changes.
> >=20
> > Almost every review from me has it for 2-3 years... And it is a known
>=20
> And I already explained this to *you* 3 years ago:
>=20
> https://lore.kernel.org/all/ac8f30a7-fc72-9a44-74b3-a69001bfdaaf@linaro.o=
rg/
>=20
> So how this could be a new requirement *now* if three years ago we had
> exactly same discussion.
>=20
> I understand question for the first time, but why this being brought up
> as "why is this a new thing" again?

I have to admit I did not remember what we discussed, so I had to go
read that exchange again. It sounds to me like we were not discussing
the specific issue of a missing description as to which particular
product needed this, but you were instead rejecting the idea of
enabling drivers that were not strictly necessary like those for PCI
devices because they were making your life more difficult by building
drivers by default that you were not interested in.

Here you're arguing that you want proof that this is going to be used
by some upstream-supported device, which are two different things,
because they might very well be drivers that you're not interested in
but end up building if documented properly.

So I find it a little hard to keep track of what is acceptable to you
and what isn't. Are you objecting to this on the grounds of it bloating
the kernel build or because you want documentation for what platforms a
driver is being used on?

Our action items will be different depending on what your answer is: if
you want documentation about what device this will be used for, we'll
get you that information. If your concern is that it bloats the build we
drop the patch and will have to ask users to build their own
configurations.

Maybe to avoid these kinds of discussions in the past you can write down
your rules about what should go into defconfig and what should not. And
maybe we can eventually find consensus and find something that people
can use as a reference.

Thierry

--hzpx7zw374bolivb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnD2/EACgkQ3SOs138+
s6HyxhAAgO3a+brFWZ1VdK5cf0wxZ0BcT69+soJxbRUx0kW51Bpa+Rf32/sKJPyK
z5HNnVdrhbNVdh55vGKUfhGBbfckEIp3CimQG+thFA234k/0i+GuIVnNpYxUhupV
49TA0Oim0rIIXT+WE3YHwx00T6CGaAmTOard+7V3EmYPs2rIPuIHZrEMTKKUSoGd
jQzCMJjT0kcesHUFxkLmjU3ApA2jF3wBHqdnOcz8kheAM8LBfo1jlDKXrURntbP9
hLt5tYwnbcLJDYafFZvR69oW90oOCDaqUiwuA3ecuQb//S0TqVMXscZ2GMqJu8PQ
ydtsjoDdnu44/+40JG17MPZx3ecMbSEZWjii4wa8t9Hcg3IP9sk/JfZFBEer1pM4
ey5dm/EutJw5b5/R0qmIvpGtV4aOVkun90bXls7w6FiIcGdwLrEj/y6LGsTwxs8L
PuZfYe6xgyUYHfAyotPrsg0DM5JqMjr3q9qU87GOJYEMdua3Cx7U13nhfnnjiHKu
3cveaUieh8WWMmrcIzvHuheaihR/l3i7DieFK54bMtsI6EZc3qqIZtyyNN8cDzQL
p1b7fTASVX+HWr6UPqckgecKBW4mnhOA5gdyeOkwpHwdxJ8v0C+Mq3hdru1joH75
s9braB6OkIoSzucV628+rkPmpuqEVrsgwCMLGmJOkUMKg/wLZhE=
=M6Zu
-----END PGP SIGNATURE-----

--hzpx7zw374bolivb--


--===============8714175777729721043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8714175777729721043==--

