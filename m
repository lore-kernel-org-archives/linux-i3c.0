Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E47C27C53
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQjAiFEbU8LjQR36AZdoZlmCeM3shyp/PA+bACZNMHM=; b=HRxl4iGZjj8LF4FZLbFo3+a25K
	gBvV7pIvALLzlr4CjRI9TzvV3RduaKlIiCdg6iV+JEp4KtVacHUyMNYqDBwumeLbvwrO0AE2KqdEs
	MF+ZtfgUHfhA0EBMxHzWpvP22h13ae/u/eN5xPQX3groI3cnDstncd9Ietid6JRhyS8YAYlD/w/8k
	W5xlq4gqDyPukPl5/SoRsO12t3pyxC4ZOrqjOjgNXwmNZbPDWeXjmKD2iumlrAiAWmGQrsHbupGag
	anb8BpTRr2zkevWGcIRjTV+giK2ZbJcXPauPWE2CJwu+k+Wr7lx7Zs7+I6F12DbZJjHJMRLXv9Yhv
	ngQYCPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL93F-0000000CuAB-354S;
	Sat, 22 Jun 2024 22:17:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5xG-00000009nXW-095A
	for linux-i3c@lists.infradead.org;
	Tue, 11 Jun 2024 18:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A0DE60BAD;
	Tue, 11 Jun 2024 18:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4745C2BD10;
	Tue, 11 Jun 2024 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718129445;
	bh=TjzdMfhIprBIYXA1Ded7MQ848LN5/jfRqWbIpulmQvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8tNwlcKIt1/wAXVS5HNNI/G+aDoD+Cy+B+GzOC7ogR+dsbMBzRZbp/0A1sAsXeRP
	 WYTHIkKi3hMbzKEJqCOqJyC+sosflnqJmszos6oMHQSg2vtqnr2FY8sse1g2e5W0+H
	 AeR8PR1iXxAQwBm9sQdjCkyEjqGepvnEvaS3vawHoioswWRdx/GXHO4RFf3q3m4hTI
	 zlvxZhb0yDfDRLb+XHdgQy8w+8OQ3mmlxkSAovU6m+NCT9dI/Ox9kCOgkicNXK85as
	 Klr5HC5t3x1ML/lwytCzyTf248TqKivtJ82ZpzlxdhkqTDjDnfGwWKC/Mqw8vhGeKQ
	 lANhMUqeLhBzQ==
Date: Tue, 11 Jun 2024 19:10:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Aniket <aniketmaurya@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add clock binding
Message-ID: <20240611-alphabet-dubbed-d6c3a56e7208@spud>
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240611171600.1105124-2-aniketmaurya@google.com>
MIME-Version: 1.0
In-Reply-To: <20240611171600.1105124-2-aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_111046_231251_B9A2E80F 
X-CRM114-Status: GOOD (  15.33  )
X-Mailman-Approved-At: Sat, 22 Jun 2024 15:17:39 -0700
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
Content-Type: multipart/mixed; boundary="===============4251258972609363637=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4251258972609363637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AJEiS4jL6BfZv+VG"
Content-Disposition: inline


--AJEiS4jL6BfZv+VG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 05:15:59PM +0000, Aniket wrote:
> Add dt binding for optional apb clock.
> Core clock is mandatory. Also add
> an example.

Please fix your line wrapping here.

> Signed-off-by: Aniket <aniketmaurya@google.com>

Full name please.

> ---
>  .../bindings/i3c/snps,dw-i3c-master.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index c0e805e531be..7e3d4f308477 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -20,7 +20,16 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Core interface clock

s/interface //.

> +      - description: APB interface clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core_clk
> +      - const: pclk

Why not name them "core" and "apb"? Putting "clk" in both names is
redundant infomration, we already know they're clocks.

> =20
>    interrupts:
>      maxItems: 1
> @@ -49,4 +58,12 @@ examples:
>              pagesize =3D <0x8>;
>          };
>      };
> +  - |
> +    i3c@10400 {

No need for an extra example for this.

Thanks,
Conor.

> +      compatible =3D "snps,dw-i3c-master-1.00a";
> +      reg =3D <0x10400 0x1000>;
> +      interrupts =3D <8>;
> +      clocks =3D <&i3c0_cclk>,<&i3c0_pclk>;
                              ^^
			missing a space here.

> +      clock-names =3D "core_clk", "pclk";
> +    };
>  ...
> --=20
> 2.45.2.505.gda0bf45e8d-goog
>=20
>=20

--AJEiS4jL6BfZv+VG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmiTIAAKCRB4tDGHoIJi
0vecAQC9e41GbhP5Enju1g8aTW6hHW9ASQpnsTQWipyRbCAcGAEAry2a4LactviZ
jCwkwT8BlTp06IV6M5Mh7kQR13zwJgE=
=/2we
-----END PGP SIGNATURE-----

--AJEiS4jL6BfZv+VG--


--===============4251258972609363637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4251258972609363637==--

