Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF32CD98D2
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jun 2026 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yj3JuRXBZej7CBeUKaqU2dJt437CxZ+YC2+4us+q1cs=; b=QLqDGtNlxNnlwopkSg/uH8AB0J
	/frEd/qNdFflZR5ueZ/mxu30pW9NLAeSfYaZCJjbio9Co49WkUAPd/5Du6e4EolRfdCHleKJAil6C
	rU73JR6lxijbXtmM6VCDF1UyJPTEWu9bmwSYhm7XDAibcSJ3QEMz+PAiWSFP9oGogXP5LnNr/TaQE
	nlmcXv8mXKE9TsEZUB5ufijjp+9FJDsN5km1l0cb7bohkcP7jFPvMyunu2pQJoYn79vSFYpXVKBmZ
	rNYr79wELc5rhNp8+nvveQqZHpSfMSDNafqyqOqM98fJhQUdglIga6gMkjjwGYTQTTbfIOpZkEjNI
	SKQ6wd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYr9a-0000000DGt4-2bnI;
	Sun, 14 Jun 2026 20:09:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwKg-00000002q1g-1LG1
	for linux-i3c@lists.infradead.org;
	Tue, 26 May 2026 18:16:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7132760018;
	Tue, 26 May 2026 18:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936FB1F000E9;
	Tue, 26 May 2026 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779819409;
	bh=I2OsPB9xwMzP8bTRW/BdFImKiBqOv6GwJEepAQeykmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wnn93VgBbaZIOuqN0Ht2pPIhqPHtL+ogpB6srusIHN4so9rLBcbnWSqk3Rs3V29iR
	 Z3TixGsksO+3v2gKZPlMsuf1tgQnYOyKqjPDMxkVycy9J89PLXBvzGcpU8689JuVF/
	 /xn+5s5IUPI43rzsB9pvUC7bFFQqT8GzHE0XJqh6ae1ocd/q2yJVBcvEziuqSNRS8v
	 kzx1qO7mVmkGRv7rpvKhXfxCbug2tlWvCxA3EJVtTrW1UNB1bJlp9jh0QGmnsY0mos
	 SMoU5TP3ElXTSgW9eoDFJKTrYvpcMqe5Rp3I7MWJs9qtjk0CSQaTDjGQbRUg72XpjJ
	 ltDdK+3qhclUw==
Date: Tue, 26 May 2026 19:16:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v10 6/9] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Message-ID: <6e939fd1-0d65-442c-aced-e18705774ab8@sirena.org.uk>
References: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
 <20260525064209.2263045-7-lakshay.piplani@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260525064209.2263045-7-lakshay.piplani@nxp.com>
X-Cookie: You are fairminded, just and loving.
X-Mailman-Approved-At: Sun, 14 Jun 2026 13:09:57 -0700
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
Content-Type: multipart/mixed; boundary="===============7527306814066682863=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============7527306814066682863==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6VIrc6YsHm1pWuLW"
Content-Disposition: inline


--6VIrc6YsHm1pWuLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 12:12:06PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>=20
> The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
> functionality. This driver registers the regulators using the MFD
> framework and exposes them via the regulator subsystem.

Reviewed-by: Mark Brown <broonie@kernel.org>

--6VIrc6YsHm1pWuLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV44sACgkQJNaLcl1U
h9CI2Qf/S9IFzRbBRN5qoF1uXEkFdqLcfGDe/TkziPuQM0Wf1fbzs2zAm6kGR1Y4
7qInMlsC+H0FiO2jmITJJffSSiUnWZuUXjCUSIZ46UnyuPhtnJnr5ZIZInk5CE0O
PXPm8oxZlNmG0nI87vwkUytDv60xcbC9gDB8I+PEk8SYVmdEfcH0Fob+hnm9/yUm
u6ukx1igjf/EK0x9kzDnFi14QXfj7MR72hzcYANJYLXz5vsgsroRtJ/+KUhYctax
tS0tz+UABbrp8ns6uX7w8BM0/Cc23QMnArK0eWFSPc/U7bxV7G3c9qAnUfNroZRI
Y3+9eoDd1nZGs0NuVty19ywWlMOVqQ==
=rXED
-----END PGP SIGNATURE-----

--6VIrc6YsHm1pWuLW--


--===============7527306814066682863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============7527306814066682863==--

