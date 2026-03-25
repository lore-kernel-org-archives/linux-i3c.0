Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB17FF886F
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufq7XsSoSSzbBm/kBLMnxM+VMHKkFjzaumOvBSb3wIE=; b=Nif/d0Nd/O9J3DJojylB0lzvjh
	Ex8pZWjaStzn0Xtt0K5dIkU+1NArGqtC0LIX7ypq6yGaeNkxvAW3M+SEmbNcVRLk6aUJ4sSP2LYuq
	Drz8zoomb3dQJQng+KTok8mdXBocrfIAk2I27ij3oz7EhtNFqolPPtrC65mpdUY+zhHnLJFsaJn+C
	ahPHOUC5wT+LC7rsdfIbnmYEVkFm6wviUGWfS8WQsjqeORjpcL1EoCQJSuxXrPJ8r0Y8+scnkmT7d
	QD5rubK8gX8hJj8oTjCDvnR6W5g4xNbXFylzbHgZZBbKPT3h6+38NcsCXWkg4h0G5F/Zua1YNVi+M
	/v2NdRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOFt-000000059rW-0QoU;
	Thu, 30 Apr 2026 10:04:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LxE-00000003C2I-21hH
	for linux-i3c@lists.infradead.org;
	Wed, 25 Mar 2026 10:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49EA643AF0;
	Wed, 25 Mar 2026 10:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9876EC4CEF7;
	Wed, 25 Mar 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774436355;
	bh=7Iwcz9s808z/mU1qSlilMROm/eIn+LB4PP0YpFUxbvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bctRU6snoUqfa6o/jnqds7BJsGki8pA0AkWYXGknz4b15QHKcdTYuudUQc1dQmKxo
	 S7ndOaZBrMB+xZlvc7NM6uhPpb3nsBY8CVX6YCY/U4PYvW8CX+c9YEXl93MtmpBApx
	 K4d4yE4x2UoT+xVNEr5r2Vv/BZzYXhg5KGhe7xtdiLnQ2crx/JNmzT9AV0vR6wDSwq
	 gvhVkBMed83CB08ZLn9Qih2ER/37gllE3gsUXvzgblLwQT+kyfYbFtQXaN3E9QdFDH
	 8LQ+ESpArndkhF5d7ElWnywPVC/By0ZuoS+SF+rZN/3oznCDQFnsmG3IK8v4eOY8su
	 34+0Y0tIrwFqQ==
Date: Wed, 25 Mar 2026 11:59:12 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, 
	acpica-devel@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	ebiggers@kernel.org, fredrik.markstrom@est.tech, jonathanh@nvidia.com, 
	krzk@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux@roeck-us.net, lkp@intel.com, llvm@lists.linux.dev, 
	miquel.raynal@bootlin.com, oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de, 
	rafael@kernel.org, robert.moore@intel.com, robh@kernel.org, smangipudi@nvidia.com
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Message-ID: <acO_PUjS_VG07qcS@orome>
References: <202603240843279c9e8b90@mail.local>
 <20260324172215.31540-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20260324172215.31540-1-akhilrajeev@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_035916_582552_0577281C 
X-CRM114-Status: GOOD (  15.50  )
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
Content-Type: multipart/mixed; boundary="===============5448662193378280797=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5448662193378280797==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ydnbwbmjnjsuvysj"
Content-Disposition: inline


--ydnbwbmjnjsuvysj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 10:52:15PM +0530, Akhil R wrote:
> On Tue, 24 Mar 2026 09:43:27 +0100, Alexandre Belloni wrote:
>=20
> ...
>=20
> >> #include <linux/acpi.h> is added in PATCH 03/12. The functions' protot=
ypes
> >> are present in acpi.h. I think the bot checked this patch individually,
> >> or did I miss something?
> >>=20
> >=20
> > #include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
> > is not.
>=20
> Thanks for pointing Alexandre and Guenter. I also noticed that we do not
> have stub functions for a few of the acpi_* functions in #else.
>=20
> Looks like I will have to guard calls to these functions under
> #ifdef CONFIG_ACPI.

Alternatively it might make sense to add the stubs in a separate patch.
I don't know if they were purposefully left out or nobody's ever run
into the lack of these before.

Thierry

--ydnbwbmjnjsuvysj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnDv/0ACgkQ3SOs138+
s6G9+g/+LuZP8mpHvXnaAevACtJDkWGEheqiXMIkXddWa0UJAazqokRhVFFxWNqL
KiHVB2TKCmyKj+ID/r0+YQyLpsAJE5Vc0I6oqP70QyFtUpBsvtYESRHg7Kmg36Kl
YTj1voyogdqTiAfPjwI0T3b1cmUoJpB6H2qTG9sZYbbJJ1G8fySmR8JvNHeDkjjf
4QYzhRp+HWbT7uNjc9mOUo/e2bVCGcIrT+usgwGPXq2g9i2Lvfduk5pp1669JbZ9
SCxaYdNcq3aZMQ0G52cMSuOp/70zEpPhFOE0s1EHkVFge5pNoqTkymLAj5Pg1Wk8
PT+bzWX+W+ViFhV//9lQ3Yx0JXQo5ZlIjqGl8aG0rCrA3qg+PgYj9vRHuFv8QoPF
FeEWPSS+QzZPPuF/SktUCTI8/fgexXGg9IN9j1nalAEu218EqtIdw4pH566Zt0BN
FlUqJ0ibFMgyxEzO4JMdueb8Wd4TMsKpdxQZ2INphJmyEHoIMEq17JlOs7d0fDGa
CWdnSDBlNosjKX8oaUZj6rTrmcvDc1un6i7PWBjHbjN/zqfuAZQXiZkRp4Q3DJ4V
g/3464luFjrpt5XkJD3RsiFM+UuT53RKL7vIa0odHNBtt0SOZC4wrx9zhrKCQEh3
6ksFj9We1bqQm7sOxHFtFsfmvI/fnuc1w67aIdJCRevb++v3DCU=
=nNsB
-----END PGP SIGNATURE-----

--ydnbwbmjnjsuvysj--


--===============5448662193378280797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5448662193378280797==--

