Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F4606A327
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Oct 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w/vCOFA2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1StiYi4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+XaysiDJmDxNDrzHAnIUtgBLwmncexScMKZ5i+BYkgE=; b=w/vCOFA2r1mC1OabgeompU14m1
	4QrHfIO76ks1xxvwZ+HOVPakIRb2iNmlFR304Az9EfKECGUbbtVQtAGBrIem6JImwmmYA2XmBuQqu
	ybcoz2xeH9Nto9SGzF+Sd3eAyUo6a/OdAII5wiI23SwFUwhz1478Cqv18jwuz74OKzF+97Z+y7WRB
	/AI4xBzlwv2LWLIZGVtpYzFcR3b8Taz0XihLUmUpPFYXalz/NMTsQQA/Smv1ysbDmbFnaTtBTfDiy
	r1X2/RBHG0d62+bixi59PKqGncMuaNkauraqQdEFW59RJi4gUYvep9UuEeQJstUNSrdFmWmh07mSL
	y7Kkg/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLevD-00000004NDw-11g4;
	Tue, 27 Oct 2026 11:00:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bBY-00000001gBU-3H4D
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 10:23:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1C07600C8;
	Mon, 21 Sep 2026 10:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95551F000FF;
	Mon, 21 Sep 2026 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986223;
	bh=KeiDS35e7oDHwVYJ1jbiHDTcydj3LPI1RqwdLg/V/rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l1StiYi4RfoOPqgoNX1poiOFcPxlad0HHVR4LgotRAP93zWrY35dmUG4Nvdg5CTj3
	 YrQKm155U8J7D3AjlI8Kam8U4CJ3SWheQ0s0bd8y0qZiByYR08hVKUy8kFygMnNSFp
	 /f27J7sCr3AhKDtucR0BNgSXW5dRy+IoifrobCIrlLNO1+N90f5iyTTceK0AmRE98D
	 jmlrxOdHpx1TU89FFNIgIBN3SM1Jh6mFo11g9sLj3mIJP+u6tvzy+dy23bBnRQelyw
	 4YHseQfrcmJ2L1CJVofEZEjtG6AZZKgZ22oFtLJYYe9n4A454D2l7YpQ0VX8xOmCuX
	 WThWlEhsEp7jg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 44EA21AC52F5; Mon, 21 Sep 2026 11:23:39 +0100 (BST)
Date: Mon, 21 Sep 2026 12:23:39 +0200
From: Mark Brown <broonie@kernel.org>
To: zain_zhou@realsil.com.cn
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	Wei Wang <wei_wang@realsil.com.cn>
Subject: Re: [RFC PATCH 3/4] regulator: rts490x: Add driver for on-die
 regulators
Message-ID: <arEFq_jDaUcbbDvo@sirena.co.uk>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
X-Cookie: Too clever is dumb.
X-Mailman-Approved-At: Tue, 27 Oct 2026 04:00:47 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6359458797657840026=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============6359458797657840026==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f5/rSFUp8Yji7O/g"
Content-Disposition: inline


--f5/rSFUp8Yji7O/g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 20, 2026 at 06:05:00PM +0800, zain_zhou@realsil.com.cn wrote:

> Add regulator support for the four programmable LDO outputs in the
> Realtek RTS490x I3C hub. The driver exposes the LDO voltage and enable
> controls through the regulator framework while preserving protected
> register state across updates.

> +static int rts490x_regulator_unprotect(struct regulator_dev *rdev,
> +				       struct rts490x_reg_state *state)
> +{
> +	int ret;
> +
> +	state->restore = false;
> +
> +	ret = regmap_read(rdev->regmap, RTS490X_PROTECTION_CODE,
> +			  &state->original);
> +	if (ret)
> +		return ret;
> +
> +	if (state->original == RTS490X_REGISTERS_UNLOCK_CODE)
> +		return 0;
> +
> +	ret = regmap_write(rdev->regmap, RTS490X_PROTECTION_CODE,
> +			   RTS490X_REGISTERS_UNLOCK_CODE);
> +	if (!ret)
> +		state->restore = true;
> +
> +	return ret;
> +}

What's going on with all this restore tracking?

> +static int rts490x_regulator_probe(struct platform_device *pdev)
> +{

> +	if (!pdev->dev.of_node) {
> +		dev_warn(&pdev->dev,
> +			 "no OF node; skipping on-chip LDO registration\n");
> +		return 0;
> +	}

The hardware is there no matter what, you should just load the driver so
the state is visible.  Without constraints the hardware state won't be
touched.

> +	regulators = of_get_available_child_by_name(pdev->dev.of_node, "regulators");
> +	if (!regulators)
> +		return 0;

The driver should just register all the regulators the silicon has
unconditionally.

--f5/rSFUp8Yji7O/g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxBaoACgkQJNaLcl1U
h9DrEgf+KXidvn27tUTXYgVYcFZ0ex7DvlXgyKZmRRxKrLvcmKP7zfArl7kU5hn2
SI1FLzc3ZUSfJ91wZIe+loFnf/Vx7/pmt9KvN0IZqtmuI0q8pbsGGDPOb4xc/Mx6
MX/5aOUIrcHRGsxWUVJld1AYkG/Hp5z38/TlPxtdxQpP09artOzs4F1qXFUdcKMN
QtrtPgyUrMf9vJV3+QaEfIzU3XslZOqr7igO4+jeJbGtc8Za5FG7/StjbvrQoOkd
mxsTFhFLO9R4/QUjXz7ARi8JlAXl5WHaJiNhyoTrXXLlt/DbCIKLFA5cGd3gCA40
5VnO2kac3TjTifouGM5EgKWlv2P6Eg==
=RDhc
-----END PGP SIGNATURE-----

--f5/rSFUp8Yji7O/g--


--===============6359458797657840026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============6359458797657840026==--

