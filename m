Return-Path: <SRS0=88uS=5D=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E73CC10DCE
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 14:33:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54062076C
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2020 14:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cx132tMF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54062076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=quR/u7M2Hq5q6WHihfwXPrS9JC7WbTsGxqetqwEN6Zw=; b=cx132tMFDgpPGVmiLR6VK1Z5B
	mGcc/rn1rs7psXDD1tpIMDiZ1VX59bD1DmZVx+oCapAc+I3PB6FnYOjEQF03PrXnq6R9KjCfIZpIZ
	2FgQIBYQky9IiYv/gEy8CVC9Ql9H4ogWRpquQ8S2V+ziztKAfvZubcW8sbsadKVhZLRuZRRS2IXyG
	i0dQQTnFo5ohZ0ythbHmPIHXf6Ai+0JXH9e0qpGKV81ZFqQf+HUVB5tIM1z8AzdGeXWIpzdLtw+mB
	w7vk/uMPNLagtrDkXophg3TNYioyVdEUr/EN7O+9Bbn/tvPY7BB+ZvzblqQzrjy9omTFvsX+qFlGW
	N+w07oWhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEZl8-0003mx-2W; Wed, 18 Mar 2020 14:33:26 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEZl5-0003mT-MU
 for linux-i3c@lists.infradead.org; Wed, 18 Mar 2020 14:33:25 +0000
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
 by pokefinder.org (Postfix) with ESMTPSA id 039522C097D;
 Wed, 18 Mar 2020 15:33:21 +0100 (CET)
Date: Wed, 18 Mar 2020 15:33:21 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 6/7] i2c: of: mark a whole array of regs as reserved
Message-ID: <20200318143321.GB8300@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
 <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_073324_028132_B6F7B093 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============8357622725431749056=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8357622725431749056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_i=
nfo *info)
> > +{
> > +       u32 addr;
> > +       int ret;
> > +
> > +       ret =3D of_property_read_u32(node, "reg", &addr);
>=20
> Perhaps the time is ripe to start considering #address-cells, instead
> of assuming 1, here ...

I think here it is okay because we really want the first entry of the
first tuple.

> > +       of_property_for_each_u32(node, "reg", prop, cur, reg) {
>=20
> ... and especially here, if this code can ever be reused for i3c, which u=
ses 3.

But here I agree. I reimplemented the code to handle it, and it worked
with '#address-cells =3D <2>;' as expected. Here is the diff to this
patch:

@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/sysfs.h>
=20
@@ -75,13 +76,14 @@ static struct i2c_client *of_i2c_register_device(struct=
 i2c_adapter *adap,
 	struct i2c_client *client, *first_client =3D ERR_PTR(-ENOENT);
 	struct i2c_board_info info;
 	bool first_reg =3D true;
-	struct property *prop;
-	const __be32 *cur;
-	u32 reg;
+	unsigned int i =3D 0;
+	const __be32 *prop;
+	u16 reg;
=20
 	pr_debug("register %pOF\n", node);
=20
-	of_property_for_each_u32(node, "reg", prop, cur, reg) {
+	while ((prop =3D of_get_address(node, i++, NULL, NULL))) {
+		reg =3D of_read_number(prop, 1);
 		of_i2c_decode_board_info(node, reg, first_reg, &info);
=20
 		client =3D i2c_new_client_device(adap, &info);

Thanks, Geert! I will send out the new version in a few minutes.


--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5yMS0ACgkQFA3kzBSg
KbYtfRAAil0f+6TG3T06kRnSNoNLPpEoqabj0ip7Vz7+gSloBvl8lszjT7CP//7R
9gnjhLFvr6hPVbC64dzimreCL1JGYUtFOhKDl/pPSA+TrEFEARbOCxIbdhgieFC0
DrSN2Ed+jK7ZRTPdTuT2y6DNf6bbDHo3ihnzd57I2wy6cEsTMdyIJSAnsxfn5QVf
6EKTCLAeBI9hPd3jDB38ICvQ0Vf9/F9lHRZNOQo1hQwSkUbnyyqf26k8kt/VAnm9
Ipcvlz8krmqY2FWnC/FlzhKV5lSc9i7VSZJTQOjtO39RHxRAsOytbzc6erlTp9Pz
V1+Uw8HGIVMbQe1+kpaaJvomxTApQ2HqjTOPTQc/2h9qXUdCdeWFi56oaJzCl7hp
WHCgqmUCfs4a1V75vuHk2Fj3mPMQsvmjiWrvW5Sz5nvto2GTjKsg2m/v6bdabTxk
iMFjwBfQVun1ziMQOad0zycEFF+sBtQafAg4zmS/FAyrhGAVI9YQ57Z93dlk7D1L
YLFvxifo+L5a6/ny1uEL0xrjMoYfiUCTXlySSuywl5dD5jsqBoUWduFXeHo0DezA
Pe/Vht7ChN7WlI3kDt3X+zCVGmf5WnObEJPrzm39gUNjod7UpW39zgoKQWuF4Rpp
JCKxZe174onb36K3lz83DRTkg5v5NU1AdVgwqrKM6RjakOs1aXM=
=Ku4u
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--


--===============8357622725431749056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8357622725431749056==--

