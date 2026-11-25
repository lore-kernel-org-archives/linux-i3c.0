Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5C5606A321
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2026 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jqL5LGR4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=dl8MaM9T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Y64Z/QrA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=otZIwnETuWI7DlLTuggdfWiP3kpJBacv3zJeLS5jkz0=; b=jqL5LGR41K5IN3ku+neni5Ihza
	7YC3k6L8XIlxgvzmphT2fW8OJM7IH1rC+CxfI6i16RG5wxRVQjntUhkSulDzZmNiN9dARRLbj1VVI
	77H9NkyhTtnBAxeCBL192fKGMyvk/iP/AZavcYnvFC3yiOaiqZwB0O/IYaEUDqEevOaIF5IXuftVX
	HUFur/6a0xPmtL42alHQvElZ4b2uLfWcivE71IEb4at50gXbsVr+ATwoLyrapczjqGTgdEp7PcyVS
	QVWsiXlMqhChcfBkMvL7lb4ISdzHXUDcpNgNazkBXvxkukYaDTYJ/AquZtw7YD7x/Y9ZEmJB3or8N
	B/0M9z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWD7Z-0000000A04r-0lMR;
	Wed, 25 Nov 2026 13:33:13 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWD7T-0000000A02b-0X1x
	for linux-i3c@lists.infradead.org;
	Wed, 25 Nov 2026 13:33:11 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 563531381093
	for <linux-i3c@lists.infradead.org>; Wed, 25 Nov 2026 08:33:02 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 08:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795613581;
	 x=1795617181; bh=lZ94QxStBmWvuh57ebyRfX4vKbEG8GHQMeQLMaRnd4s=; b=
	dl8MaM9Tqj6o5xay/RKtFaTthYBeCgyWC8R7WpBWMlK2lDg/f1EQyYG1m3Pe4Ywc
	lVABzr+yr4VgmBwTxd2XstrZuDBt2McO+j0wlN7LHHVaEejKOiCIH9zNrr55IaWr
	E7votpM5fvD2hjMykcWe6wmfjOdNUVcVxawNspjb/KhoY9ZGdixRR9p5szE8Kn89
	OW7fqtgkFzKb19STuuh9UB2eQAmy20WMLFJmKNlss1ZpFMBGz1DYb80srNnmM9s+
	KvDO2iHziz29cMJb4gQK8e9b4qGWL0+IVVj5KaZyWrYN8rvaZAxA78cmpzBvcmHZ
	YQoNvMceaH7Y5O9fYT2wNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795613581; x=
	1795617181; bh=lZ94QxStBmWvuh57ebyRfX4vKbEG8GHQMeQLMaRnd4s=; b=Y
	64Z/QrAWB6A+IiI2/DznKSzBxPW+XiV3bTqqVwQAs5Xzm0ub4l18ork6og9Q75y8
	OdmQGKvMC89fBUma+iobWNVuLAYiixIr0iWLMk5pzzv7xU6k1CqGoGKZS3M8FKK4
	yGglyN4DhbrdOcqgZsKseoQ/oUTXuBYt4e0mCCra1gFps+ItEU4CHh5DQhFWykQr
	CnLYjO/4n3i5h0VnujSKkDVJ6llnNoRaXnZOgmLN6XF66Bc5SloEourBelLEgjjM
	myi8No9HSLNidpusil41WJ/PZ5MJeRuoyV2NRQDqaBoBYCH5a23hz166a442+DP/
	5BajOLQprCbNQfq8OTVbQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795613581; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm1:rsa-sha256:RW5AzLoFA8W8WWKLsPsmTmCFAogE1cYo+KLX9Eydr6K4t6V
	Nu3tPvMyNcxL8lHsehX7KOxjfF2o76QVamFDpOut0Dd0m3XTN2V9aNmjW7qLll8c
	dXcwoZHvA2lQejJRErHeA2HCwFJV3F4bfEgqAUqZ+P+UyoBF3BOUYCGmYsdDrw+f
	1Z/0grlu8e+9CqGp/fTksL9kepCZcMaRrXghchCqGJtIlAtOCfXfMjJEotwnnjtR
	RrROy/FgF/hLFAw3tEe+MFcH/ZZ185wFBJGg6ivQKBOBD9WP7obmDnmwx9vmL+Et
	HnRNBjcAg8vNynbuQWaIkz39yVWboosqqgy2BBg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7cJsvaS7lbTz3rYQkijHx7yvNh02Gk1vDAtk3psyh7o=:DzNKiDvlAZNc8HUburqEwkbhsJnO+ybBRiUiAfsMzOE=;
