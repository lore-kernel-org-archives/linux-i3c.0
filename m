Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50248606A31A
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DTCAzj2H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flXpyoPG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vt+naEPLNRVjJ6c2YRB3kGv8GerVuRvm9iFKpmConeE=; b=DTCAzj2Hxnjlfl3LDUGFE8cVAE
	5VMsMe/+94p8ID7eue0P6sjXBIwmYfTGR4wVZJvFal+X9Cz/zISvgBHwq/bo9iQFem5WvmvgUvJMN
	cB1kafACuKX0kyt7G2JG3abNR5x6VEG/bfgQTG6TMA++1RXSst/RJ+XHf6LqKmOSAYivTZkdAdYCO
	cGz3QI1m52N7Befpv6XBad4PMroG+mvJHIEsl9MK1h6cAGi4wxo2kZDdhXmeNg6RFQdLZLU/B6Bx+
	NPHnRAXaM+hWUQr2vY9durBRg5lSyLQq26RrTMt3F3aa159kjEVqUQamlY2GF0m5reaewvbARSJpV
	MdzVSOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevD-00000004NDV-00WD;
	Tue, 27 Oct 2026 11:00:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwTFR-00000008ll6-1cjR
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 23:29:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F2C141691;
	Tue, 18 Aug 2026 23:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407251F000E9;
	Tue, 18 Aug 2026 23:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787095776;
	bh=3L7J+3RvgR+CG6vbfS3foUcxpD/Gh1qUulFzAN9WSJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flXpyoPG008z9PydccA7CvtNasIsJihnz63vvpehdx4ffjAzgxH91F7xeoTvoTVUZ
	 PCO/y8mLDZqCaORgn+UqOHFT8CFSmeY2Zsywdr9lny8axM/fpCOziv8KcJ2xfpc8+Q
	 B0VJaxL0auq108d8KTmo44GJ+sEpNVMRL7zstJmEpA/3JQHaVspzI5M638436jLTic
	 y7SNZi0QMPN96EjZ0Ll+P8myKKy59ISssVeSWL5eX/77INEJzM5fZWm2LqWURH4W34
	 Yww9btz9L2DTmui0cJN0M/+39Oiaiy6N2ZhYlhcOo9Jo2yHzKcon6N6oKF7vLl5LZN
	 RzTA4iwoUtpkA==
Date: Wed, 19 Aug 2026 00:29:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Patil, Shubham Sanjay" <shubpati@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260819-spoken-tiring-445e92a78235@spud>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <20260817-spry-attentive-hamster-ea3c0f@quoll>
 <372395b9-be14-40c5-984d-3d725f20cec9@amd.com>
 <003fbd61-2e3d-4a31-9b92-60dfeb3bee34@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <003fbd61-2e3d-4a31-9b92-60dfeb3bee34@kernel.org>
X-Mailman-Approved-At: Tue, 27 Oct 2026 04:00:48 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9041789447728924806=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9041789447728924806==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="08fKKcYaq9ThlrUA"
Content-Disposition: inline

--08fKKcYaq9ThlrUA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 08:36:16PM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2026 14:02, Patil, Shubham Sanjay wrote:
> > Hi Krzysztof,
> >=20
> > On 8/17/2026 2:20 PM, Krzysztof Kozlowski wrote:
> >> [You don't often get email from krzk@kernel.org. Learn why this is imp=
ortant at https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >> Caution: This message originated from an External Source. Use proper c=
aution when opening attachments, clicking links, or responding.
> >>
> >>
> >> On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> >>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI =
I3C
> >>> IP. Describe them with two boolean properties.
> >>>
> >>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> >>> capable design is always IBI capable as well. Both events are reported
> >>> through the controller interrupt, which is therefore required whenever
> >>> the capability is present.
> >>>
> >>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> >>> ---
> >>>   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 ++++++++++++++++=
+++
> >>>   1 file changed, 23 insertions(+)
> >>>
> >>
> >> So the same SoC using this core will have different synthesis options?
> >> IOW, why isn't this implied by a specific compatible?
> >=20
> > Yes. This core is not part of the SoC's fixed hardware: it is a design
> > compiled into the FPGA fabric. When the core is added to a design in
> > Vivado, IBI and Hot-Join are options that are turned on or off, so two
> > builds -- or two instances in the same build -- can use the identical IP
> > version and still differ in which features are present.
> >=20
> > The compatible string identifies the IP core and its version. It says=
=20
>=20
> Well, you miss SoC compatibles so you cannot use argument of IP core.
> Although I do accept argument of two instances in a SoC having this
> different.

How are SoC compatibles relevant here? It's an IP for FPGA fabric, so
even if you made some sort of zynq specific compatible (which I am not
advocating for to be clear) the IP configuration options may vary
between synthesis runs, so a SoC-specific compatible doesn't help.

>=20
> > nothing about which options were selected when
> > that instance was built, so it cannot imply the capability.
> >=20
> > Thanks,
> Best regards,
> Krzysztof

--08fKKcYaq9ThlrUA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoTq2AAKCRB4tDGHoIJi
0mRUAQCUVBheGN5Ri7cXbx4L9owWPH5dJRoznAlDgPOp5AXEEAEA97+z2zTdFGpA
Pe3QJaYr2Rjuuktm4K4mhgPPlUZ9+A4=
=afvG
-----END PGP SIGNATURE-----

--08fKKcYaq9ThlrUA--


--===============9041789447728924806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============9041789447728924806==--

