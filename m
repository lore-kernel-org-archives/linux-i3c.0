Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3307606A31A
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Oct 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H2+ot4mJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8mMZ80LZv9zDl91eQSnanf4PGX0dOhteFgB5uXSl7M=; b=H2+ot4mJ262WiS
	Z/9UtwITEykCXOaENkB6UdBbJmJxHRvVX11l8kXbnUIey35dN9bt2Zpr6tHk/sSzseVGwhnjqlnMb
	+KdsbQYYSyBFju9Xp+eDyFCMnSuF5OEcrNOJ9cewkF6fg3cdXuMO0ALFAhqfLeCXFNWFc26V1yOZq
	Hp92ZUTfRCH7yAEuZcxct61LXmdhFSZ1O+8yYOvHNUwminpXLjllWf/L4fOHitUfWuNrKT+n62011
	J5hAn1P4q8sn9Cbhkm1KtPVpAZcKMHGE8C2IoTSFPASLbx54c3jtRisfEsSnl0oCj5ZOKhRDZn5hW
	rXd8hmOyzJho9GWJDMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ682-00000009Hmz-2Dx8;
	Tue, 20 Oct 2026 09:27:30 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ680-00000009HmT-2SgT
	for linux-i3c@lists.infradead.org;
	Tue, 20 Oct 2026 09:27:29 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5e9528732b4so2410721e0c.0
        for <linux-i3c@lists.infradead.org>; Tue, 20 Oct 2026 02:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488447; x=1793093247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
        b=yO4kCcHJSLhMjONwWjcFYz246KK+3qSjyITUPFwHxPh+o+6VW473SNR0fA9+5uU0H6
         zVKGlgXPnNd0Dh5MC9CPzqeIye9IqD1UzSFWH5WYbBCIvhqeiRumlDM3PJgkajBv4Mhg
         so6w6yFLfGJdFWo/rJoR3MHfpkz8P6G30iAtLCTlaT6CfVrooh6u0Bt86dF/Qi9+yUZx
         2dSWQhuyxtdd7av5ULnyb2729kWizNDoVj0+9bsbvfefb6UpbDl3FBCgNp7F8f8Q3Iq7
         1Rkrv7GFiOE1y0R26A8X45NZ5Epfp4AN2E3PuUd1hM8y9gS5Dhqujz6h44zucNIGK5F2
         8eww==
X-Forwarded-Encrypted: i=1; AKwUvBxDvZJwp9E6RuUe7WCFIXGQmQnh9fDgKrFp9qL7IV+MLpJZ7xRigPYKS2UvUDrQYADGNSciHOwLgoY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJUymj0JLwpEQouSxeoqgkvLBcCtxtrYNqrfMJD8FsWJHmfdhOc
	Z1Sob9+Wx3XTEHWGqg0iC33ECFus+YLlFVmET2tO/Xo/k4le+KlAheXlWOA0YpByC58=
X-Gm-Gg: AYBFou1H5PkpTfJFVtt4x0gh5Bns7hLhxFMO1KkaGGAZa+nArGiqQr3ARmvHTWVoVF5
	jfIxw3sP/J1vRPwV3HVI7GmO5dRiLKDFIUYvZ2eHEHqrL2f/MHB3UAuRhdOLXL9GHjRNn2MMGX2
	DUXVPo8utFvH59oAQUArWtgNMP5ySdcfso7JS5yxdnE0gQd4oWyV41Q/3qbW4C9sehhsInYz8VL
	a5gqRlQtBJSY6MbAldmi6zIw02HTdxjU64cC/W09DsI/3wdDRYHQmJjQY1ddcqUkS/DSUw6a169
	9uxahd9Axfdit3YXveMgqzqZ0Zpf7sF+8kiQtnkD8Lgjvm1/1Kq+vS+crBCi4A1LabDr37tFUl5
	Cm/GiDUMqydBwF4hSPq6r4jA5tfLJAEgEDMaDjjL0fUO7zDonIbZYbgX1saEZIIH6zclENoMpFZ
	lqmPcb67x2wrFoKCTCi2xwRf9UjcUlz38FDYxlV9A8ClbfRukqeDPwblk6/obovAbB9pokOJtG0
	J1mox1uAbZ117ScIRBBFhDdWnoOlKtsQ6qwkmV3
X-Received: by 2002:a05:6102:38ca:b0:7cc:3246:3095 with SMTP id ada2fe7eead31-7cc36b3d24emr3403719137.34.1792488447019;
        Tue, 20 Oct 2026 02:27:27 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc7728d34fsm2250438137.10.2026.10.20.02.27.25
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1046643e0c.1
        for <linux-i3c@lists.infradead.org>; Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNFSVXr56cuWr7oj/WLmUz2E9UijNk0mvN2sxgFaIk90b0vKPT+0vpVHSCyH55kzAQa537IoLxJkk=@lists.infradead.org
X-Received: by 2002:a05:6102:1625:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7cc3691cf50mr3455060137.8.1792488445010; Tue, 20 Oct 2026
 02:27:25 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com> <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 11:27:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
X-Gm-Features: AclHuK-aAi-Edh8uIEyKFfeZ8ZpBiAefIme6DU1Cm8luHP5VW0oo3t3lyPOBTwA
Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
Subject: Re: [PATCH 1/8] i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_022728_638938_E80B33F8 
X-CRM114-Status: GOOD (  25.69  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Diogo,

On Tue, 20 Oct 2026 at 11:15, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
>
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Thanks for your patch!

> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,18 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>         if (!i3c->rate)
>                 return -EINVAL;
>
> -       i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +       /*
> +        * A pure I3C bus has no I2C devices, so the I3C core leaves
> +        * scl_rate.i2c at zero if not explicitly defined in DT. The
> +        * open-drain SCL fields of STDBR, which are used for the DAA
> +        * pending read, are derived from it though, so fall back to
> +        * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +        */
> +       if (!bus->scl_rate.i2c)
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);
> +       else
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +
>         i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);

This looks like a good opportunity to use the shortened tertiary ?:-operator:

    bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE

>
>         i2c_parse_fw_timings(&m->dev, &t, true);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