X-ME-Sender: <xms:i-MGa54SgRP4rw1l2oiv4VFtAgY4SmTrEsKv9HanUXS4UgCnC2fDhw>
    <xme:i-MGaxu15U17rg4_tfWReWjdHV9j_lpMZlvlDOaWlNKP-N9jDT3hfzcvfG9pJnbHf
    zNJBTFrXc22-WP7PWdueGmWgzTekGSHN903uRfnx-bLrY-DuPd5p1XR>
X-ME-Proxy-Cause: dmFkZTEtWldhjuZyL8Czrx/E8FdB+HkbihUYPqdHTjRnEXwb+U7l6JtT0E7RPxRKpKjcLL
    fOF71znzbok9VLWNqOiOgBMncvgqy9fEuIEAAQTICF+rXBdRLvieOhTHZ45HWPkN9oHVFv
    OmVkw6tGcMTnL+LligSMTuIiaj+5IwhPa02ubeyAWxB54e+ndohIoLmd1++Pm5zpdXa2so
    XM3GnrLy4v75wE6Tc/NgA/TtV1pf34f982V8OQ7TSpGtXY/deAoLOCSqVuKtmv63/zd1z/
    GO6lty0Pk7zwyDcCjIzLLDRs/ai1ycHythbma0FYguYGLajG5KIQC48uYyVyZI+SVYUzPh
    yTfZBTI4f5J/SNrbIGx2AedchsZAlaqpHn7Tko9/5e4bLsrqxanPSmRll9MbHAxsInMTFm
    V2Gn2O0plBTAEBTAkTiwF+j0Vv+EUxir//XJvZCSx9a1FPhvPPXs1Z80Rhaf3QVqec+Fnp
    QbOKmDiSQyURE9LFufD7S3m8V5yeUlSmhJVDef7ffHuQgvahR67JuUAxr7fvwPV4VKQyFk
    pNGStEUkYhm1Rt2nreZ1ED5hRKbBqyftZCS59ItXzMXv+5X3CbCulvguQ7I3xMsJfHZm/k
    r6ACIm+5F676wWP9A/lYbLKsky8o5K17Cikutoj8csHIEqYyc9EBPoUu3miA
X-ME-Proxy: <xmx:jOMGa_d6O-I6WxPyjtym5Ad9skMCmetxm7a2Vw8q3yexmqsbx01H6Q>
    <xmx:jOMGa1XGElyYDtw4POx8ndXggIoZf9WPbevt9G2r2jeWNuCevf5tPA>
    <xmx:jOMGawfaXQyxwDrlv4vF4ZmKWqlN09Ez4h5uX316yxuWMgfxlwIbKA>
    <xmx:jOMGa5PfegnZPwUB221nVOecywatX-TRuvR5sVPT3RakmcF0e23S0A>
    <xmx:jeMGa_cd2pvx_zZP7aEe30JWmYL_i_sigI1pOptvKYHAR4AKV-o3vFWC>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 04E34F8009E; Wed, 25 Nov 2026 08:32:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-NbSchO8SUg
Date: Wed, 25 Nov 2026 14:32:38 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-i3c@lists.infradead.org
Message-Id: <664681f3-2939-469c-8594-370bbcb84b5f@app.fastmail.com>
In-Reply-To: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
References: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] MAINTAINERS: add renesas-soc list for the Renesas I3C driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_053307_538922_3FB154CE 
X-CRM114-Status: GOOD (  13.98  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026, at 11:49, Wolfram Sang wrote:
> To make them show up in our patchwork instance.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
