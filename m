Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2306B606A324
	for <linux-i3c@archiver.kernel.org>; Sun,  1 Nov 2026 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HY5/DUZt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BtuJ+9TG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xzMBsWi0PKXu4ZrjsRdRsBmWxgaTRUmhHrCh0mYc9wI=; b=HY5/DUZt8PN2fNGON1MU1kI/88
	0ZyzUxwD1Kh+1HQPrYKnG8oqDDBw4akM+7YrWjhHmyr1FmKxJkcX6iWA4/vlc7GZCtlleSfTPB8LF
	uJzJGfi9g/OTOiPdt4PP6+O+us4HoqId4syoAepg9v6b5m61LQLfa1nrtmq/i8u/NlJZFbfFpiDkn
	+Xor7/U2RUXoaWrGTOJ3kIVejJpf8kil/O6nnfiQJtTseafVEIjIwo6iQXUjkqu8CHBDFQ8+mRMHx
	13js/47/jtUxl8Lo9sB/ZuQdozxN+3zxYEpUYGv8S1Q+cAci9nGpym3w8ErFYokqAaE5rflCrjsla
	Urs/raFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcG2-0000000EssB-3U7y;
	Sun, 01 Nov 2026 20:34:26 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcFm-0000000Espi-1jeU
	for linux-i3c@lists.infradead.org;
	Sun, 01 Nov 2026 20:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WEci
	nyzXvpzdrQbdmzGRVBkMmzuM3NlP9qlzk0r7u+M=; b=BtuJ+9TGthEvfHggV1K7
	8HCM7lmDmDVKnstgAkSutQeepbxM9f+LBjaFk5F7H0FOumehplkJKLqoJ4+ceSBh
	YK2ss/QChr71ijKyvjcVkjJLIy4l+mwVhX+S0+XWv8HGGxsgbS3TL9RxhUbSVG/E
	axv8+Pk12kFE5H2dIY84wmQcx62TwwtQW8iTi8kMfH2anW9M1GuJzYn0um/iNzoS
	MqQKrx44llXCiyQQ7aiR0H9+sB8qB7UaGm2wtCRRck41rxjhBhdU4H/PyL28+gfh
	1iQa6igkkswZenPR28OwGiM6B5IRigeuzt7kfw2me4EMvNskJM0zliJLQI9IogCF
	wA==
Received: (qmail 853660 invoked from network); 1 Nov 2026 21:34:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2026 21:34:07 +0100
X-UD-Smtp-Session: l3s3148p1@YnRo8zxfVKTB0HFD
Date: Sun, 1 Nov 2026 22:34:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
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
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r9a08g046: Add I3C support
Message-ID: <aueiPnMvmHQhFtM4@shikoro>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-7-2e76b87209bb@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-7-2e76b87209bb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_123410_744575_6B468491 
X-CRM114-Status: GOOD (  13.43  )
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

On Mon, Oct 26, 2026 at 11:35:50AM +0000, Diogo Ivo wrote:
> Add the I3C Bus Interface node to the RZ/G3L (R9A08G046) SoC DTSI and
> enable it on the RZ/G3L SMARC EVK, together with the required pin
> control.
> 
> The driver only consumes resources that are common to the RZ/G3L and
> the RZ/G3S (R9A08G045), so the node uses the SoC-specific
> renesas,r9a08g046-i3c compatible with a fallback to the
> renesas,r9a08g045-i3c compatible of the RZ/G3S, following the bindings.
> 
> The I3C pins are shared with RIIC3, so the controller is only enabled
> when the SW_I3C_EN switch is on.
> 
> The I3C I/O voltage can be set to 1.2V or 1.8V on the board through
> the SYS.3 (I3C_IOVS) switch, so configure the pin controller for the
> selected voltage through the power-source property.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Didn't double check the pinmux values, but rest looks good to me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
