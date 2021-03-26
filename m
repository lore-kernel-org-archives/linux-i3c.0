Return-Path: <SRS0=AFd6=JV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBEDC43461
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F18461452
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F18461452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f/gr95/L5Fu05Aydfw2Rq6wGbkXXxG6BdabtPsnsTbs=; b=cOE28/6x3ai+OslxyYs7lq+DN
	wZNDL/iJNO2KoUPYfy+ZUmccSpDTHlCkd5U9j3gjaL1U3gPfhJ8sV6nb8Wunx31ywldJrHsvP6zg8
	DHSnxAwljnlJeSvhkAM+FrFwDj1NHLFkP+Mnn21zMl0LXKDPF78GLSMdaCYNmDat6OfyQe6JmO9l3
	/jyf9LFwm1HfUMHehIWnTVBQKl6aGGuYcWGP6yyhlIuO4Ebu8KLsggILKRdYpFYP4SYri03/M1AnZ
	HAJqBW7RvdSc660fpi4Qpk+NwDFyQ97DOsnIBZvc9G3INur1EqFkyxVHIQ1q0FTalD6vOMsS8INUu
	5+6WelVrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laOgp-004Mu9-VZ; Sat, 24 Apr 2021 20:15:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPllt-003WuM-OH
 for linux-i3c@lists.infradead.org; Fri, 26 Mar 2021 12:41:03 +0000
Received: by mail-ed1-x535.google.com with SMTP id l18so6128937edc.9
 for <linux-i3c@lists.infradead.org>; Fri, 26 Mar 2021 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ai/sBaJhqrRCWGFUEsUnLWF/QfwBQ52U7SGdirULJxA=;
 b=uCjETYGYNoXkWFnAnxrREMGnWCf4CT3WkSUcUIwelIYp/DG4PNHW59MxV0ndLkmKgw
 L2IWwNo6EyYyTYDtD8OnYmHTc3e6jv9884w6qBn83ztCcGKzBTfT9VZi4FrsY0fAmdgD
 ur9rC0Au9YibHKnhDtRtnuR6TmiDKHMLiKkdFQBru/Rg3CNOG0AO1xf2t/BfGdTfqqmA
 XwvFfXkcKbOAT7hy7hseEdn4+/SVJmzCmlcRTdfpBXzf34azVckBOAtF5T9AGODNsmHi
 JB9fYSTh7FLf8XAc67eXw0GuTEJ4SVHnGJeGbaLRFM/fngNYTBDvYjVjkIiDqEkKOz/Z
 NJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ai/sBaJhqrRCWGFUEsUnLWF/QfwBQ52U7SGdirULJxA=;
 b=YKYtLdZNLbesUISuk3ER+9xCpJdtL4RgHgdfLcmreaP6edvmlic6Ei9uR43vYrJlCc
 RhZ8LbmWw78DJkSKabDiB9OUHQZ9H+W6nMygnbW0JM9FL49KAQQWGHnGwtgfaZxm4MLJ
 NoRP3y9kJDbNYLbRvqsQXppu7KQukmNF9MRu3OXyR/FwgpDTgBQG3zUfZ05lBKSK+bL0
 4sLsVt0LbeT1tCtfuIQLJxodxREs0C3dlxxaBklkoAXXNABC8mk3HsBiTbWIBQOCExjD
 3rjy7YoXEI1Dq+1gkLoykXSO2teokQLSshM56mho8JHXZq8fQjE7gKOG2gtbnoiufx/Q
 4iyg==
X-Gm-Message-State: AOAM531/buj6OXmWbh94Lm82eOtPPzxcCELRS1ULbw4qm5ZxwttuXpG+
 euHvZxWvdS3hVj7P610FbYE/NSx1AXE=
X-Google-Smtp-Source: ABdhPJyBfhRplv3kSXtcQVbf9j3CtTsxKbJ2vdFf6xxPS0KZwTr0+U5i0X7OFEFWWah2Xup+2PjS6w==
X-Received: by 2002:a05:6402:254f:: with SMTP id
 l15mr14885368edb.189.1616762461102; 
 Fri, 26 Mar 2021 05:41:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id x1sm3830371eji.8.2021.03.26.05.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 05:40:59 -0700 (PDT)
