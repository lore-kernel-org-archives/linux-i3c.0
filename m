Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F2EC83F14
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDysgkIAqzFzqqnY4tkMLCZ8laPNFZigzbv+vyImAos=; b=icHFLvqUSzjxHKU4lB6KlHtAmI
	KlXLGBuwPKzCagP4ekHfkPWHcbT+ZyIt+Ov8z2DgkyvdYKI1g6SV7xik1ruZBJmBGUR//69LExC7v
	vWk5fuvCg7L1Y+HWNdiuAdALmqbKHPWPaAt41iJznhBCM8vh4N414CAAxREbhkJ44e688QcQD5H9Z
	SZXzbe3kf4TDYLxztQktAUq5VmXc4YDnluUwjVq+x8s/KAE4/tw6Ij8qZWORv3SnstjqI/Cw+XZoI
	7lqFdsok1LnJbIrzW1Ql4l+qJ/gCNi5SKIGTcWiidkOW1CxZYwyq22d8R2MplJA4Qi6XVcwam2nad
	QZHqkBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bY-00000009fCy-3NBj;
	Wed, 02 Jul 2025 22:07:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWz0T-00000008jBp-1OfA
	for linux-i3c@bombadil.infradead.org;
	Wed, 02 Jul 2025 15:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZJcaWLnTWMpHVxQ67J4sbBSEjjfltV90uV0XwPrBc4k=; b=Ipf6SrmgMyNXbySBszuTrCOy/V
	sdj/+y8LE1zDAlmtwfv1m67XRKXlT5vn+fpWUrtguJXOdFxeseLNrQ7Lu11xkdtLePNO9WIIbU8rI
	6q++xNfXTGFyfncykGAn0gaZhUeVlHfItaRDwlgNOpMkddhyiXs6I370mJXRJxnwpjpJCzWaGmaVp
	MgVo2YRHUXQ9ShB4DnNISWChBP4fszs4yVLSqYJctbdx0EGKn+hLbdjBDNfVbKOdgZuMeWYT7/lnb
	fSlcsmTQDdC2/ybhV5uR4xoO9aVLoSYfGyQAVCdXPFIkUQ/0v7BCCSJe8J5tP4tducNC1LbJKApKz
	Mn+r3hmA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWz0Q-00000007Sst-0RAr
	for linux-i3c@lists.infradead.org;
	Wed, 02 Jul 2025 15:04:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3F3B461D0;
	Wed,  2 Jul 2025 15:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FABEC4CEED;
	Wed,  2 Jul 2025 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468649;
	bh=qj9JN0bIoM4q2XRV4+8lwVEY0tAGtWi0mdzE0otu6Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxFHGchsmxBrVAg+gQXYdRI8x3QES6OSYnCtYmCBe9sSdNjtJKPplC7fjl7c61y8C
	 EXFuwR+kUIyYTyUbgHn2EuP3kLuq9NSQD4xv4caY0TQkiLUGM1uQKmj24StIIeH3rb
	 KcfiVyXFzk4js6/KJBiYbnCi56Y3VVOi/9RzWkYT7hqntRgxaTad70RUsCK9th/an5
	 qfsncyxnICCAPi77FNFOeOsHPlQclOffy57Y39eKgpPir+Osu1tMG+2kZEAWQrYk+Z
	 KJngg4qUaP2jmgoIi5xZ4JV4Y4PtexxTM3eMrIQ+BARNHkq1h7Sie2EJS7MKo8vHjk
	 k3kbFPfu45nKw==
Date: Wed, 2 Jul 2025 16:04:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Jorge Marques <gastmaier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250702-aliens-outage-958601861590@spud>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
 <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
 <aGVA779eeNZ0zWsa@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
In-Reply-To: <aGVA779eeNZ0zWsa@debian-BULLSEYE-live-builder-AMD64>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_160414_535757_8491CEFF 
X-CRM114-Status: GOOD (  28.26  )
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:03 -0700
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
Content-Type: multipart/mixed; boundary="===============5030822767471458441=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============5030822767471458441==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L1KGBXrwH67o7R7G"
Content-Disposition: inline


--L1KGBXrwH67o7R7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 11:23:43AM -0300, Marcelo Schmitt wrote:
> Hello,
>=20
> On 07/02, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> > > On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > > > On 27/06/2025 16:38, Jorge Marques wrote:
> > > > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wro=
te:
> > > > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > > > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthes=
izable IP
> > > > >>> core that implements the MIPI I3C Basic controller specificatio=
n.
> > > > >>
> ...
> >=20
> > I went after the reason of the historically -1.00.a suffix and
> > discovered that they came into existence due to AMD Xilinx auto
> > generation devicetree tool SDTGen
> > https://github.com/Xilinx/system-device-tree-xlnx
> > that would automatically suffix with the IP version, defaulting to 1.00=
=2Ea,
> > and for a seamless experience, the were copied over to the dt-bindings.
> >=20
> > The adi,axi-pwmgen dt-binding went more creative and suffixed with
> > -2.00.a, while never enforcing Vivado to yield the devicetree with such
> > value (Major version is asserted in the driver through reg access, the
> > current core version is v2.1.1)
> >=20
> > Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
> > defaults to 1.0, so the previous bindings from the other IPs are not
> > accurate anymore, either, (axi-pwmgen auto gens
> > `compatible =3D "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also=
)).
> >=20
> > For fun, the current Vivado version thinks the devicetree node for the
> > i3c master should be as follows:
> >=20
> >   i3c_host_interface: i3c_controller_host_interface@44a00000 {
> >           compatible =3D "xlnx,i3c-controller-host-interface-1.0";
> >           reg =3D <0x44a00000 0x10000>;
> >           clocks =3D <&clkc 15>;
> >           clock-names =3D "s_axi_aclk";
> >   };
> >=20
> > Let me know if we can drop the suffix, or replace with something else.
> > The current register defined core version is v0.1.0.
>=20
> I have no say in how dt-bindings should be, but having the IP version num=
ber
> automatically generated doesn't sound like a sane thing to do IMHO. Maybe=
 try to
> standardize with -1.00.a suffix? Though one could also argue about droppi=
ng such
> suffixes. Since we were told that the convention is to have the file name=
 to
> follow the compatible, I would go with 'xlnx,i3c-controller-host-interfac=
e'
> (without any suffix) so the file name is smaller and clearer IMHO. dt mai=
ntainers
> might prefer that in a different way.

To my knowledge this is an ADI IP from their HDL catalogue:
https://github.com/analogdevicesinc/hdl/tree/main/library/i3c_controller
I see no reason why it should have an "xlnx" vendor prefix - and I don't
think Jorge was seriously suggesting it either, given they mentioned it
was being shared "for fun".

--L1KGBXrwH67o7R7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGVKZQAKCRB4tDGHoIJi
0sjAAQCRJxw3ls7Pe6USBE3wFSZgnw2v13vG/nVg62Ip2v91kAD9Eue1UjXWxexy
CoOEsjQ7V6tYsmDw2UPtnNbCEdAJRAE=
=ce7m
-----END PGP SIGNATURE-----

--L1KGBXrwH67o7R7G--


--===============5030822767471458441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============5030822767471458441==--

