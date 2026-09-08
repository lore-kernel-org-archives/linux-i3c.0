Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FE6606A325
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4FT9w0Ek;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsDNps5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qkj/jb5Uc0x+J5totUPpNPqCntMmjIDnOlik7v0ByjQ=; b=4FT9w0Ekc2yZhtpXV/XfEC9mP0
	0QpJaVeN4Wlzbg6N5b/l/+6wOOHCetF6DVkS8nXJrHe5wdiQ4SDBcYbzq22xacCOVGwBAchIX6QPM
	Q3kaBaFuwtwJBbW8dfi8i0WNtNbMvUhhiLZIGbKotd93Fecwav6J0f/cDCk6LcyQ/KaIfey3irP/Q
	YnSiNc2jzljtWphMstmyLXlCSTRvHBdxATkBd+vjQWe+ufPmJ0++cQszu+19+hRM5HgU8SviHeYck
	djtJmVdd+CRPecBvF3RWGIXxFUWwWZlgLMsRYDIKJ9juVof5CLwMYGyTTnHqXTtZBRIzmcIkIXf8+
	ro5M8PEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevD-00000004NDi-0eXG;
	Tue, 27 Oct 2026 11:00:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x401j-00000009uAt-21p7
	for linux-i3c@lists.infradead.org;
	Tue, 08 Sep 2026 17:54:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28E5541B49;
	Tue,  8 Sep 2026 17:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3051F00A3A;
	Tue,  8 Sep 2026 17:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890075;
	bh=BK7Pb5f6hOmg5Ney1uPXvfbfTZG8f/SafOJm4kyr358=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bsDNps5VY3DQIHbZFNO1vmNjWd5u+T4PsyGzbpZHfNIN76rznC6bSg4e9Xtzi9S1/
	 PoasXXiY0ALETNAUzB5n2FWz5M46wu7mdSbN0OBPjnHevZ94LZ0gn5GyVSwVoobRA2
	 Uxb0CVyNTGyjxUBP74oGHAEmDMedfZ2BJcIdWkpGkF1E8POs2lCaRwPfENvsZ4SH5f
	 yga/cQ7rNQ+gvlIqSWzgNBVBn72n1zF3wofbk7jz0PSfrfb9e6Kypamqe2aMMSP01F
	 U2AI651mT9ZN52EOl9wCi9MObsolFzb36xoAk90T2Q+Tvz/tefnVeLfGoopIIOwKX1
	 Gp4iPd7l3AbkA==
Date: Tue, 8 Sep 2026 18:54:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260908-groin-undivided-0af701135404@spud>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
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
Content-Type: multipart/mixed; boundary="===============8120915390751947598=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8120915390751947598==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FMRvDAZvBKX3yjGb"
Content-Disposition: inline

--FMRvDAZvBKX3yjGb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
>=20
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
>=20
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
> Changes in V3:
> - Move in-band-interrupt-capable and hot-join-capable into the common
>   i3c.yaml schema and drop the xlnx, prefix.
> - Keep dependencies in the AMD binding.
> - Update the commit description accordingly.
> - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
>   binding [1].
>   That Acked-by is not carried here: the names lost the vendor prefix
>   and the definitions moved to i3c.yaml after Frank Li's comment.
>   [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@s=
pud/

I disagree with Frank. These properties make sense for Xilinx because it
is an FPGA IP and synthesis options impact this. For other devices, this
should be determined from the compatible.
Please revert to how things were done in v2, especially as no rationale
was provided for why these should be common.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Changes in V2:
> - Rename the properties to "xlnx,in-band-interrupt-capable" and
>   "xlnx,hot-join-capable", and expand their descriptions.
> - Express the interrupt requirement with dependencies: instead of an
>   allOf/if-then clause.
> ---
>  Documentation/devicetree/bindings/i3c/i3c.yaml    | 15 +++++++++++++++
>  .../devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml |  6 ++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentati=
on/devicetree/bindings/i3c/i3c.yaml
> index e25fa72fd7857..7430394cc6b9b 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -61,6 +61,21 @@ properties:
>        Indicates that the system is accessible via this bus as an endpoin=
t for
>        MCTP over I3C transport.
> =20
> +  in-band-interrupt-capable:
> +    type: boolean
> +    description:
> +      The controller supports In-Band Interrupts. A target can request
> +      attention on SDA/SCL by driving its dynamic address during bus
> +      arbitration, instead of using a dedicated side-band interrupt line.
> +
> +  hot-join-capable:
> +    type: boolean
> +    description:
> +      The controller supports Hot-Join. A target attached or powered up
> +      after the bus is already running can announce itself using the
> +      reserved Hot-Join address so the controller can assign it a dynamic
> +      address.
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml =
b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> index 2caa245a86568..9480de3fe8e1d 100644
> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -37,6 +37,10 @@ required:
>    - reg
>    - clocks
> =20
> +dependentRequired:
> +  hot-join-capable: [ in-band-interrupt-capable ]
> +  in-band-interrupt-capable: [ interrupts ]
> +
>  allOf:
>    - $ref: i3c.yaml#
> =20
> @@ -54,5 +58,7 @@ examples:
>          interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>          #address-cells =3D <3>;
>          #size-cells =3D <0>;
> +        hot-join-capable;
> +        in-band-interrupt-capable;
>      };
>  ...
> --=20
> 2.34.1
>=20

--FMRvDAZvBKX3yjGb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBL1gAKCRB4tDGHoIJi
0poQAQCLSpPeDIwNP31iFKBcmvHVCtAkP08+yE77wc12Mqs+NAD+LOWBpd18oZEy
yIp+uwmXkEOHSuVPSMYmoXPe9CkgvQA=
=zB1x
-----END PGP SIGNATURE-----

--FMRvDAZvBKX3yjGb--


--===============8120915390751947598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============8120915390751947598==--