Date: Fri, 26 Mar 2021 13:41:22 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Clean-up undocumented compatible strings
Message-ID: <YF3WctL0BJON130C@orome.fritz.box>
References: <20210316194918.3528417-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210316194918.3528417-1-robh@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_124102_057285_7FDCDE34 
X-CRM114-Status: GOOD (  15.73  )
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
Content-Type: multipart/mixed; boundary="===============0751962824030307979=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============0751962824030307979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="anrc3HovXG4wMGPC"
Content-Disposition: inline


--anrc3HovXG4wMGPC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:49:18PM -0600, Rob Herring wrote:
> Adding checks for undocumented compatible strings reveals a bunch of
> warnings in the DT binding examples. Fix the cases which are typos, just
> a mismatch between the schema and the example, or aren't documented at al=
l.
> In a couple of cases, fixing the compatible revealed some schema errors
> which are fixed.
>=20
> There's a bunch of others remaining after this which have bindings, but
> those aren't converted to schema yet.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-clk@vger.kernel.org
> Cc: dmaengine@vger.kernel.org
> Cc: linux-i3c@lists.infradead.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../clock/allwinner,sun4i-a10-pll1-clk.yaml   |  2 +-
>  .../bindings/clock/milbeaut-clock.yaml        | 12 +++++----
>  .../bindings/display/brcm,bcm2835-dsi0.yaml   |  6 -----
>  .../bindings/display/panel/panel-dpi.yaml     |  2 +-
>  .../devicetree/bindings/dma/qcom,gpi.yaml     |  2 +-
>  .../devicetree/bindings/i3c/i3c.yaml          |  7 ++---
>  .../iio/adc/brcm,iproc-static-adc.yaml        |  5 ----
>  .../iio/gyroscope/nxp,fxas21002c.yaml         |  2 +-
>  .../bindings/iio/light/upisemi,us5182.yaml    |  4 +--
>  .../interrupt-controller/loongson,htpic.yaml  |  2 +-
>  .../devicetree/bindings/leds/leds-lgm.yaml    | 26 ++++++++++++++++---
>  .../bindings/phy/ti,phy-j721e-wiz.yaml        |  2 +-
>  .../bindings/power/supply/cw2015_battery.yaml |  2 +-
>  .../bindings/power/supply/power-supply.yaml   | 22 ----------------
>  .../devicetree/bindings/serial/serial.yaml    |  2 +-
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  4 +--
>  .../bindings/spi/spi-controller.yaml          | 21 ++++++++-------
>  .../devicetree/bindings/spi/spi-mux.yaml      |  8 ++----
>  .../devicetree/bindings/spi/st,stm32-spi.yaml |  6 -----
>  19 files changed, 58 insertions(+), 79 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--anrc3HovXG4wMGPC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBd1nIACgkQ3SOs138+
s6EKNw/+PWZ5d3e0xEwvPK7F2Ar6aLwrAZTugsDRjLWV08E7tyOy+G9o7fONJcWa
rYcXHvrQzc3Vr6/H0Aht9gv8h4N1ouQlIYbKkommVUDHWZlKKKKuf2UW9DeIzbLp
jRdHkqZsdlRy/1UZGl7oXPsDf+OIYG04QbOA1+uBhqW+BdpfEC59ouN/KDCou9aq
7JvFVhtOB5SZBDQhNNyY9VINpf7uHivV+onqfwg40fO/QTkYaHINb29gb73NBZWr
fqP16h7YrpKw+JqePYucWisMfZ8hubG6mNypAlhnRBdaqhoPm+OwmRFfbb9hE0f4
VtTBHT2HndgpshRyqJZegJUueeRQX5scz0IYfDdpHSvJ/+bvZ3HwmxOG3XHOIsEz
o36PE9KKIX3b9PZqEtMrNfnC7a9KzlnGJzQ0N+ZKvNZufnlkpbGuKC2PN/gTnADi
p6Shg4Nz6Jg67p2nWhIoFWMA1sYd1b18urfFn133K3B4R+6ox7NfDl7jDoLO//rO
qxgp4aySmSZyGC0LnhX/rjThoVGggs/Ph99sxbDaObX1bed7K/3MVfuFHv9dgNxq
BMerE+S1zd+XdeI1iSdQ459gqtFuWyTNTX4Atm3ddd+7P1Ay7iRMjyAjZ5MgwUvn
NUVQ+ss5oAt4BguhMPXeKvkkJEDQWl8xSzXm5qd39jSxZ06FAL8=
=w24T
-----END PGP SIGNATURE-----

--anrc3HovXG4wMGPC--


--===============0751962824030307979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============0751962824030307979==--

