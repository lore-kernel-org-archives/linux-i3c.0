Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3390E606A31D
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Oct 2026 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oh144gcB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DKYsAIPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BKC3OP6RWcwWuR/66Az6iJNwereu3/XZU2fm09TseGw=; b=Oh144gcBdi1nTAsVK5N8PcaK1u
	VCg2yqVZTvyWx4JtTAGZwCsgLlCmBxDPSLIdNirkisKppkxulGy0zSpUDB8SxASj4Hv2aFXi5mq54
	0DlpCbF77C6ChbEyqd56QWtuU424JLQTihMTmQKkq8iki0/8EU36fOB4G8DIPNSUnRuapDmGM27Th
	m95fIFiAYDzmO5QvL7Mc85vTjZhivI6wb70+ha6Wr4pCfp1cNZfeMgETQIAparLtcOB46kMBCCeih
	10Y+5h7LZkj9GDDfhuFLFaurIOttKwqzsgQ0VRP1suVfaBdEdlKZ+bjTJ79ajSNzG0SOaPghz2JH/
	AzQcoFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCmL-0000000GBOK-3tCu;
	Fri, 23 Oct 2026 10:45:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCmJ-0000000GBNs-1gJj
	for linux-i3c@lists.infradead.org;
	Fri, 23 Oct 2026 10:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b61N
	7diDmGazKFB3UaE43uvQV68VXVLWOmtAASrPvHY=; b=DKYsAIPwqA/Di1b5Tizp
	TFFcsd0MEIIhMyZr0NIH3Q90HchcsSsQQGvYsiBju8er5/1V0o0IgH7QlBzvAfNh
	/gJpzq+dDtTIwt9SDYaMt2qzEroeMJ3jARFue9aBvkEmSBdq2O3kh0cXk2CEWp8o
	YKsmxjWdEZJ54jJPEAk9i0Mu0lgcM0nF42YYqZZMERfbYlHqZgDspMBzUGT2r1Uj
	K/Fywzg4rJG87KGnKUUxQs6jRMDrsOhZWuLtle9FsTuavNAdNor13bA4tNjnuM5s
	wMxkgq9PwJOCnc2n16/HB7SA3dDeu5emL2Kp7uHFv/+yb6/u2adLQtGehuFjZnhH
	1g==
Received: (qmail 1517709 invoked from network); 23 Oct 2026 12:45:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 12:45:35 +0200
X-UD-Smtp-Session: l3s3148p1@cpAfrn9eFpoujnv2
Date: Fri, 23 Oct 2026 12:45:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Diogo Ivo <diogo.ivo.sx@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
Message-ID: <ats6zi2lZW09Bs2e@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
 <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_034539_753551_7944942D 
X-CRM114-Status: GOOD (  25.71  )
X-Spam-Score: -2.1 (--)
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

On Fri, Oct 23, 2026 at 10:28:16AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
> > Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
> > SoC by adding the renesas,r9a08g046-i3c compatible to the OF match
> > table.
> > 
> > The controller is very similar to the IP on the RZ/G3S. However, for
> > instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
> > RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
> > therefore cannot be described with the RZ/G3S compatible, as its bindings
> > require at least 17 interrupts. The same point applies to RZ/G3E, that
> > requires 3 clocks while the RZ/G3L requires 2.
> > 
> > From the driver point of view there is no difference between the two
> > SoCs: the driver only consumes the tclk clock, the presetn and tresetn
> > resets and seven named interrupts (resp, rx, tx, st, sp, tend, nack),
> > all of which are among the 16 shared ones. No driver changes are needed
> > besides the new compatible.
> > 
> > Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> > ---
> >  drivers/i3c/master/renesas-i3c.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 4fddc1b4fdbb..80a6df1151bf 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
> >  
> >  static const struct of_device_id renesas_i3c_of_ids[] = {
> >  	{ .compatible = "renesas,r9a08g045-i3c" },
> > +	{ .compatible = "renesas,r9a08g046-i3c" },
> 
> So fully compatible? If so, drop this and express compatibility in the
> bindings.

Well, this SoC has 16 irqs / 2 clocks. The other variants have 16 / 3
and 17 / 2. So, to which one should it be compatible? I'd think 17 / 2
is the easier one.

Or should we even refactor r9a08g047-i3c to be compatible with
r9a08g045-i3c ? We currently don't use the third clock as well. That
would mean deprecation of the old plain 'r9a08g047-i3c' binding, of
course.

Opinions?

(And yes, hooray to having all permutations per SoC. Waiting for the
next one to have 17 / 3 :/ )


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
