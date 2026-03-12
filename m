Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A51FF8875
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6Fb5PPt+huyXA+sNrMdGAglBaTVTGy0o4OMvliaYwo=; b=kCBXDe6v4DHKPewr+QUu6zu3hf
	9oF79GNBldBUcMrCpY++GHuZv6wek2XFLDuz0v58cPArBJtMiMCq+tcBl3ycOteHn/o6ElI0s8KR9
	2pe79eK1oX5AzL4xGgLscCWnQL4iB6xv+bDBb+pqtA/dc/VVoPRNIo85ctcWMWQOTBTNsdvUee2sh
	51etUHxlIEqsDZfycwI0HR8WJhf4nqEUuYZ7c1L0iw+m2GJaMibQy9p5PgED+MhmOmf7hZDTVs4St
	18gtzwnJPUgKv0hIPKWmAUD9JVK9ve/XFAVbAeWeC9ZA9sY5JNSZNAUH9GOneK6vNqrHQon1aVvoZ
	+LwJRiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOG1-000000059v8-0rOa;
	Thu, 30 Apr 2026 10:04:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kB7-0000000EmMg-3vED;
	Thu, 12 Mar 2026 17:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E76B61335;
	Thu, 12 Mar 2026 17:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C49C4CEF7;
	Thu, 12 Mar 2026 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337833;
	bh=KenJYZKQMESmdjBYhz51YSRSfZ9967IRk4t3Gg1r3Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDEHrdjvqz/MSMlfNSDxSUfMgfLBa5NbMksNsP12fREdHuaLP0aNobY8SPGe44x3T
	 hLv0YEeaFGOrYxVTn4fZmMAj5LdLofgqsCD6sXyjwqUVhD4POx+Sodo3eqL3rHkjVn
	 A3ADHv2uwlBzxfwGoc3jbUCnGOVPlAfRiPD2wfAiVdmAzn6ZM0eiyWUnDFRWpZhktw
	 3/eOBtODVr0SsX43YuGFNLPHN9xAtoxkntlPKMx7pGJ33CYtLjbCD3DHQRrhtMv9Dn
	 qMtLbzqi6odHsTwMjvFOqo2ueCJvy07NDJWl5PX/88/JAVuBu4iEw+KT79Ch/Mc9oI
	 rCM0jv2N3Htbg==
Date: Thu, 12 Mar 2026 17:50:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
	ardb@kernel.org, ebiggers@google.com, martin.petersen@oracle.com,
	tytso@mit.edu, cristian.birsan@microchip.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	kees@kernel.org, npitre@baylibre.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip
 SAMA7D65 compatible
Message-ID: <20260312-ardently-untoasted-4f4b79be27c4@spud>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
 <20260312042056.309237-2-manikandan.m@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20260312042056.309237-2-manikandan.m@microchip.com>
X-Mailman-Approved-At: Thu, 30 Apr 2026 03:04:32 -0700
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
Content-Type: multipart/mixed; boundary="===============4786244924517766687=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============4786244924517766687==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MqJz2bOHOp/6kCsJ"
Content-Disposition: inline


--MqJz2bOHOp/6kCsJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 09:50:52AM +0530, Manikandan Muralidharan wrote:
> Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
> HCI binding. The Microchip SAMA7D65 I3C controller is based on the
> MIPI HCI specification but requires two clocks, so add a conditional
> constraint when this compatible is present.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Do=
cumentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> index 39bb1a1784c9..db659388a27d 100644
> --- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> @@ -9,9 +9,6 @@ title: MIPI I3C HCI
>  maintainers:
>    - Nicolas Pitre <npitre@baylibre.com>
> =20
> -allOf:
> -  - $ref: /schemas/i3c/i3c.yaml#
> -
>  description: |
>    MIPI I3C Host Controller Interface
> =20
> @@ -28,7 +25,9 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: mipi-i3c-hci
> +    enum:
> +      - mipi-i3c-hci
> +      - microchip,sama7d65-i3c-hci
>    reg:
>      maxItems: 1
>    interrupts:
> @@ -39,6 +38,21 @@ required:
>    - reg
>    - interrupts
> =20
> +allOf:
> +  - $ref: /schemas/i3c/i3c.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sama7d65-i3c-hci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - clocks

Properties should be defined at the top level, and only restricted in
conditional schemas. Please add them at the top level, and provide some
information as to what each clock is via a description.

pw-bot: changes-requested

Thanks,
Conor.

> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.25.1
>=20

--MqJz2bOHOp/6kCsJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL84gAKCRB4tDGHoIJi
0hwzAQDHnz6O+/P97VuIJwNyaCiCSQPZ7MZTZ7H2o3gahOSGrwEAwavDxaOoHF7y
GpcyvuVbOusizFUCT/bZu8hFfGO9NAg=
=L5KA
-----END PGP SIGNATURE-----

--MqJz2bOHOp/6kCsJ--


--===============4786244924517766687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============4786244924517766687==--

