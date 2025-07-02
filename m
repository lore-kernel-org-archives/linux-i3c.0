Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6804BC83F0B
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wEqoTCeUL00F0k0ZI2UsJkwiUPscHAB3KXwiR9M3d8=; b=xITjn8EoEtI+UjOpWwrkjaLCVD
	yBIxsFVj45DqLMFpV37XZUwSKycHofESqd6WIUyNaGJt6uvfwSlHWq99pxYeXl7WGBmmIbpEgbY7b
	U+SIkONK7+LACZ1ylYisBQvhmGTiBPiM1smXW5/nEtF9pxR2OFS0JNlgrKMqPVOhvIgmp1waTsrE6
	81pW0hOcAQRbjU3SpDTwelWdODS40eQ/a5DVPAgCVdhOUz5HPPRcNwdJpy+VepIbizRHcIVEXsyom
	MSYJNHHENr6szoirnpf/LmkDa0GKzp/goD6RnPB8BbQESwOVfBw+Anjvrzaqhm3FTfYcTWGrkt0vh
	nk1d6WUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bY-00000009fC4-0U39;
	Wed, 02 Jul 2025 22:07:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvnb-000000089vn-3TrW
	for linux-i3c@lists.infradead.org;
	Wed, 02 Jul 2025 11:38:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7600FA5116F;
	Wed,  2 Jul 2025 11:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01412C4CEED;
	Wed,  2 Jul 2025 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751456326;
	bh=6D65NQrcz7NwOKOr8hiTmabKhGb17NOweOxgq2rLoRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKuHx5XmFRNHZtV5pSfKZMRhbFK9Q/V8oBQttSQwv9h1BoZj2mm169T+YyXbMPl35
	 MkWW3EY3dKtbc8PrPx3G1R0Hz0CZYoKi1R8NejVaAjeAQBNFp1H67e0eSXN49NUzyU
	 8nWheZ/Z3Ej0ul4a/+WASK+txRA2lLb1VhQgkZ+OVdYhxvh+BpWMr88wnW7FyPmn0Y
	 YwYHjIcQsY0BF3n/c7nHKDYuObm3MF0BchGYbyrLOXQUFsI7fOupP6s8YttGBDroTl
	 C2Go5SyvImfXwciAAzFTpR5fLmc736by4kg3aDbnHQXBU8rCI/Q2gEvGnhQym960Mp
	 LBq5wdH5IqiYg==
Date: Wed, 2 Jul 2025 12:38:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Jorge Marques <gastmaier@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250702-armchair-favorite-c734b53444e2@spud>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
 <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
MIME-Version: 1.0
In-Reply-To: <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043847_995582_0435D40B 
X-CRM114-Status: GOOD (  39.78  )
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
Content-Type: multipart/mixed; boundary="===============8377921096328711411=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============8377921096328711411==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AzTkVZ/OYZqMKI4S"
Content-Disposition: inline


--AzTkVZ/OYZqMKI4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 12:58:00PM +0200, Jorge Marques wrote:
> On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > > On 27/06/2025 16:38, Jorge Marques wrote:
> > > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> > > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesiz=
able IP
> > > >>> core that implements the MIPI I3C Basic controller specification.
> > > >>
> > > >> How did you resolve my last comment? I don't see any explanation -
> > > >> neither here nor in the binding description. Binding description is
> > > >> actually better place, I think now.
> > > >>
> > > >> Best regards,
> > > >> Krzysztof
> > > >>
> > > >=20
> > > > Hi Krzysztof,
> > > >=20
> > > > I forgot to condense out discussion on v4.
> > > > What about this binding description:
> > > >=20
> > > >   description: |
> > > >     FPGA-based I3C controller designed to interface with I3C and I2C
> > > >     peripherals, implementing a subset of the I3C-basic specificati=
on.
> > > >     The IP core is tested on arm, microblaze, and arm64 architectur=
es.
> > > >     It takes one or two clocks, axi and i3c. If only axi is provide=
d,
> > > >     then there is no clock signal to the i3c input clock pin and axi
> > >=20
> > > This is obvious from the schema, drop.
> > Ack.
> >=20
> > >=20
> > > >     clock drives the whole IP. The compatible is suffixed by 1.00.a
> > > >     foreseeing future controllers by Analog Devices Inc. and breaki=
ng
> > > >     changes.
> > >=20
> > > I don't understand that. How are you breaking any changes? And how
> > > 1.00.a predicts future? I don't think this reflects previous discussi=
on.
> > > Why you were asked to go with v1.00.a?
> > The -1.00.a suffix came from this discussion:
> >  =20
> >   https://lore.kernel.org/linux-i3c/ildi2pup2zkyv4stuknkrjysex3yzsbrrsr=
wbgcc4xgvdhwrdd@7qh4y6mutgy2/
> >=20
> > Other adi bindings use this suffix. I personally wouldn't add any suffix
> > unless told otherwise, as I expressed on the thread. Should I drop it?
> > or suffix it with something else?

>=20
> I went after the reason of the historically -1.00.a suffix and
> discovered that they came into existence due to AMD Xilinx auto
> generation devicetree tool SDTGen
> https://github.com/Xilinx/system-device-tree-xlnx
> that would automatically suffix with the IP version, defaulting to 1.00.a,
> and for a seamless experience, the were copied over to the dt-bindings.
>=20
> The adi,axi-pwmgen dt-binding went more creative and suffixed with
> -2.00.a, while never enforcing Vivado to yield the devicetree with such
> value (Major version is asserted in the driver through reg access, the
> current core version is v2.1.1)
>=20
> Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
> defaults to 1.0, so the previous bindings from the other IPs are not
> accurate anymore, either, (axi-pwmgen auto gens
> `compatible =3D "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also)).
>=20
> For fun, the current Vivado version thinks the devicetree node for the
> i3c master should be as follows:
>=20
>   i3c_host_interface: i3c_controller_host_interface@44a00000 {
>           compatible =3D "xlnx,i3c-controller-host-interface-1.0";
>           reg =3D <0x44a00000 0x10000>;
>           clocks =3D <&clkc 15>;
>           clock-names =3D "s_axi_aclk";
>   };
>=20
> Let me know if we can drop the suffix, or replace with something else.
> The current register defined core version is v0.1.0.

Please, as I requested in the original thread, add versioning
information. I'm clearly not asking you to make up some garbage version
number, or to add "1.00a" if that's not an accurate version (and never
did AFAICT). If 0.1.0 is the version of the IP core, I'd like you to use
that.

If other ADI IP cores are using crap version numbers that came from
some Xilinx tooling that don't represent the actual versions of the IPs,
that's probably something you should mention to your colleagues that
maintain those bindings.

--AzTkVZ/OYZqMKI4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGUaQQAKCRB4tDGHoIJi
0opmAP90ILv17HBwblHZxoE06P46Yei39DKWzTDARH4j+CqtygEA90BCiZRJSpUP
Hnr5ERbaqQ4vUWt8259P3N6dpG43SAM=
=0JJi
-----END PGP SIGNATURE-----

--AzTkVZ/OYZqMKI4S--


--===============8377921096328711411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8377921096328711411==--

