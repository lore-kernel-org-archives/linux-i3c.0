Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52F2C3815B
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:10:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC19B2051A
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 08:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mmm/53Qe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC19B2051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b6UnNHQpJYdL9E+6UaFSSQdy8qESn5aXgdfxUz0uJKQ=; b=Mmm/53QeuL/ldIbganvTUgFjA
	GpBxBgfqwdTx6lTuSBbq+CDCPRAYKuWtp+sZ9t7SdxbtSD78rA+g6DCl8pvJ+aZfMgFwP02akiZaX
	rMQLUE8DEDgJs961yy1RqpjTtmKYKRhiMdzklil0uMlO/lxClwGe2vxKrH//5WtsNj6ogXxW7yC84
	M3ES8n7UJmuUFJ4n6buNsZJDGnaTGiVPOJmCLdv4vMBYOauHwpcgaTQGRNaMj9k0f6BDatCKwQkmo
	H9A+NSXQX9bl/+MR+HlUWZmqR0U6pun5YcyrGAUc9DYCRl3KoEGky/5ZdcsEuqyo9dy6TamoHMHsK
	YLNgv6Z1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOd82-0008JS-Sz; Wed, 15 Apr 2020 08:10:38 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOd80-0008G6-No
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 08:10:38 +0000
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id E7DA52C1F58;
 Wed, 15 Apr 2020 10:10:35 +0200 (CEST)
Date: Wed, 15 Apr 2020 10:10:35 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFC PATCH v2 5/6] i2c: of: mark a whole array of regs as reserved
Message-ID: <20200415081035.GB1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-6-wsa+renesas@sang-engineering.com>
 <c4e41b0a-4b9a-0db9-94dc-bbbc2f013133@lucaceresoli.net>
MIME-Version: 1.0
In-Reply-To: <c4e41b0a-4b9a-0db9-94dc-bbbc2f013133@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_011036_926213_CEA03B3D 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Kieran Bingham <kieran@bingham.xyz>,
 linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============8211311878504398267=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8211311878504398267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -int of_i2c_get_board_info(struct device_node *node, struct i2c_board_i=
nfo *info)
> > +static void of_i2c_decode_board_info(struct device_node *node, u32 add=
r,
> > +				     bool first_addr, struct i2c_board_info *info)
>=20
> While I confirm the patch looks generally OK, let me add the name of
> this function is not quite self-explaining. The difference between "get"
> and "decode" has nothing to do with the different actions these
> functions do, i.e. the new function gets (or: decodes) info about  a
> single address that is passed, the old "get" function gets the info for
> the first address.
>
> I'd suggest the new function be named of_i2c_get_board_info_one_addr or
> similar. Not super nice, a bit long, but self-explanatory.

I view them a bit differently, I think. of_i2c_decode_board_info() is a
helper function to retrieve "some" addr. It is used by
of_i2c_get_board_info() which has the special case of getting the first
address. of_i2c_register_device() is the other user with the case of
getting each address specified. So, I wouldn't put this helper function
on the same level as the users of this helper.

Yet, no strong opinion here, I will think about it...


--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6WwXsACgkQFA3kzBSg
KbZmFQ/+IKAYZ44eKk5sxMfMCZYEKX5V6zDP8yGqCfmjnxTOrq4DLKZVUnlOV28t
kwwh/lF53CM4/PPXUTjvv11yNRO1dvRJeQvz/O8incejc0VvjAKRIBYWSFG2GvXa
sGH0vupmYyyqc5Vfx2UjrUBpFbLnrhOzCwOOacTDoiwbCcDDIhpVgB+ZbIaHR+Ep
m2BCa6u3+c/4gNgIweYZzhEd6YkgDkEdjYefCrhhwpkr8aGs+wYiCzjipTreDtYf
mIc4irogCauwpaCGX8tmzQj2/o6P4iT4pEIscO9wcHQMcOJmthK/8HcFt+x7Dfrw
7SvCBr8l5QmsyAR3Smbn8zrfw1YjSUvfu4tjRGbHQx8UuDfVeiyWy8+AHHJ7ApoF
X/4lBTVf5JPdG8ZnypVlb+s5SDcfOuJ7F7QTIrWGope4rdihHXyjX2ulukHsEZ9j
kYt759X+70ZfNaslgUdkZG2HGbCOlRUz/n2kV5moW0u18UZnFypvV1av2Z2kq8B2
7IC409rd5GVvi+V15JouiVRuRvWFTczjeuFfErjo3KiyVU3ZvPkfem0XhFDSrIUP
lQNSMIiyu8Cp3Oz4T3SXAPV3Hn3YwyqcWiEItWrtw8Ttu6mfuGmwOjbdGSg4ANGG
Qkx23jFosDHtthO02SgOED1J+GAj1BUqwienkWfN0+PbvKzoTQE=
=DyfA
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--


--===============8211311878504398267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8211311878504398267==--

