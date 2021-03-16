Return-Path: <SRS0=AFd6=JV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAD1C43460
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B2E61422
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0B2E61422
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E5VmzghcwooveUPDq+1Yh0+KOIlnurjmonxG63WEUE0=; b=B3dqMeOq6HCwv5lRzcVeCPI9F
	bj5PHaR3OKCW6U5c6QH9jJtIPptrVr/IlKnpNwDkqzW2gO4bl6R5GNWOQvPr3HAR17pLiqqL5VT0s
	VSqAOle/8xIqiBGOi9lqPD40V2Pbu2Dtv+1dW95e3kNRkgzzfAvjrTRudzDBlJjULOuWZ6YvWh6f2
	y2sUJ8i1QlFuqq7ROi9h93dsi42zQ4j3ta3fRgp8INwTHGKCjvjVFlvYaL3/SedXBjnNN4bwI4YdY
	DP6QmYAwWEl2du3VCWvUYUrXCSVTDJyoWLb9WGAd8Gf5YemxA2O5U2yuVexDqo21Y/OoHjrwwEpN6
	Mdr7npu0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laOgb-004Mrn-Ou; Sat, 24 Apr 2021 20:15:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMGgP-001qds-0Z
 for linux-i3c@lists.infradead.org; Tue, 16 Mar 2021 20:52:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1884A64E76;
 Tue, 16 Mar 2021 20:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615927971;
 bh=+dogfZ43isbezmZjR8u8oBMqRI6I4K4OVSRSSOGkf2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YsWIEAjJBm0D4M77EqdYv/Leo+bMmaYAGUvI3VajtyYywcW/JFPzh9x57v3mfmwYf
 YujlNJ+DBnuMusWrdfsN5gE1NlqpjUhmetkDfYik8DMM5yVHfoGGOJmNalRdHKTa6e
 /0Ld2f5x1W77S1HfwxS33vLAcM4FgvAoeV/fKPZE+hHoZY6KURxMIPw+1a1PXp9y8g
 eunsT2Tyv4+e/D2OgmBt2QBInqyEYuQpiF83O2YubdBBj+M54t5spPbxr0M0vWZo+5
 fLJWcoGeXbyDgeobIKGeDLNj0hvA40Mb+Vpm01QLUawGk9fGKZxrebA+3ia2HFX5Jw
 dkdqEWX2XCtww==
Date: Tue, 16 Mar 2021 20:52:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Clean-up undocumented compatible strings
Message-ID: <20210316205249.GG4309@sirena.org.uk>
References: <20210316194918.3528417-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210316194918.3528417-1-robh@kernel.org>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_205253_264534_3A18E5BF 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 24 Apr 2021 21:15:23 +0100
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
Content-Type: multipart/mixed; boundary="===============6731878153778036790=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============6731878153778036790==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lQSB8Tqijvu1+4Ba"
Content-Disposition: inline


--lQSB8Tqijvu1+4Ba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 01:49:18PM -0600, Rob Herring wrote:
> Adding checks for undocumented compatible strings reveals a bunch of
> warnings in the DT binding examples. Fix the cases which are typos, just
> a mismatch between the schema and the example, or aren't documented at all.
> In a couple of cases, fixing the compatible revealed some schema errors
> which are fixed.

Acked-by: Mark Brown <broonie@kernel.org>

--lQSB8Tqijvu1+4Ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBRGqAACgkQJNaLcl1U
h9AAYwf/QQEXJESFxZVZKApeC2ypxUDckOjIAXw+3ZZYA3a9Mx/MllGedYIfGyqx
aONmpU5uRZxnWP50YGV5Y5oYS6er1ey2MwMikahPpMxhLoUfXVdEQgsocEJxquWg
3L0Yf9+3IZPTx0uH5yeyhiFnlUCjHxhm1CE3h1sKgQJsytcX+pHiew/vRQSfU8xW
JDEEuG1WfeQgOQ7VU3RthJ118ifcy+QeZaU2oSA6GsrpFdQk/qyVUyIF3FVGCeck
TAASFFWk7hmMFicdUN2pxZ3aUYewYwlZAsp2DdrfEvf2vIKCPxeVuLP8qSQ4O68+
/7rhwzcbiO5Nkq6aIxXzcZ19meepFg==
=bmyZ
-----END PGP SIGNATURE-----

--lQSB8Tqijvu1+4Ba--


--===============6731878153778036790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6731878153778036790==--

