Return-Path: <SRS0=u6kh=VI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED20C74A35
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jul 2019 12:44:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6898A21655
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jul 2019 12:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4TlPr1N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FG78Uq6t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6898A21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w0Ot7fwo3+fryn4a3dg4TllMfOJbq4qnMFo8CQcAysg=; b=K4TlPr1NDlwLYqgs5QxfDCq4v
	FFtmZh6lXa+Kwg2vLu/YdE8tqVq4xkoLfEGCdkYibQOEbR1JJvmrbPJPkdI85vPhkfmTCg1H/w8mu
	7DlQkqzc1W1h8ffl8f5x77EugxOtPdNDmewd0D15B6geV1zCfaznHQIQYuUtp35a6QblqWgiU3DI3
	dYRC9iLmDiWxKf0Cm9SA+VnaMJV0bWdMFXcjlFl/yRcUPJYSpqQ3e4PClmWEuhhWclOpQZNYVXtnp
	vY2vb3dm/+p+IWfbCcj2mAIDoGkl2I9oOo3fHiIw5KFjqTZciNCxr3cHO6gnlWLBKT1yRkR6kvHQi
	PR1v6iVpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlYQm-0004P5-76; Thu, 11 Jul 2019 12:44:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlYQj-0004Ol-T3
 for linux-i3c@lists.infradead.org; Thu, 11 Jul 2019 12:44:11 +0000
Received: from localhost.localdomain (nat-pool-mxp-t.redhat.com
 [149.6.153.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA8A92084B;
 Thu, 11 Jul 2019 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562849048;
 bh=lZFM/H31Fs5Z6ab6aWawrjKOVYQXr73MU24M7sjvFzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FG78Uq6t54M6qxvPOcrTnLDhy+6LJohKCZpA2CPYzB2MPWd9Qd9tY1vmmCipDQ+wW
 iYDntFTTzMth2Ap++Ryozpuep3KcsORzj++qwyZ+DSpbxNE5D38yOoArb+RiplWHE7
 ZALKy+/h4kyUrx7A2QSc/aaBvtAt16pbMdQ3qaes=
Date: Thu, 11 Jul 2019 14:44:02 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 3/3] iio: imu: st_lsm6dsx: add i3c basic support for
 LSM6DSO and LSM6DSR
Message-ID: <20190711124402.GC3452@localhost.localdomain>
References: <cover.1562767521.git.vitor.soares@synopsys.com>
 <73955529ae0c31f428221abb88031ab3b4165659.1562767521.git.vitor.soares@synopsys.com>
 <20190710194405.GA10520@lore-desk-wlan.lan>
 <SN6PR12MB2655AC6DF4A959A1705FC8A4AEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
 <SN6PR12MB2655939CB14D0EF848B4F4A8AEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SN6PR12MB2655939CB14D0EF848B4F4A8AEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190711_054409_967224_3E1D6B51 
X-CRM114-Status: GOOD (  20.97  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@knernel.org" <bbrezillon@knernel.org>
Content-Type: multipart/mixed; boundary="===============9199524935930338891=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============9199524935930338891==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Vitor Soares <soares@synopsys.com>
> Date: Thu, Jul 11, 2019 at 11:12:34
>=20
> > Hi Lorenzo,
> >=20
> > From: Lorenzo Bianconi <lorenzo@kernel.org>
> > Date: Wed, Jul 10, 2019 at 20:44:05
> >=20
> > > > For today the st_lsm6dsx driver support LSM6DSO and LSM6DSR sensor =
only in
> > > > spi and i2c mode.
> > > >=20
> > > > The LSM6DSO and LSM6DSR are also i3c capable so lets give i3c suppo=
rt to
> > > > them.
> > >=20
> > > Hi Vitor,
> > >=20
> > > just few comments inline.
> > >=20
> > > Regards,
> > > Lorenzo
> > >=20
> > > >=20
> > > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > > Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > > Changes in v3:
> > > >   Remove unnecessary st_lsm6dsx_i3c_data table used to hold device =
name
> > > >   Use st_lsm6dsx_probe new form
> > > >=20
> > > > Changes in v2:
> > > >   Add support for LSM6DSR
> > > >   Set pm_ops to st_lsm6dsx_pm_ops
> > > >=20
> > > >  drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 +++-
> > > >  drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
> > > >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 61 +++++++++++++++++=
++++++++++++
> > > >  3 files changed, 69 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
> > > >=20
> > >=20
> > > [...]
> > > > +static int st_lsm6dsx_i3c_probe(struct i3c_device *i3cdev)
> > > > +{
> > > > +	const struct i3c_device_id *id =3D i3c_device_match_id(i3cdev,
> > > > +							    st_lsm6dsx_i3c_ids);
> > >=20
> > > i3c_device_match_id can theoretically fail so is it better to check
> > > return value here? (maybe I am too paranoid :))
>=20
> I was preparing the patch and if the i3c_device_match_id() fail it return=
=20
> NULL so the st_lsm6dsx_probe() will fail automatically.
> Checking the spi_get_device_id(), the drivers don't test the return value=
=20
> too.

multiple drivers deference it directly so I am fine to skip this check.

Regards,
Lorenzo

>=20
> Do you think it is really necessary to test it before the=20
> st_lsm6dsx_probe() function?
>=20
> Best regards,
> Vitor Soares

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXScvDwAKCRA6cBh0uS2t
rFqeAQCzrowWY6v6CrwXaKkUC1U9wBmyu7LaicNrBFZvExOFZQEAupmsvMoZ9yTZ
gOS6GkPOJEh4byeeFrEweGB5tbWlNg8=
=Ueu9
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--


--===============9199524935930338891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============9199524935930338891==--

